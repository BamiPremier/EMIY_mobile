import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';

class LoadQuizCubit extends AutoListCubit<Quiz> {
  final QuizService quizService;
  final QuizManageCubitManager cubitManager;
  final PersonCubitManager personCubitManager;
  final String selectedFilter;
  LoadQuizCubit(this.quizService, this.cubitManager, this.personCubitManager,
      this.selectedFilter, [int? size])
      : super(
            provider: ({page = 1}) => quizService.getQuizFeed(
                page: page, size: size, selectedFilter: selectedFilter));

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
