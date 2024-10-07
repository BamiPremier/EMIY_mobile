
import 'package:flutter/gestures.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:potatoes/common/widgets/loaders.dart';

import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/auth/screens/login_welcome_back_screen.dart';
import 'package:umai/auth/screens/registration/username.dart';
import 'package:umai/auth/widgets/auth_button.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
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
            minimum: const EdgeInsets.only(bottom: 32),
            child: Column(
              children: [
                const Spacer(flex: 2),
                const Spacer(flex: 3),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Column(
                      children: [
                        AuthButton.apple(
                          onPressed: () =>
                              acceptTerm(provider: AuthProvider.apple),
                          backgroundColor: AppTheme.white,
                          textColor: AppTheme.primaryBlack,
                        ),
                        const SizedBox(height: 24.0),
                        // if (Platform.isAndroid || Platform.isIOS)
                        AuthButton.google(
                          onPressed: () =>
                              acceptTerm(provider: AuthProvider.google),
                          backgroundColor: AppTheme.primaryBlack,
                          textColor: AppTheme.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onAuthTap(provider) async {
    // TODO
    //return;
    try {
      switch (provider) {
        case AuthProvider.apple:
        // final appleCredentials = await AuthWithApple.getAppleIDCredential(
        //   scopes: [
        //     AppleIDAuthorizationScopes.email,
        //     AppleIDAuthorizationScopes.fullName
        //   ],
        // );
        // return callback(
        //     email: appleCredentials.email,
        //     token: appleCredentials.identityToken,
        //     provider: provider.name.toLowerCase());

        case AuthProvider.google:
          final googleAuth = GoogleSignIn(
            scopes: [
              'email',
              'https://www.googleapis.com/auth/userinfo.profile',
            ],
          );
          await googleAuth.signOut();
          final account = await googleAuth.signIn();

          if (account == null) return;
          final auth = await account.authentication;
          return authCubit.socialLogin(
            email: account.email,
            token: auth.accessToken!,
          );
      }
    } catch (e) {
      return showErrorToast(
        e.toString(),
      );
    }
  }

  void acceptTerm({required AuthProvider provider}) => showAppBottomSheet(
      context: context,
      horizontalPadding: 16.0,
      maxHeight: 240,
      builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              Text(
                'Connexion & inscription',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16.0,
              ),
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
                style: Theme.of(context).textTheme.bodySmall,
              )),
              const Spacer(),
              UmaiButton.primary(
                onPressed: () => onAuthTap(provider),
                text: "Continuer",
              ),
              const SizedBox(height: 8.0)
            ],
          ));

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
        MaterialPageRoute(
            builder: (context) => const RegistrationUsername ()),
      );
    } else if (state is AuthErrorState) {
      showErrorToast(state.error);
    }
  }
}
