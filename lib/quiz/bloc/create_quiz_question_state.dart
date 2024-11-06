part of 'create_quiz_question_cubit.dart';

mixin CreateQuizQuestionState on Equatable {}

class QuizFormInitialState extends CubitSuccessState
    with CreateQuizQuestionState {
  const QuizFormInitialState();

  @override
  List<Object?> get props => [];
}

class QuizCreateQuestionLoadingState extends CubitLoadingState
    with CreateQuizQuestionState {
  const QuizCreateQuestionLoadingState();
}

class QuizCreateQuestionFormBuildState extends CubitSuccessState
    with CreateQuizQuestionState {
  final List<TextEditingController> propositionControllers;
  final TextEditingController questionController;
  final int? correctAnswerIndex;
  final String? imagePath;

  QuizCreateQuestionFormBuildState({
    required this.propositionControllers,
    required this.questionController,
    this.correctAnswerIndex,
    this.imagePath,
  });

  @override
  List<Object?> get props => [
        propositionControllers,
        questionController,
        correctAnswerIndex,
        imagePath
      ];
}

class QuizUpdateQuestionFormBuildState extends CubitSuccessState
    with CreateQuizQuestionState {
  final List<TextEditingController> propositionControllers;
  final TextEditingController questionController;
  final int? correctAnswerIndex;
  final String? imagePath;
  final String idQuestion;
  QuizUpdateQuestionFormBuildState({
    required this.propositionControllers,
    required this.questionController,
    this.correctAnswerIndex,
    this.imagePath,
    required this.idQuestion,
  });

  @override
  List<Object?> get props => [
        propositionControllers,
        questionController,
        correctAnswerIndex,
        imagePath,
        idQuestion
      ];
}

class QuizCreateQuestionSuccessState extends CubitInformationState
    with CreateQuizQuestionState {
  final QuestionQuiz question;

  QuizCreateQuestionSuccessState(this.question);
}

class QuizCreateQuestionErrorState extends CubitErrorState
    with CreateQuizQuestionState {
  QuizCreateQuestionErrorState(super.error, [super.trace]);
}
