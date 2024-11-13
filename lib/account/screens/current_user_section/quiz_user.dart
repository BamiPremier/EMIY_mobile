import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/bloc/load_quiz_user_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/widgets/item_quiz.dart';

class QuizUserScreen extends StatefulWidget {
  const QuizUserScreen();

  @override
  State<QuizUserScreen> createState() => _QuizUserScreenState();
}

class _QuizUserScreenState extends State<QuizUserScreen>
    with SingleTickerProviderStateMixin { 
  late final followingCubit = LoadQuizUserCubit(
    cubitManager: context.read(),
    userService: context.read(), 
  );
  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Quiz>(
      cubit: followingCubit,
      padding: EdgeInsets.zero,
      autoManage: false,
      itemBuilder: (context, quiz) =>
          ItemQuiz.get(context: context, quiz: quiz),
      errorBuilder: (context, retry) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Une erreur s'est produite"),
          TextButton(
            onPressed: retry,
            child: const Text("Réessayer"),
          )
        ],
      ),
    );
  }
}
