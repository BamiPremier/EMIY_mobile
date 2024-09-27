import 'dart:developer';

import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/models/follower_response.dart';

class FollowUserCubit extends AutoListCubit<User> {
  final AuthService service;
  FollowUserCubit(this.service)
      : super(
          provider: ({int page = 1}) =>
              service.getFollowers(page: page).then((p) => PaginatedList<User>(
                    items: p.content,
                    page: p.page,
                    total: p.total,
                  )),
        );

  @override
  DataProvider<User> get provider {
    return ({int page = 1}) =>
        service.getFollowers(page: page).then((p) => PaginatedList<User>(
              items: p.content,
              page: p.page,
              total: p.total,
            ));
  }

  void selectUser(User user) {
    var stateBefore = state as FollowUserReadyState;
    var updatedSelectedUser = stateBefore.items.items.map((c) {
      if (c.id == user.id) {
        return user;
      }
      return c;
    }).toList();

    log("user : ${user.toString()}");
    log("updatedSelectedUser : ${updatedSelectedUser.toString()}");
    emit(UserFollowState(PaginatedList<User>(
        items: updatedSelectedUser,
        page: stateBefore.items.page,
        total: stateBefore.items.total)));
  }
}

typedef FollowUserState = AutoListState<User>;
typedef FollowUserReadyState = AutoListReadyState<User>;

class UserFollowState extends FollowUserReadyState {
  const UserFollowState(super.items);
  @override
  List<Object?> get props => [...super.props];
}
