 
import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/user_service.dart';

class UserSearchCubit extends AutoListCubit<User> {
  final UserService userService;
  final PersonCubitManager cubitManager;

  final String search;
  UserSearchCubit({
    required this.userService,
    required this.cubitManager,
    required this.search,
  }) : super(
            provider: ({page = 1}) => userService.searchUser(
                  page: page,
                  search: search,
                ));

  @override
  void onChange(Change<AutoListState<User>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<User>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<User>).items.items);
    }
  }
}
