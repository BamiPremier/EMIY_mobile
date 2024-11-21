import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/quiz/models/question_quiz.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';

part 'create_quiz_question_state.dart';

class CreateQuizQuestionCubit extends Cubit<CreateQuizQuestionState> {
  final QuizManageCubitManager quizManageCubitManager;
  final QuizService quizService;

  CreateQuizQuestionCubit(this.quizService, this.quizManageCubitManager)
      : super(const QuizFormInitialState()) {
    initializeForm();
  }

  TextEditingController _questionController = TextEditingController();
  List<TextEditingController> _propositionControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  int? _correctAnswerIndex;
  String? imagePath;

  void initializeForm() {
    if (state is! QuizUpdateQuestionFormBuildState) {
      _questionController = TextEditingController();
      _propositionControllers = [
        TextEditingController(),
        TextEditingController(),
      ];
      _correctAnswerIndex = null;
      imagePath = null;
      
      emit(QuizCreateQuestionFormBuildState(
        propositionControllers: List.from(_propositionControllers),
        questionController: _questionController,
        correctAnswerIndex: _correctAnswerIndex,
        imagePath: imagePath,
      ));
    }
  }

  void initializeUpdateForm(QuestionQuiz question) {
    _questionController = TextEditingController(text: question.label);
    _propositionControllers = question.responses
        .map((response) => TextEditingController(text: response.label))
        .toList();
    _correctAnswerIndex = question.correctAnswerIndex;
    imagePath = question.image;
    
    emit(QuizUpdateQuestionFormBuildState(
        propositionControllers: List.from(_propositionControllers),
        questionController: _questionController,
        correctAnswerIndex: _correctAnswerIndex,
        imagePath: imagePath,
        idQuestion: question.id!));
  }

  void addProposition() {
    if (_propositionControllers.length < 4) {
      _propositionControllers.add(TextEditingController());
      _emitUpdatedState();
    }
  }

  void removeProposition(int index) {
    if (_propositionControllers.length > 2) {
      _propositionControllers.removeAt(index);
      if (_correctAnswerIndex != null) {
        if (_correctAnswerIndex! == index) {
          _correctAnswerIndex = null;
        } else if (_correctAnswerIndex! > index) {
          _correctAnswerIndex = _correctAnswerIndex! - 1;
        }
      }
      _emitUpdatedState();
    }
  }

  void selectCorrectAnswer(int? index) {
    if (index == null) {
      _correctAnswerIndex = null;
      _emitUpdatedState();
      return;
    }

    if (index >= 0 && 
        index < _propositionControllers.length &&
        _propositionControllers[index].text.isNotEmpty) {
      _correctAnswerIndex = index;
      _emitUpdatedState();
    }
  }

