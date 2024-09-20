import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserCubit userCubit;
  final AuthService authService;

  AuthCubit(this.userCubit, this.authService) : super(AuthIdleState());

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
  }) async {
    final stateBefore = state;

    emit(const AuthLoadingState());

    await authService
        .completeUserProfile(userName: username, userTag: userTag)
        .then((response) {
      log('=================${response}============');
      userCubit.preferencesService.saveUser(response.user).then(() async {
            emit(const CompleteUserSuccessUserState());

            emit(stateBefore);
          } as FutureOr Function(void value));
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      log('=================${error}============');
      log('=================${trace}============');
      emit(stateBefore);
    });
  }

  void updateUserNameAndTag(String value) {
    if (state is AuthIdleState) {
      final currentState = state as AuthIdleState;
      final updatedState = AuthIdleState()
        ..userNameController.text = value
        ..userTagController.text = generateUserTag(value);
      final cursorPosition =
          currentState.userNameController.selection.base.offset;

      emit(updatedState);

      updatedState.userNameController.selection = TextSelection.fromPosition(
        TextPosition(offset: cursorPosition),
      );
    }
  }

  String? validateUserTag(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'identifiant ne peut pas être vide';
    }

    final RegExp userTagRegex = RegExp(r'^[a-z0-9\-_.]{3,30}$');

    if (!userTagRegex.hasMatch(value)) {
      return 'L\'identifiant doit contenir entre 3 et 30 caractères alphanumériques, tirets, points ou underscores';
    }

    return null;
  }

  String generateUserTag(String username) {
    // Convertir en minuscules
    String tag = username.toLowerCase();

    // Remplacer les espaces par des tirets
    tag = tag.replaceAll(' ', '-');

    // Supprimer les accents
    tag = tag
        .replaceAllMapped(RegExp(r'[àáâãäå]'), (match) => 'a')
        .replaceAllMapped(RegExp(r'[èéêë]'), (match) => 'e')
        .replaceAllMapped(RegExp(r'[ìíîï]'), (match) => 'i')
        .replaceAllMapped(RegExp(r'[òóôõö]'), (match) => 'o')
        .replaceAllMapped(RegExp(r'[ùúûü]'), (match) => 'u')
        .replaceAllMapped(RegExp(r'[ýÿ]'), (match) => 'y')
        .replaceAllMapped(RegExp(r'[ñ]'), (match) => 'n');

    // Supprimer tous les caractères non autorisés
    tag = tag.replaceAll(RegExp(r'[^a-z0-9\-_.]'), '');

    // Supprimer les tirets consécutifs
    tag = tag.replaceAll(RegExp(r'-+'), '-');

    // Supprimer les tirets au début et à la fin
    tag = tag.trim().toLowerCase();

    return tag;
  }
}
