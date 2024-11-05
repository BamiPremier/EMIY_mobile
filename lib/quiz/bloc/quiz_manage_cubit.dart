
import 'package:potatoes/libs.dart'; 
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_service.dart';

import 'package:potatoes/potatoes.dart';
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

  @override
  void update(Quiz object) {
    emit(InitializingQuizManageState(object));
  }
}
