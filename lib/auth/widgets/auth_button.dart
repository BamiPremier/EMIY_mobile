import 'package:auto_size_text/auto_size_text.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/utils/app_dimension.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum AuthProvider { apple, google }

extension AuthProviderExtension on AuthProvider {
  String get asset {
    switch (this) {
      case AuthProvider.apple:
        return Assets.iconsApple;

      case AuthProvider.google:
        return Assets.iconsGoogle;
    }
  }

  String get name {
    switch (this) {
      case AuthProvider.apple:
        return "Se connecter avec Apple";

      case AuthProvider.google:
        return "Se connecter avec Google";
    }
  }
}

enum AuthButtonStyle { primary, secondary, hybride }

typedef AuthCallback = void Function(
    {String? provider,
    String? email,
    String? token,
    Object? error,
    StackTrace? trace});

class AuthButton extends StatelessWidget {
  final AuthProvider provider;
  final AuthButtonStyle buttonStyle;
  final AuthCallback callback;
  final Color? backgroundColor; // Ajout du type Color
  final Color? textColor; // Ajout du type Color

  const AuthButton.apple(
      {super.key,
      this.buttonStyle = AuthButtonStyle.primary,
      this.backgroundColor,
      this.textColor,
      required this.callback})
      : provider = AuthProvider.apple;

  const AuthButton.google(
      {super.key,
      this.buttonStyle = AuthButtonStyle.primary,
      this.backgroundColor,
      this.textColor,
      required this.callback})
      : provider = AuthProvider.google;

  ButtonStyle style(BuildContext context) {
    switch (buttonStyle) {
      case AuthButtonStyle.hybride:
        return OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0)),
            side: const BorderSide(color: Colors.transparent));
      case AuthButtonStyle.primary:
        return OutlinedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0)),
            side: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer));
      case AuthButtonStyle.secondary:
        return OutlinedButton.styleFrom(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: ThemeApp.boldText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            side: BorderSide.none);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onAuthTap,
      icon: SvgPicture.asset(
        provider.asset,
        height: 30.0,
      ),
      label: AutoSizeText(
        provider.name,
        maxLines: 1,
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: Dimension.kMiddlePrimary),
      ),
      style: style(context).copyWith(
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(45.0)),
          textStyle: MaterialStatePropertyAll(
              Theme.of(context).textTheme.labelMedium)),
    );
  }

  void onAuthTap() async {
    // TODO
    //return;
    try {
      switch (provider) {
        case AuthProvider.apple:
          final appleCredentials = await SignInWithApple.getAppleIDCredential(
            scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName
            ],
          );
          return callback(
              email: appleCredentials.email,
              token: appleCredentials.identityToken,
              provider: provider.name.toLowerCase());

        case AuthProvider.google:
          final account = await GoogleSignIn(
            scopes: [
              'email',
              'https://www.googleapis.com/auth/userinfo.profile',
            ],
          ).signIn();
          if (account == null) return;
          final auth = await account.authentication;
          return callback(
              email: account.email,
              token: auth.accessToken,
              provider: provider.name.toLowerCase());
      }
    } catch (e, t) {
      return callback(error: e, trace: t);
    }
  }
}
