import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:potatoes/common/widgets/loaders.dart';

import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/login_welcome_back.dart';
import 'package:umai/auth/screens/registrationuser/registration_username.dart';
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
  late final signInCubit = context.read<SignInCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Widget swiperPage({
    //   required String image,
    //   required String title,
    //   required String subtitle,
    // }) {
    //   return Column(
    //     children: [
    //       Expanded(
    //         child: Image.asset(image),
    //       ),
    //       const SizedBox(height: 16.0),
    //       Text(
    //         title,
    //         style: Theme.of(context).textTheme.titleMedium,
    //       ),
    //       const SizedBox(height: 16.0),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 60.0),
    //         child: Text(
    //           subtitle,
    //           textAlign: TextAlign.center,
    //         ),
    //       )
    //     ],
    //   );
    // }

    return BlocListener<SignInCubit, SignInState>(
      listener: onEventReceived,
      child: Scaffold(
        backgroundColor: ThemeApp.primaryYellow,
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 65),
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
                        backgroundColor: ThemeApp.white,
                        textColor: ThemeApp.primaryBlack,
                      ),
                      const SizedBox(height: 24.0),
                      // if (Platform.isAndroid || Platform.isIOS)
                      AuthButton.google(
                        onPressed: () =>
                            acceptTerm(provider: AuthProvider.google),
                        backgroundColor: ThemeApp.primaryBlack,
                        textColor: ThemeApp.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
        // final appleCredentials = await SignInWithApple.getAppleIDCredential(
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
          final account = await GoogleSignIn(
            scopes: [
              'email',
              'https://www.googleapis.com/auth/userinfo.profile',
            ],
          ).signIn();
          log('=========================account.toString()=======================');
          log(account.toString());
          log('=========================account.toString()=======================');

          if (account == null) return;
          final auth = await account.authentication;
          return signInCubit.socialLogin(
            email: account.email,
            token: auth.accessToken!,
          );
      }
    } catch (e) {
      return showError(
        context,
        e,
      );
    }
  }

  void acceptTerm({required AuthProvider provider}) => showAppBottomSheet(
      context: context,
      horizontalPadding: 0,
      maxHeight: 240,
      isScrollControlled: true,
      builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                'Connexion & inscription',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'En cliquant sur Continuer, tu confirmes avoir pris connaissance et accepté notre politique de confidentialité et nos termes d’usage.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 32,
              ),
              UmaiButton.primary(
                onPressed: () {
                  // Navigator.of(context).pop();
                  onAuthTap(provider);
                  // log('3333333333333333');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           const RegistrationUsernameScreen()),
                  // );

                  log('3333333333333333');
                },
                text: "Continuer",
              ),
            ],
          )));

  void onSignInTap() {
    // signInCubit.login(
    //    identifierController.text.trim(), passwordController.text  );
  }

  void onEventReceived(BuildContext context, SignInState state) async {
    await waitForDialog();

    if (state is SignInLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is SignInSuccessActiveUserState) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginWelcomeBackScreen()),
      );
    } else if (state is SignInSuccessInActiveUserState) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const RegistrationUsernameScreen()),
      );
    } else if (state is SignInErrorState) {
      showError(context, state.error);
    }
  }
}
