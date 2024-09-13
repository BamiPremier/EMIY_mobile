import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:umai/auth/models/follower_response.dart';
import 'package:umai/auth/services/preference_user_service.dart';

class FollowUserCubit extends AutoListCubit<FollowerResponse> {
  final PreferenceUserService service;

  FollowUserCubit(
    this.service,
  ) : super(
            provider: ({int page = 1}) => service
                .getFollowers(
                  page: page,
                )
                .then((p) => p.paginate(FollowerResponse.fromJson)));

  @override
  DataProvider<FollowerResponse> get provider {
    return ({int page = 1}) => service
        .getFollowers(
          page: page,
        )
        .then((p) => p.paginate(FollowerResponse.fromJson));
  }
}
