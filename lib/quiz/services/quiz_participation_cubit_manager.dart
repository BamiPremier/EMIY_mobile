import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/quiz/bloc/quiz_question_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
import 'package:umai/quiz/models/quiz_response.dart';
import 'package:umai/quiz/services/quiz_service.dart';

class QuizParticipationCubitManager
    extends CubitManager<QuizParticipationCubit, QuizQuestionResponse, String> {
  final QuizService quizService;

  QuizParticipationCubitManager(
    this.quizService,
  );

  @override
  String buildId(QuizQuestionResponse object) {
    return object.id;
  }

  @override
  QuizParticipationCubit create(QuizQuestionResponse object) {
    print("==========${object.id}=====add quiz cubit");
    return QuizParticipationCubit(quizService, object);
  }


 @override
  void updateCubit(QuizParticipationCubit cubit, QuizQuestionResponse object) {
    cubit.update(object);
  }
}
