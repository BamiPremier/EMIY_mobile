import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/user_service.dart';

class BlockedUserCubit extends AutoListCubit<User> {
  final UserService userService;
  final PersonCubitManager cubitManager;

  BlockedUserCubit(this.userService, this.cubitManager)
      : super(provider: ({page = 1}) => userService.getBlockedUsers());

  @override
  void onChange(Change<AutoListState<User>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<User>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<User>).items.items);
    }
  }
}
