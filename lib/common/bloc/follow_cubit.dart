import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart'; 

class FollowCubit extends AutoListCubit<User> {
  final source;
  final PersonCubitManager cubitManager;

  FollowCubit(this.source, this.cubitManager)
      : super(provider: ({page = 1}) => source);

  @override
  void onChange(Change<AutoListState<User>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<User>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<User>).items.items);
    }
  }
}
