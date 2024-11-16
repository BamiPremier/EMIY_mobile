import 'package:flutter/material.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

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
    switch (provider) {
      case AuthProvider.apple:
        return UmaiButton.white(
          onPressed: onPressed,
          icon: toSvgIcon(
            icon: provider.asset,
            size: 24.0,
          ),
          text: provider.name,
          large: true,
        );
      case AuthProvider.google:
        return UmaiButton.black(
          onPressed: onPressed,
          icon: toSvgIcon(
            icon: provider.asset,
            size: 24.0,
          ),
          text: provider.name,
          large: true,
        );
    }
  }
}
