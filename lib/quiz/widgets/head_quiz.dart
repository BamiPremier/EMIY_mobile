import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/screens/quiz_details.dart';
import 'package:umai/quiz/services/quiz_participation_cubit_manager.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class HeadQuiz extends StatefulWidget {
   
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizParticipationCubitManager>().get(quiz),
      child: HeadQuiz._(),
    );
  }

  const HeadQuiz._();
  @override
  State<HeadQuiz> createState() => _HeadQuizState();
}

class _HeadQuizState extends State<HeadQuiz>
    with SingleTickerProviderStateMixin {
 late final quizParticipationCubit = context.read<QuizParticipationCubit>();
  late final Quiz quiz = quizParticipationCubit.quiz;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      expandedHeight: 200,
      systemOverlayStyle: Theme.of(context)
          .appBarTheme
          .systemOverlayStyle
          ?.copyWith(statusBarIconBrightness: Brightness.light),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (quiz.anime != null)
              CachedNetworkImage(
                imageUrl: quiz.anime!.coverImage.large ?? '',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  size: 32,
                ),
              ),
            if (quiz.anime == null)
              CachedNetworkImage(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                imageUrl: '',
                errorWidget: (context, url, error) => Container(),
              ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.inverseSurface,
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      leading: BackButton(
        color: AppTheme.white,
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => actionsOptions(),
          color: AppTheme.white,
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  void actionsOptions() {
    // Implement the actionsOptions method
  }
}
