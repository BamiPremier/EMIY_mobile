import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';

class LoadQuizAnimeCubit extends AutoListCubit<Quiz> {
  final PersonCubitManager personCubitManager;
  final QuizService quizService;
  final QuizManageCubitManager cubitManager;
  final String animeId;
  LoadQuizAnimeCubit(this.personCubitManager, this.quizService,
      this.cubitManager, this.animeId, [int? size])
      : super(
            provider: ({page = 1}) => quizService.getQuizsAnime(
                page: page, size: size, animeId: animeId));

  @override
  void onChange(Change<AutoListState<Quiz>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Quiz>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Quiz>).items.items);
      personCubitManager.addAll((change.nextState as AutoListReadyState<Quiz>)
          .items
          .items
          .map((quiz) => quiz.user));
    }
  }
}
