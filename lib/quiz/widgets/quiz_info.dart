import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/monthToString.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/screens/quiz_details.dart';
import 'package:umai/quiz/services/quiz_participation_cubit_manager.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class QuizInfo extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizParticipationCubitManager>().get(quiz),
      child: QuizInfo._(),
    );
  }

  const QuizInfo._();
  @override
  State<QuizInfo> createState() => _QuizInfoState();
}

class _QuizInfoState extends State<QuizInfo>
    with SingleTickerProviderStateMixin {
  late final quizParticipationCubit = context.read<QuizParticipationCubit>();
  late final Quiz quiz = quizParticipationCubit.quiz;

  final isCollapsed = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            quiz.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          contentPadding: const EdgeInsets.only(
            top: 8.0,
          ),
          subtitle: Text(
            quiz.description,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppTheme.disabledText,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
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
                Text(
                  quiz.anime!.title.romaji,
                  style: Theme.of(context).textTheme.bodyMedium,
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
            Text(
              quiz.user.username,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (quiz.participation != null)
          Row(
            children: [
              SvgPicture.asset(
                Assets.iconPen,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 8),
              Text(
                "${quiz.participation!.score} points • ${quiz.participation!.rank}e",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
      ],
    );
  }
}
