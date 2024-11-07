import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/bloc/load_quiz_user_cubit.dart';
import 'package:umai/animes/bloc/load_quiz_anime_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/widgets/item_quiz.dart';

class QuizUserScreen extends StatefulWidget {
  final bool currentUser;
  QuizUserScreen({super.key, this.currentUser = true});
  @override
  State<QuizUserScreen> createState() => _QuizUserScreenState();
}

class _QuizUserScreenState extends State<QuizUserScreen>
    with SingleTickerProviderStateMixin {
  late final loadQuizUserCubit;
  @override
  void initState() {
    super.initState();

    if (widget.currentUser) {
      loadQuizUserCubit = LoadQuizUserCubit(
        cubitManager: context.read(),
        userService: context.read(),
      );
    } else {
      late final personCubit = context.read<PersonCubit>();
      loadQuizUserCubit = LoadQuizUserCubit(
        cubitManager: context.read(),
        userService: context.read(),
        userId: personCubit.user.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Quiz>(
      cubit: loadQuizUserCubit,
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
