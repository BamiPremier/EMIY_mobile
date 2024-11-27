import 'package:potatoes/libs.dart';
import 'package:umai/common/models/user.dart';

import 'package:potatoes/potatoes.dart';
import 'package:umai/common/services/user_service.dart';

part 'person_state.dart';

class PersonCubit extends ObjectCubit<User, PersonState> {
  final UserService userService;

  PersonCubit(this.userService, User user)
      : super(InitializingPersonState(user));

  @override
  User? getObject(PersonState state) {
    if (state is InitializingPersonState) {
      return state.user;
    }
    return null;
  }

  User get user {
    final user = getObject(state) ?? object;

    if (user != null) return user;
    throw UnsupportedError(
        'cannot retrieve followed users: Current state is ${state.runtimeType}');
  }

  @override
  void update(User object) {
    emit(InitializingPersonState(object));
  }

  void followUser() {
    if (state is InitializingPersonState) {
      final stateBefore = state;

      emit(const PersonLoadingState());
      userService.follow(user: user.id).then((follower) {
        update(follower);
      }, onError: (error, trace) {
        emit(PersonErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void unFollowUser() {
    if (state is InitializingPersonState) {
      final stateBefore = state;

      emit(const PersonLoadingState());
      userService.unFollow(user: user.id).then((follower) {
        update(follower);
      }, onError: (error, trace) {
        emit(PersonErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  reset() {
    update(user);
  }

  void shareUser() {
    final stateBefore = state;

    emit(const SharePersonLoadingState());
    userService
        .shareUser(
      idUser: user.id,
    )
        .then((reponse) {
      emit(SharePersonSuccessState(reponse['shareLink']));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(PersonErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void blockUser() {
    if (state is InitializingPersonState) {
      final stateBefore = state;

      emit(const PersonLoadingBlockState());
      userService.blockUser(user: user.id).then((userBlocked) {
        update(userBlocked);
        emit(const SuccessSendBlockPersonState());
      }, onError: (error, trace) {
        emit(PersonErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void applyBlock() {
    if (state is SuccessSendBlockPersonState) {
      emit(SuccessBlockPersonState(user));
      reset();
    }
  }

  void unBlockUser() {
    if (state is InitializingPersonState) {
      final stateBefore = state;

      emit(const PersonLoadingBlockState());
      userService.unBlockUser(user: user.id).then((follower) {
        update(follower);
      }, onError: (error, trace) {
        emit(PersonErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

}
