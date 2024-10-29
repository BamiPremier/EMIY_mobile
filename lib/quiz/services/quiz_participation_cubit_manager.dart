import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
import 'package:umai/quiz/services/quiz_service.dart';

class QuizParticipationCubitManager
    extends CubitManager<QuizParticipationCubit, Quiz, String> {
  final QuizService quizService;

  QuizParticipationCubitManager(
    this.quizService,
  );

  @override
  String buildId(Quiz object) {
    return object.id.toString();
  }

  @override
  QuizParticipationCubit create(Quiz object) {
    return QuizParticipationCubit(quizService, object);
  }

  @override
  void updateCubit(QuizParticipationCubit cubit, Quiz object) {
    cubit.update(object);
  }
}
