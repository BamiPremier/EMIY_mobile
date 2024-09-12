import 'dart:developer'; 

import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/registrationuser/registration_username.dart'; 
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/utils/app_dimension.dart';
import 'package:umai/utils/themes.dart';

class LoginWelcomeBackScreen extends StatefulWidget {
  const LoginWelcomeBackScreen({super.key});

  @override
  State<LoginWelcomeBackScreen> createState() => _LoginWelcomeBackScreenState();
}

class _LoginWelcomeBackScreenState extends State<LoginWelcomeBackScreen> {
  late final signInCubit = context.read<SignInCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      backgroundColor: ThemeApp.primaryYellow,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
           const   Spacer(
                flex: 1,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('Bon retour parmi nous!',
                        textAlign: TextAlign.center,
                        
                        style: Theme.of(context).textTheme.displaySmall)
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: Dimension.kMarginY),
                child: UmaiButton.secondary(
                  onPressed: () {
                    log('3333333333333333');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegistrationUsernameScreen()),
                    );
                    log('3333333333333333');
                  },
                  text: "Merci",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
