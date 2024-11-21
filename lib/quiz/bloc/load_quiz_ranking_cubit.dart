import 'package:potatoes/auto_list.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'package:potatoes/libs.dart';

class LoadQuizRankingCubit extends AutoListCubit<QuizParticipation> {
  final PersonCubitManager personCubitManager;
  final QuizService quizService;
  final String idQuiz;
  LoadQuizRankingCubit(this.personCubitManager, this.quizService, this.idQuiz,
      [int? size])
      : super(
            provider: ({page = 1}) => quizService.getQuizRanking(
                page: page, size: size, idQuiz: idQuiz));

  @override
  void onChange(Change<AutoListState<QuizParticipation>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<QuizParticipation>) {
      personCubitManager.addAll(
          (change.nextState as AutoListReadyState<QuizParticipation>)
              .items
              .items
              .map((participation) => participation.user));
    }
  }
}
