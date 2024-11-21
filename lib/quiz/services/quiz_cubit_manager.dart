import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';

class QuizManageCubitManager
    extends CubitManager<QuizManageCubit, Quiz, String> {
  final QuizService quizService;
  final AnimeCubitManager animeCubitManager;

  final PersonCubitManager personCubitManager;
  QuizManageCubitManager(
    this.quizService,
    this.animeCubitManager,
    this.personCubitManager,
  );

  @override
  String buildId(Quiz object) {
    return object.id;
  }

  @override
  QuizManageCubit create(Quiz object) {
    if (object.anime != null) {
      animeCubitManager.add(object.anime!);
    }
    personCubitManager.add(object.user);

    return QuizManageCubit(quizService, object);
  }

  @override
  void updateCubit(QuizManageCubit cubit, Quiz object) {
    cubit.update(object);
    if (object.anime != null) {
      animeCubitManager.add(object.anime!);
    }
    personCubitManager.add(object.user);
  }
}
