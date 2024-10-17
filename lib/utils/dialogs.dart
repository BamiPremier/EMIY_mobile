import 'package:flutter/material.dart';
import 'package:umai/utils/themes.dart';

String _translateError(dynamic error) {
  const String noInternetMessage =
      'Impossible de se connecter à internet. Vérifiez votre connexion';
  const String unauthenticatedMessage =
      'Vous n\'êtes pas connecté à votre compte';
  const String defaultMessage =
      'Une erreur est survenue, veuillez-réessayer plus tard.';

  if (error.isUnauthenticatedError) return unauthenticatedMessage;
  if (error.isNoInternetConnectionError) return noInternetMessage;
  if (error.trace != null) return defaultMessage;

  return error.message ?? defaultMessage;
}

void showSuccessToast({
  required BuildContext context,
  required String content,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 32)
            .add(const EdgeInsets.only(bottom: 12)),
        content: Center(child: Text(content))),
  );
}

void showErrorToast({required dynamic content, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: AppTheme.errorRed,
        margin: const EdgeInsets.symmetric(horizontal: 32)
            .add(const EdgeInsets.only(bottom: 12)),
        content: Center(
            child: Text(
          _translateError(content),
          style: const TextStyle(color: Colors.white),
        ))),
  );
}
