
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/quiz/models/question_quiz.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart'; 
import 'package:path/path.dart';
import 'package:potatoes/potatoes.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizManageCubitManager quizManageCubitManager;
  final QuizService quizService;

  QuizCubit(this.quizService, this.quizManageCubitManager)
      : super(const QuizIdleState());

  void toUpdate() {
    if (state is QuizCreatedState) {
      emit(QuizUpdateState(
        anime: (state as QuizCreatedState).anime,
        quiz: (state as QuizCreatedState).quiz,
        questions: (state as QuizCreatedState).questions,
      ));
    }
  }

  void saveQuiz({required String title, required String description}) {
    if (state is QuizSelectAnimeState) {
      createQuiz(title: title, description: description);
    } else if (state is QuizUpdateState) {
      updateQuiz(title: title, description: description);
    }
  }

  void createQuiz({required String title, required String description}) async {
    final stateBefore = state;

    try {
      emit(const QuizLoadingState());
      final data = {
        "title": title,
        "description": description,
        if (stateBefore is QuizSelectAnimeState)
          "anime_id": stateBefore.anime.id,
      };
      final response = await quizService.newQuiz(data: data);
      quizManageCubitManager.add(response);
      emit(QuizCreatedState(
          quiz: response,
          questions:const [],
          anime: (stateBefore is QuizSelectAnimeState)
              ? stateBefore.anime
              : null));
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void updateQuiz({required String title, required String description}) async {
    final stateBefore = state;

    try {
      emit(const QuizLoadingState());
      final animeId = stateBefore is QuizSelectAnimeState
          ? stateBefore.anime.id
          : (stateBefore is QuizCreatedState && stateBefore.anime != null)
              ? stateBefore.anime!.id
              : (stateBefore is QuizUpdateState && stateBefore.anime != null)
                  ? stateBefore.anime!.id
                  : null;
      final idQuiz = stateBefore is QuizSelectAnimeState
          ? stateBefore.quiz!.id
          : (stateBefore is QuizCreatedState && stateBefore.quiz != null)
              ? stateBefore.quiz.id
              : (stateBefore is QuizUpdateState)
                  ? stateBefore.quiz!.id
                  : null;
      final anime = stateBefore is QuizSelectAnimeState
          ? stateBefore.anime
          : (stateBefore is QuizCreatedState && stateBefore.anime != null)
              ? stateBefore.anime!
              : (stateBefore is QuizUpdateState && stateBefore.anime != null)
                  ? stateBefore.anime!
                  : null;
      final questions = stateBefore is QuizSelectAnimeState
          ? stateBefore.questions
          : (stateBefore is QuizCreatedState)
              ? stateBefore.questions
              : (stateBefore is QuizUpdateState)
                  ? stateBefore.questions
                  : <QuestionQuiz>[];

      final data = {
        "title": title,
        "description": description,
        if (animeId != null) "anime_id": animeId,
      };

      final response =
          await quizService.updateQuiz(data: data, idQuiz: idQuiz!);
      quizManageCubitManager.updateCubit(
          quizManageCubitManager.get(response), response);
      emit(QuizCreatedState(
          anime: anime, quiz: response, questions: questions ?? []));
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void publishQuiz() async {
    if (state is! QuizCreatedState) return;
    final stateBefore = state;

    try {
      emit(const QuizLoadingPublishState());
      await quizService.quizPublished(
          idQuiz: (stateBefore as QuizCreatedState).quiz.id);
      emit(const QuizPublishedState());
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void selectAnime(Anime anime) {
    final quiz = (state is QuizCreatedState)
        ? (state as QuizCreatedState).quiz
        : (state is QuizSelectAnimeState)
            ? (state as QuizSelectAnimeState).quiz
            : (state is QuizUpdateState)
                ? (state as QuizUpdateState).quiz
                : null;
    final questions = (state is QuizCreatedState)
        ? (state as QuizCreatedState).questions
        : (state is QuizSelectAnimeState)
            ? (state as QuizSelectAnimeState).questions
            : (state is QuizUpdateState)
                ? (state as QuizUpdateState).questions
                : <QuestionQuiz>[];

    if (state is QuizUpdateState) {
      emit(QuizUpdateState(
        anime: anime,
        quiz: quiz,
        questions: questions,
      ));
    } else {
      emit(QuizSelectAnimeState(
        anime: anime,
        quiz: quiz,
        questions: questions,
      ));
    }
  }

  void addQuestion(QuestionQuiz question) async {
    if (state is! QuizCreatedState) return;
    final stateBefore = state;

    try {
      emit(const QuizLoadingState());

      var data = FormData.fromMap({
        ...question.toFormData(),
        if (question.image != null && question.image!.isNotEmpty)
          "image": await MultipartFile.fromFile(question.image!,
              filename: basename(question.image!))
      });
      final response = await quizService.addQuestion(
          data: data, idQuiz: (stateBefore as QuizCreatedState).quiz.id);
      final updatedQuestion = QuestionQuiz(
          label: question.label,
          image: response.image,
          responses: question.responses,
          correctAnswerIndex: question.correctAnswerIndex);
      question = updatedQuestion;
      emit(QuizCreatedState(
          anime: (stateBefore).anime,
          quiz: (stateBefore).quiz,
          questions: [...(stateBefore).questions, question]));
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }
}