  Future<void> onPickImage({required ImageSource source}) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      imagePath = pickedImage.path;
      _emitUpdatedState();
    }
  }

  void _emitUpdatedState() {
    if (state is QuizCreateQuestionFormBuildState) {
      emit(QuizCreateQuestionFormBuildState(
        propositionControllers: List.from(_propositionControllers),
        questionController: _questionController,
        correctAnswerIndex: _correctAnswerIndex,
        imagePath: imagePath,
      ));
    } else if (state is QuizUpdateQuestionFormBuildState) {
      final updateState = state as QuizUpdateQuestionFormBuildState;
      emit(QuizUpdateQuestionFormBuildState(
        propositionControllers: List.from(_propositionControllers),
        questionController: _questionController,
        correctAnswerIndex: _correctAnswerIndex,
        imagePath: imagePath,
        idQuestion: updateState.idQuestion,
      ));
    }
  }

  void reset() {
    _questionController = TextEditingController();
    _propositionControllers = [
      TextEditingController(),
      TextEditingController(),
    ];
    _correctAnswerIndex = null;
    imagePath = null;
    
    emit(QuizCreateQuestionFormBuildState(
      propositionControllers: List.from(_propositionControllers),
      questionController: _questionController,
      correctAnswerIndex: _correctAnswerIndex,
      imagePath: imagePath,
    ));
  }

  void submitQuestion(Quiz quiz) {
    if (state is QuizCreateQuestionFormBuildState) {
      addQuestion(quiz);
    } else if (state is QuizUpdateQuestionFormBuildState) {
      updateQuestion(quiz);
    }
  }

  void addQuestion(Quiz quiz) async {
    final stateBefore = state as QuizCreateQuestionFormBuildState;
    
    if (stateBefore.questionController.text.isEmpty ||
        stateBefore.correctAnswerIndex == null) {
      return;
    }

    final nonEmptyPropositions = stateBefore.propositionControllers
        .where((controller) => controller.text.isNotEmpty)
        .toList();

    if (nonEmptyPropositions.length < 2) {
      return;
    }

    final question = QuestionQuiz(
      label: stateBefore.questionController.text,
      image: stateBefore.imagePath,
      responses: nonEmptyPropositions
          .map((e) => QuizResponse(
              label: e.text,
              isCorrect: stateBefore.correctAnswerIndex == 
                  nonEmptyPropositions.indexOf(e)))
          .toList(),
      correctAnswerIndex: stateBefore.correctAnswerIndex!,
    );

    try {
      emit(const QuizCreateQuestionLoadingState());

      var data = FormData.fromMap({
        ...question.toFormData(),
        if (stateBefore.imagePath != null)
          "image": await MultipartFile.fromFile(stateBefore.imagePath!,
              filename: basename(stateBefore.imagePath!))
      });
      
      final response = await quizService.addQuestion(data: data, idQuiz: quiz.id);
      final updatedQuestion = QuestionQuiz(
          id: response.id,
          label: question.label,
          image: response.image,
          responses: question.responses,
          correctAnswerIndex: question.correctAnswerIndex);

      emit(QuizCreateQuestionSuccessState(updatedQuestion));
      reset();
    } catch (error, trace) {
      emit(QuizCreateQuestionErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void updateQuestion(Quiz quiz) async {
    final stateBefore = state as QuizUpdateQuestionFormBuildState;

    if (stateBefore.questionController.text.isEmpty ||
        stateBefore.correctAnswerIndex == null) {
      return;
    }

    final nonEmptyPropositions = stateBefore.propositionControllers
        .where((controller) => controller.text.isNotEmpty)
        .toList();

    if (nonEmptyPropositions.length < 2) {
      return;
    }

    final question = QuestionQuiz(
      label: stateBefore.questionController.text,
      image: stateBefore.imagePath,
      responses: nonEmptyPropositions
          .map((e) => QuizResponse(
              label: e.text,
              isCorrect: stateBefore.correctAnswerIndex ==
                  nonEmptyPropositions.indexOf(e)))
          .toList(),
      correctAnswerIndex: stateBefore.correctAnswerIndex!,
    );

    try {
      emit(const QuizCreateQuestionLoadingState());

      var data = FormData.fromMap({
        ...question.toFormData(),
        if (stateBefore.imagePath != null && 
            !stateBefore.imagePath!.contains('cloudfront'))
          "image": await MultipartFile.fromFile(stateBefore.imagePath!,
              filename: basename(stateBefore.imagePath!))
      });

      final response = await quizService.updateQuestion(
          data: data, 
          idQuiz: quiz.id,
          idQuestion: stateBefore.idQuestion);

      final updatedQuestion = QuestionQuiz(
          id: response.id,
          label: question.label,
          image: response.image,
          responses: question.responses,
          correctAnswerIndex: question.correctAnswerIndex);

      emit(QuizCreateQuestionSuccessState(updatedQuestion));
      reset();
    } catch (error, trace) {
      emit(QuizCreateQuestionErrorState(error, trace));
      emit(stateBefore);
    }
  }
}
