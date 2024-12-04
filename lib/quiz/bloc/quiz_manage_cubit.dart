import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart';
import 'package:umai/quiz/services/quiz_service.dart';

part 'quiz_manage_state.dart';

class QuizManageCubit extends ObjectCubit<Quiz, QuizManageState> {
  final QuizService quizService;
  QuizManageCubit(this.quizService, Quiz quiz)
      : super(InitializingQuizManageState(quiz));

  @override
  Quiz? getObject(QuizManageState state) {
    if (state is InitializingQuizManageState) {
      return state.quiz;
    }
    return null;
  }

  Quiz get quiz {
    final quiz = getObject(state) ?? object;

    if (quiz != null) return quiz;
    throw UnsupportedError(
        'cannot retrieve quiz: Current state is ${state.runtimeType}');
  }

  void loadQuestions({bool isAfterPublish = false}) async {
    final stateBefore = state;

    try {
      emit(const QuizManageLoadingState());

      await quizService.getQuizQuestions(idQuiz: quiz.id).then((questions) {
        if (isAfterPublish) {
          emit(QuizQuestionsAfterPublishState(questions));
        } else {
          emit(QuizQuestionsState(questions));
          emit(stateBefore);
        }
      });
    } catch (error, trace) {
      emit(QuizManageErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void shareQuiz() {
    if (state is InitializingQuizManageState) {
      final stateBefore = state;

      emit(const ShareQuizLoadingState());
      quizService
          .shareQuiz(
        idQuiz: quiz.id,
      )
          .then((reponse) {
        emit(ShareQuizSuccesState(reponse['shareLink']));
        emit(InitializingQuizManageState(quiz));
      }, onError: (error, trace) {
        emit(QuizManageErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  @override
  void update(Quiz object) {
    emit(InitializingQuizManageState(object));
  }
}
