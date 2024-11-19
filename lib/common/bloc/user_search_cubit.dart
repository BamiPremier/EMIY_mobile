import 'package:potatoes/auto_content/bloc/auto_content_cubit.dart';
import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/auth/services/auth_service.dart';
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
