import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';

Future<void> showError(BuildContext context, [dynamic error]) {
  return showAppBottomSheet(
      context: context,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Information",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                _translateError(error),
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              // UmaiButton.primary(
              //   onPressed: Navigator.of(context).pop,
              //   text: "Fermer",
              // ),
              const SizedBox(height: 32.0)
            ],
          ));
}

String _translateError(dynamic error) {
  const String noInternetMessage =
      'Impossible de se connecter à internet. Vérifiez votre connexion';
  const String unauthenticatedMessage =
      'Vous n\'êtes pas connecté à votre compte';
  const String defaultMessage =
      'Une erreur est survenue, veuillez-réessayer plus tard.';

  if (error is String) return error;
  if (error == null || error is! ApiError) return defaultMessage;
  if (error.errors != null) {
    if (error.errors!.isNotEmpty) {
      // liste les erreurs détectées
      return error.errors!.values
          .fold('', (previous, value) => '$previous\n$value');
    }
  } else if (error.dio != null) {
    if (kDebugMode) {
      return error.dio?.message ?? defaultMessage;
    }
  }
  if (error.isUnauthenticatedError) return unauthenticatedMessage;
  if (error.isNoInternetConnectionError) return noInternetMessage;
  if (error.trace != null) return defaultMessage;

  return error.message ?? defaultMessage;
}
