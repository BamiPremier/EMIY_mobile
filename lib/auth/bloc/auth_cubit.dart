import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserCubit userCubit;
  final AuthService authService;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthCubit(this.userCubit, this.authService) : super(AuthIdleState());

  void googleSignIn() async {
    if (state is !AuthIdleState) return;
    final stateBefore = state;

    try {
      await _googleSignIn.signOut();
      final account = await _googleSignIn.signIn();
      if (account == null) return;

      emit(const AuthLoadingState());
      final authentication = await account.authentication;
      await FirebaseAuth.instance.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken
        )
      );
      _socialLogin();
    } catch (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void appleSignIn() async {
    if (!Platform.isIOS) return;
    if (state is !AuthIdleState) return;
    final stateBefore = state;

    try {
      final authentication = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ]
      );

      if (authentication.identityToken == null) return;
      emit(const AuthLoadingState());
      await FirebaseAuth.instance.signInWithCredential(
        OAuthProvider('apple.com').credential(
          idToken: authentication.identityToken,
          accessToken: authentication.authorizationCode
        )
      );
      _socialLogin();
    } catch (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    }
  }

  void _socialLogin() async {
    emit(const AuthLoadingState());

    final email = FirebaseAuth.instance.currentUser!.email!;
    final idToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    authService.authUser(email: email, token: idToken!).then((response) async {
      await userCubit.preferencesService.saveUser(response.user);
      await userCubit.preferencesService.saveAuthToken(response.accessToken);
      userCubit.reset();
      if (response.user.status == UserStatus.pendingRegistration) {
        emit(const AuthSuccessInActiveUserState());
      } else {
        emit(const AuthSuccessActiveUserState());
      }
      emit(AuthIdleState());
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(AuthIdleState());
    });
  }

  void completeUserName({
    required String username,
    required String userTag,
  }) async {
    final stateBefore = state;

    emit(const AuthLoadingState());

    await authService.completeUserProfile(userName: username, userTag: userTag)
      .then((user) {
        userCubit.preferencesService.saveUser(user)
          .then((_) {
            emit(const CompleteUserSuccessUserState());
            emit(stateBefore);
          });
      },
      onError: (error, trace) {
        emit(AuthErrorState(error, trace));
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
