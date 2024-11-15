import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class QuizInfo extends StatefulWidget {
  const QuizInfo({super.key});

  @override
  State<QuizInfo> createState() => _QuizInfoState();
}

class _QuizInfoState extends State<QuizInfo>
    with SingleTickerProviderStateMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();

  final isCollapsed = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizManageCubit, QuizManageState>(
        builder: (context, state) {
      final Quiz quiz = quizManageCubit.quiz;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            quiz.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            quiz.description,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppTheme.disabledText,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (quiz.anime != null) const SizedBox(height: 16),
          if (quiz.anime != null)
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AnimeDetailScreen.get(
                      context: context, anime: quiz.anime!))),
              child: Row(
                children: [
                  toSvgIcon(
                    icon: Assets.iconsTrending,
                    color: Theme.of(context).colorScheme.surfaceTint
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      quiz.anime!.title.romaji,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(width: 8),
                  BlocBuilder<AnimeManipCubit, AnimeManipState>(
                    buildWhen: (_, state) => state is InitializingAnimeManipState,
                    builder: (context, state) {
                      final anime = context.read<AnimeManipCubit>().anime;
                      if (anime.isViewed || anime.isInWatchlist) {
                        return toSvgIcon(
                          icon: Assets.iconsBookmark,
                          size: 14.0,
                          color: Theme.of(context).colorScheme.surfaceTint
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PersonAccountScreen.get(
                    context: context, user: quiz.user))),
            child: Row(
              children: [
                ProfilePicture(
                  image: quiz.user.image,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    quiz.user.username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          if (quiz.participation != null) const SizedBox(height: 16),
          if (quiz.participation != null)
            Row(
              children: [
                toSvgIcon(
                  icon: Assets.iconsTime,
                  color: Theme.of(context).colorScheme.surfaceTint
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    "${quiz.participation!.score} points • ${quiz.participation!.rank}${quiz.participation!.rank == 1 ? 'er' : 'e'}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
        ],
      );
    });
  }
}
