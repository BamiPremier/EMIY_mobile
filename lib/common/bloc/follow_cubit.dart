import 'package:potatoes/libs.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/models/user.dart';

import 'package:potatoes/potatoes.dart';

part 'follow_state.dart';

class FollowCubit extends ObjectCubit<User, FollowState> {
  final AuthService authService;

  FollowCubit(this.authService, User user)
      : super(InitializingFollowState(user));

  @override
  User? getObject(FollowState state) {
    if (state is InitializingFollowState) {
      return state.user;
    }
    return null;
  }

  User? get user {
    final user = getObject(state) ?? object;

    if (user != null) return user;
    throw UnsupportedError(
        'cannot retrieve followed users: Current state is ${state.runtimeType}');
  }

  @override
  void update(User object) {
    emit(InitializingFollowState(object));
  }

  void followUser() {
    final stateBefore = state;

    emit(const FollowLoadingState());
    authService.followUser(follower: user!.id).then((follower) {
      update(follower);
    }, onError: (error, trace) {
      emit(FollowErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void unFollowUser() {
    final stateBefore = state;

    emit(const FollowLoadingState());
    authService.unFollowUser(follower: user!.id).then((follower) {
      update(follower);
    }, onError: (error, trace) {
      emit(FollowErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
