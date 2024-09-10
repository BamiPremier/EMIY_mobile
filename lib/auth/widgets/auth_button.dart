import 'dart:developer';

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
 
class AuthButton extends StatelessWidget {
  final AuthProvider provider;
  final AuthButtonStyle buttonStyle;
  final   onPressed;
  final Color? backgroundColor; // Ajout du type Color
  final Color? textColor; // Ajout du type Color

  const AuthButton.apple(
      {super.key,
      this.buttonStyle = AuthButtonStyle.primary,
      this.backgroundColor,
      this.textColor,
      required this.onPressed})
      : provider = AuthProvider.apple;

  const AuthButton.google(
      {super.key,
      this.buttonStyle = AuthButtonStyle.primary,
      this.backgroundColor,
      this.textColor,
      required this.onPressed})
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
      onPressed: onPressed,
      icon: SvgPicture.asset(
        provider.asset,
        height: 30.0,
      ),
      label: AutoSizeText(provider.name,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: textColor,
              )),
      style: style(context).copyWith(
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(45.0)),
          textStyle: MaterialStatePropertyAll(
              Theme.of(context).textTheme.labelMedium)),
    );
  }
}
