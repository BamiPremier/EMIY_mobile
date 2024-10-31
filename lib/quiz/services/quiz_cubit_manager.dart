import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/services/quiz_service.dart';

class QuizManageCubitManager
    extends CubitManager<QuizManageCubit, Quiz, String> {
  final QuizService quizService;

  QuizManageCubitManager(
    this.quizService,
  );

  @override
  String buildId(Quiz object) {
    return object.id;
  }

  @override
  QuizManageCubit create(Quiz object) {
    print("==========${object.id}=====add quiz cubit");
    return QuizManageCubit(quizService, object);
  }

  @override
  void updateCubit(QuizManageCubit cubit, Quiz object) {
    cubit.update(object);
  }
}
