import 'dart:developer';

import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final UserCubit userCubit;
  final AuthService authService;

  SignInCubit(this.userCubit, this.authService)
      : super(const SignInIdleState());

  void socialLogin({
    required String email,
    required String token,
  }) {
    final stateBefore = state;

    emit(const SignInLoadingState());

    authService.authUser(email: email, token: token).then((response) {
      userCubit.preferencesService.saveUser(response.user);
      if (response.user.status != "PENDING_REGISTRATION") {
        emit(const SignInSuccessActiveUserState());
      } else {
        emit(const SignInSuccessInActiveUserState());
      }
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(SignInErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void completeUserName({
    required String username,
    required String userTag,
  }) {
    final stateBefore = state;

    emit(const SignInLoadingState());

    authService.completeUserProfile(userName: username, userTag: userTag).then(
        (response) {
      log('=================${response}============');
      userCubit.preferencesService.saveUser(response);
      emit(const CompleteUserSuccessUserState());

      emit(stateBefore);
    }, onError: (error, trace) {
      log('=================${error}============');
      emit(SignInErrorState(error, trace));
      log('=================${trace}============');
      emit(stateBefore);
    });
  }
}
