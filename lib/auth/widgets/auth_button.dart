import 'package:auto_size_text/auto_size_text.dart';
import 'package:umai/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final VoidCallback onPressed;
  final Color? backgroundColor; // Ajout du type Color
  final Color? textColor; // Ajout du type Color

  const AuthButton.apple(
      {super.key,
      this.backgroundColor,
      this.textColor,
      required this.onPressed})
      : provider = AuthProvider.apple;

  const AuthButton.google(
      {super.key,
      this.backgroundColor,
      this.textColor,
      required this.onPressed})
      : provider = AuthProvider.google;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        provider.asset,
        height: 24.0,
      ),
      label: AutoSizeText(provider.name,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: textColor,
              )),
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
    );
  }
}
