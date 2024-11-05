
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart'; 
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/quiz/models/quiz.dart'; 
import 'package:umai/quiz/services/quiz_cubit_manager.dart'; 

class QuizInfo extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: QuizInfo._(),
    );
  }

  const QuizInfo._();
  @override
  State<QuizInfo> createState() => _QuizInfoState();
}

class _QuizInfoState extends State<QuizInfo>
    with SingleTickerProviderStateMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();
  late final Quiz quiz = quizManageCubit.quiz;

  final isCollapsed = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: 16),
        if (quiz.anime != null)
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => AnimeDetailScreen.get(
                    context: context, anime: quiz.anime!))),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.iconStar,
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
                if (quiz.anime!.isInWatchlist || quiz.anime!.isViewed)
                  SvgPicture.asset(
                    Assets.iconBookmark,
                  ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        Row(
          children: [
            SvgPicture.asset(
              Assets.defaultAvatar,
              height: 20,
              width: 20,
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
        const SizedBox(height: 16),
        if (quiz.participation != null)
          Row(
            children: [
              Icon(
                Icons.edit_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.surfaceTint,
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
  }
}
