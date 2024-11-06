import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/user_service.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';

class LoadQuizUserCubit extends AutoListCubit<Quiz> {
  final QuizManageCubitManager cubitManager;
  final UserService userService;
  final String? userId;
  LoadQuizUserCubit({
    required this.cubitManager,
    required this.userService,
      this.userId,
  }) : super(
            provider: ({page = 1}) =>
                userService.getQuizsUser(page: page, userId: userId));

  @override
  void onChange(Change<AutoListState<Quiz>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Quiz>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Quiz>).items.items);
    }
  }
}
