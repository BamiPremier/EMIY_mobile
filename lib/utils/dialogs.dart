import 'package:flutter/material.dart';
import 'package:umai/common/services/api_error.dart';

String _translateError(dynamic error) {
  const String noInternetMessage =
      'Impossible de se connecter à internet. Vérifiez votre connexion';
  const String unauthenticatedMessage =
      'Vous n\'êtes pas connecté à votre compte';
  const String defaultMessage =
      'Une erreur est survenue, veuillez-réessayer plus tard.';

  if (error is String) return error;

  if (error is String) return error;

  if (error == null || error is! ApiError) return defaultMessage;

  final apiError = error;

  if (apiError.error != null) {
    return apiError.error!.displayMessages![1].value;
  }
  if (apiError.isUnauthenticatedError) return unauthenticatedMessage;
  if (apiError.isNoInternetConnectionError) return noInternetMessage;

  return defaultMessage;
}

void showSuccessToast({
  required BuildContext context,
  required String content,
}) {
  _showToast(
      textColor: null, bgColor: null, content: content, context: context);
}

void showBlackErrorToast(
    {required dynamic content, required BuildContext context}) {
  _showToast(
      textColor: Colors.white,
      bgColor: Colors.black,
      content: content,
      context: context);
}

void showErrorToast({required dynamic content, required BuildContext context}) {
  final contentText = _translateError(content);

  _showToast(
      textColor: Colors.white,
      bgColor: Theme.of(context).colorScheme.error,
      content: contentText,
      context: context);
}

void _showToast({
  required dynamic content,
  required BuildContext context,
  Color? textColor,
  Color? bgColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: bgColor,
        margin: const EdgeInsets.symmetric(horizontal: 32)
            .add(const EdgeInsets.only(bottom: 12)),
        content: Center(
            child: Text(
          content,
          style: TextStyle(color: textColor),
        ))),
  );
}
