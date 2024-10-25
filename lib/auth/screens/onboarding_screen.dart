import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/auth/screens/login_welcome_back_screen.dart';
import 'package:umai/auth/screens/registration/username.dart';
import 'package:umai/auth/widgets/auth_button.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with CompletableMixin {
  late final authCubit = context.read<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.primaryColorTheme(context),
      child: BlocListener<AuthCubit, AuthState>(
        listener: onEventReceived,
        child: Scaffold(
          body: SafeArea(
            minimum: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              bottom: 48.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (Platform.isIOS)
                  AuthButton.apple(
                    onPressed: () => acceptTerm(then: authCubit.appleSignIn),
                    backgroundColor: AppTheme.white,
                    textColor: AppTheme.primaryBlack,
                  ),
                const SizedBox(height: 16.0),
                AuthButton.google(
                  onPressed: () => acceptTerm(then: authCubit.googleSignIn),
                  backgroundColor: AppTheme.primaryBlack,
                  textColor: AppTheme.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void acceptTerm({required VoidCallback then}) => showAppBottomSheet(
      context: context,
      builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Connexion & inscription',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              Text.rich(TextSpan(
                children: [
                  const TextSpan(
                      text:
                          'En cliquant sur Continuer, tu confirmes avoir pris connaissance et accepté notre '),
                  TextSpan(
                      text: 'politique de confidentialité',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: const TextStyle(
                          decoration: TextDecoration.underline)),
                  const TextSpan(text: ' et nos '),
                  TextSpan(
                      text: 'termes d\'usage',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: const TextStyle(
                          decoration: TextDecoration.underline)),
                  const TextSpan(text: '.'),
                ],
                style: Theme.of(context).textTheme.bodyMedium,
              )),
              const SizedBox(height: 64.0),
              UmaiButton.primary(
                onPressed: then,
                text: "Continuer",
              ),
            ],
          )));

  void onEventReceived(BuildContext context, AuthState state) async {
    await waitForDialog();

    if (state is AuthLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is AuthSuccessActiveUserState) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginWelcomeBackScreen()),
      );
    } else if (state is AuthSuccessInActiveUserState) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const RegistrationUsername()),
      );
    } else if (state is AuthErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
