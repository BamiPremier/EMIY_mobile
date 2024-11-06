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

class EQuizUserScreen extends StatefulWidget {
  const EQuizUserScreen();

  @override
  State<EQuizUserScreen> createState() => _EQuizUserScreenState();
}

class _EQuizUserScreenState extends State<EQuizUserScreen>
    with SingleTickerProviderStateMixin {
  late final personCubit = context.read<PersonCubit>();
  late final followingCubit = LoadQuizUserCubit(
    cubitManager: context.read(),
    userService: context.read(),
    userId: personCubit.user.id,
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
