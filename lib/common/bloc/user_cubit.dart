import 'dart:async';
import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/notification_service.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:umai/common/services/user_service.dart';

part 'user_state.dart';

class UserCubit extends ObjectCubit<User, UserState> {
  final UserService userService;
  final PreferencesService preferencesService;
  final NotificationService notificationService;
  UserCubit(
    this.userService,
    this.preferencesService,
    this.notificationService,
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
      if (refresh) _refreshData();
      if (user.status == UserStatus.pendingRegistration) {
        emit(const CompleteUserProfileState());
      } else {
        emit(UserLoggedState(user));
      }
    }
  }

  void reset() {
    _getInitialState();
  }

  void refreshData() {
    _getInitialState(true);
  }

  User get user {
    final user = getObject(state) ?? object;

    if (user != null) return user;
    throw UnsupportedError(
        'cannot retrieve user when not logged: Current state is ${state.runtimeType}');
  }

  Future<void> _refreshData() {
    return userService.getMe().then((user) async {
      await preferencesService.saveUser(user);
    });
  }

  void shareUser() {
    final stateBefore = state;

    emit(const ShareUserLoadingState());
    userService
        .shareUser(
      idUser: user.id,
    )
        .then((reponse) {
      emit(ShareUserSuccessState(reponse['shareLink']));
      emit(UserLoggedState(user));
    }, onError: (error, trace) {
      emit(UserErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void updateUser({
    String? username,
    String? biography,
    List<String>? genres,
  }) {
    final stateBefore = state;

    emit(const UserUpdatingState());
    userService
        .updateUser(
      username: username,
      biography: biography,
      genres: genres,
    )
        .then((user) {
      preferencesService.saveUser(user);
      emit(const UserUpdatedState());
      emit(UserLoggedState(user));
    }, onError: (error, trace) {
      emit(UserErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void updateProfilePicture({required File file}) {
    final stateBefore = state;

    emit(const UserUpdatingState());
    userService.updateProfilePicture(file: file).then((user) {
      preferencesService.saveUser(user);
      emit(const UserUpdatedState());
      emit(UserLoggedState(user));
    }, onError: (error, trace) {
      emit(UserErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void signOut() {
    if (state is UserLoggedState) {
      final stateBefore = state;
      emit(const UserLoggingOut());

      Future.wait([
        GoogleSignIn().signOut(),
        preferencesService.clear(),
        notificationService.disconnect(),
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
