import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:umai/common/models/follower_response.dart';
import 'package:umai/auth/services/preference_user_service.dart';

class FollowUserCubit extends AutoListCubit<User> {
  final PreferenceUserService service;

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
    return ({int page = 1}) => service.getFollowers(page: page).then((p) {
          print('==================p$p');
          return PaginatedList<User>(
            items: p.content,
            page: p.page,
            total: p.total,
          );
        });
  }

  Future<PaginatedList<User>> getFollowers({int page = 1}) {
    return service.getFollowers(page: page).then((p) {
      print('==================p$p');
      return PaginatedList<User>(
        items: p.content,
        page: p.page,
        total: p.total,
      );
    });
  }
}
