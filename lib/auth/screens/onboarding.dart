import 'dart:developer';
import 'dart:io';

import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/registration_username.dart';
import 'package:umai/auth/widgets/auth_button.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/utils/app_dimension.dart';
import 'package:umai/utils/themes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final signInCubit = context.read<SignInCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget swiperPage({
      required String image,
      required String title,
      required String subtitle,
    }) {
      return Column(
        children: [
          Expanded(
            child: Image.asset(image),
          ),
          const SizedBox(height: 16.0),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: ThemeApp.primaryYellow,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Container(),
            const Spacer(flex: 3),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimension.kMarginX),
                child: Column(
                  children: [
                    UmaiButton.primary(
                      onPressed: () {
                        showAppBottomSheet(
                            context: context,
                            horizontalPadding: 0,
                            maxHeight: 250,
                            isScrollControlled: true,
                            builder: (_) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimension.kMarginX),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Connexion & inscription',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Dimension.kTitlle),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: Dimension.kMarginY / 2),
                                        child: const Text(
                                          'En cliquant sur Continuer, tu confirmes avoir pris connaissance et accepté notre politique de confidentialité et nos termes d’usage.',
                                          style: TextStyle(
                                              fontSize: Dimension.kDescrition),
                                        )),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: Dimension.kMarginY / 2),
                                      child: UmaiButton.primary(
                                        onPressed: () {
                                          log('3333333333333333');
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistrationUsernameScreen()),
                                          );
                                          log('3333333333333333');
                                        },
                                        text: "Continuer",
                                      ),
                                    ),
                                  ],
                                )));
                      },
                      large: false,
                      text: "Modifier",
                    ),
                    AuthButton.apple(
                      callback: signInCubit.socialLogin,
                      backgroundColor: ThemeApp.white,
                      textColor: ThemeApp.primaryBlack,
                      buttonStyle: AuthButtonStyle.hybride,
                    ),
                    const SizedBox(height: 20.0),
                    if (Platform.isAndroid || Platform.isIOS)
                      AuthButton.google(
                        callback: signInCubit.socialLogin,
                        backgroundColor: ThemeApp.primaryBlack,
                        textColor: ThemeApp.white,
                        buttonStyle: AuthButtonStyle.hybride,
                      ),
                    const SizedBox(height: 12.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
