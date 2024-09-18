import 'dart:developer';

import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserCubit userCubit;
  final AuthService authService;

  AuthCubit(this.userCubit, this.authService) : super(const AuthIdleState());

  void socialLogin({
    required String email,
    required String token,
  }) {
    final stateBefore = state;

    emit(const AuthLoadingState());

    authService.authUser(email: email, token: token).then((response) {
      userCubit.preferencesService.saveUser(response.user);
      userCubit.preferencesService.saveAuthToken(response.accessToken);
      if (response.user.status != "PENDING_REGISTRATION") {
        emit(const AuthSuccessActiveUserState());
      } else {
        emit(const AuthSuccessInActiveUserState());
      }
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void completeUserName({
    required String username,
    required String userTag,
  }) {
    final stateBefore = state;

    emit(const AuthLoadingState());

    authService.completeUserProfile(userName: username, userTag: userTag).then(
        (response) {
      log('=================${response}============');
      userCubit.preferencesService.saveUser(response.user);
      emit(const CompleteUserSuccessUserState());

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      log('=================${error}============');
      log('=================${trace}============');
      emit(stateBefore);
    });
  }
}
