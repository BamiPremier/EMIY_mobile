import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/screens/home.dart';
import 'package:umai/utils/themes.dart';

class QuizFinishedScreen extends StatefulWidget {
  const QuizFinishedScreen({super.key});

  @override
  State<QuizFinishedScreen> createState() => _QuizFinishedScreenState();
}

class _QuizFinishedScreenState extends State<QuizFinishedScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.primaryColorTheme(context),
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 32.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text('Quiz terminé!',
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
