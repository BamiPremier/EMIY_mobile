import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/quiz/models/question_quiz.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart' hide QuizResponse;
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';

part 'new_quiz_state.dart';

class NewQuizCubit extends Cubit<NewQuizState> {
  final QuizManageCubitManager quizManageCubitManager;
  final QuizService quizService;

  NewQuizCubit(this.quizService, this.quizManageCubitManager)
      : super(const QuizIdleState());

  void resetState() {
    emit(const QuizIdleState());
  }

  void toUpdate() {
    if (state is QuizCreatedState) {
      emit(QuizUpdateState(
        anime: (state as QuizCreatedState).anime,
        quiz: (state as QuizCreatedState).quiz,
        questions: (state as QuizCreatedState).questions,
      ));
    }
  }

  void toUpdateThisQuiz({required Quiz quiz}) {
    emit(QuizUpdateState(
      anime: quiz.anime,
      quiz: quiz,
      questions: const [],
    ));
  }

  void saveQuiz({required String title, required String description}) {
    if (state is QuizSelectAnimeState ||
        state is QuizCreatedState ||
        state is QuizIdleState) {
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
          questions: const [],
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
          : (stateBefore is QuizCreatedState  )
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
      quizManageCubitManager.add(response);
      emit(QuizCreatedState(
          anime: anime, quiz: response, questions: questions ?? []));
    } catch (error, trace) {
      emit(QuizErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void updateAfter(
      {required Quiz quiz, required List<QuizQuestionResponse> questions}) {
    emit(QuizCreatedState(
      anime: quiz.anime,
      quiz: quiz,
      questions: questions
          .map((q) => QuestionQuiz(
                id: q.id,
                label: q.label,
                image: q.image,
                correctAnswerIndex: q.responses.indexWhere((r) => r.isCorrect),
                responses: q.responses
                    .map((r) => QuizResponse(
                          label: r.label,
                          isCorrect: r.isCorrect,
                        ))
                    .toList(),
              ))
          .toList(),
    ));
  }

  void publishQuiz() async {
    if (state is! QuizCreatedState) return;
    final stateBefore = state;

    try {
      emit(const QuizLoadingPublishState());
      await quizService.quizPublished(
          idQuiz: (stateBefore as QuizCreatedState).quiz.id);
      emit(const QuizPublishedState());
      emit(const QuizIdleState());
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

    final updatedQuestions =
        (stateBefore as QuizCreatedState).questions.map((q) {
      return q.id == question.id ? question : q;
    }).toList();

    if (!(stateBefore).questions.any((q) => q.id == question.id)) {
      updatedQuestions.add(question);
    }

    emit(QuizCreatedState(
        anime: (stateBefore).anime,
        quiz: (stateBefore).quiz,
        questions: updatedQuestions));
  }
}
