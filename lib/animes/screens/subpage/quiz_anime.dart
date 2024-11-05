import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/load_quiz_anime_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/widgets/item_quiz.dart';

class QuizAnimeScreen extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required Anime anime,
    bool withAction = false,
  }) {
    return BlocProvider.value(
      value: context.read<AnimeCubitManager>().get(anime),
      child: QuizAnimeScreen._(),
    );
  }

  const QuizAnimeScreen._();

  @override
  State<QuizAnimeScreen> createState() => _QuizAnimeScreenState();
}

class _QuizAnimeScreenState extends State<QuizAnimeScreen>
    with SingleTickerProviderStateMixin {
  late final animeManipCubit = context.read<AnimeManipCubit>();

  late final anime = animeManipCubit.anime;
  late final LoadQuizAnimeCubit cubit =
      LoadQuizAnimeCubit(context.read(), context.read(), anime.id.toString());

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Quiz>(
      cubit: cubit,
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
