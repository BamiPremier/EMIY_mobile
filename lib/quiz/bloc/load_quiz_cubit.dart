import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_participation_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';

class LoadQuizCubit extends AutoListCubit<Quiz> {
  final QuizService quizService;
  final QuizParticipationCubitManager cubitManager;
  final String selectedFilter;
  LoadQuizCubit(this.quizService, this.cubitManager, this.selectedFilter,
      [int? size])
      : super(
            provider: ({page = 1}) => quizService.getQuizsFeed(
                page: page, size: size, selectedFilter: selectedFilter));

  @override
  void onChange(Change<AutoListState<Quiz>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Quiz>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Quiz>).items.items);
    }
  }
}
