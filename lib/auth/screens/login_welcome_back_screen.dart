import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/screens/home.dart';
import 'package:umai/utils/themes.dart';

class LoginWelcomeBackScreen extends StatefulWidget {
  const LoginWelcomeBackScreen({super.key});

  @override
  State<LoginWelcomeBackScreen> createState() => _LoginWelcomeBackScreenState();
}

class _LoginWelcomeBackScreenState extends State<LoginWelcomeBackScreen> {
  late final authCubit = context.read<AuthCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.primaryColorTheme(context),
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 32.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text('Bon retour parmi nous!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                ),
                UmaiButton.white(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false
                    );
                  },
                  text: "Merci",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
