import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart'; 
class PeopleFollowsCubit extends AutoListCubit<User> {
  final AuthService authService;
  final PersonCubitManager cubitManager;

  PeopleFollowsCubit(this.authService, this.cubitManager)
      : super(provider: authService.getPeopleToFollow);

  @override
  void onChange(Change<AutoListState<User>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<User>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<User>).items.items);
    }
  }
}
