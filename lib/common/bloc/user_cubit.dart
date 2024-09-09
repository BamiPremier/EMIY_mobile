import 'dart:async';
import 'dart:io';
import 'package:potatoes/potatoes.dart' hide PreferencesService;

import 'package:potatoes/common/bloc/object_cubit.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:umai/common/services/user_service.dart';

part 'user_state.dart';

class UserCubit extends ObjectCubit<User, UserState> {
  final UserService userService;
  final PreferencesService preferencesService;

  UserCubit(
    this.userService,
    this.preferencesService,
  ) : super(const InitializingUserState()) {
    _getInitialState(true);
  }

  @override
  User? getObject(UserState state) {
    if (state is UserLoggedState) {
      return state.user;
    }
    return null;
  }

  void _getInitialState([bool refresh = false]) {
    final user = preferencesService.user;
    if (user == null) {
      emit(const UserNotLoggedState());
    } else {
      emit(UserLoggedState(user));

      if (!refresh) return;
      userService.get(user.id).then((user) {
        preferencesService.saveUser(user).then((_) {
          emit(UserLoggedState(user));
        });
      });
    }
  }

  void reset() {
    _getInitialState();
  }

  User get user {
    final user = getObject(state) ?? object;

    if (user != null) return user;
    throw UnsupportedError(
        'cannot retrieve user when not logged: Current state is ${state.runtimeType}');
  }

  Future<void> signIn(User user, String jwt) {
    return Future.wait([
      preferencesService.saveUser(user),
      preferencesService.saveJwt(jwt),
      // preferencesService.saveIsFirstRun(false)
    ]).then((_) => reset());
  }

  void signOut() {
    if (state is UserLoggedState) {
      final stateBefore = state;
      emit(const UserLoggingOut());

      Future.wait([
        preferencesService.clear(),
        Future.delayed(const Duration(seconds: 2))
      ]).then((value) => emit(const UserNotLoggedState()),
          onError: (error, trace) {
        emit(UserErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  @override
  void update(User object) {
    // TODO: implement update
  }
}
