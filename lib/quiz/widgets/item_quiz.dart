import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/screens/quiz_details.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class ItemQuiz extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: const ItemQuiz._(),
    );
  }

  const ItemQuiz._();
  @override
  State<ItemQuiz> createState() => _ItemQuizState();
}

class _ItemQuizState extends State<ItemQuiz>
    with SingleTickerProviderStateMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizManageCubit, QuizManageState>(
        builder: (context, state) {
      final Quiz quiz = quizManageCubit.quiz;
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => QuizDetailScreen.get(context: context, quiz: quiz),
            settings: const RouteSettings(name: quizRouteName),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (quiz.anime != null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        children: [
                          Image.network(
                            quiz.anime!.coverImage.large ?? '',
                            width: 72,
                            height: 88,
                            fit: BoxFit.cover,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              if (frame != null) return child;
                              return Container(
                                width: 72,
                                height: 88,
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                child: wasSynchronouslyLoaded
                                    ? child
                                    : Center(
                                        child: SizedBox(
                                          height: 16.0,
                                          width: 16.0,
                                          child: CircularProgressIndicator(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiaryContainer,
                                            strokeWidth: 2.0,
                                          ),
                                        ),
                                      ),
                              );
                            },
                            errorBuilder: (_, __, ___) => toSvgIcon(
                              icon: Assets.iconsError,
                            ),
                          ),
                          if (quiz.status == QuizStatus.pending &&
                              quiz.user.id == context.read<UserCubit>().user.id)
                            Positioned.fill(
                              child: Container(
                                  color: Colors.black.withOpacity(0.7),
                                  child: Center(
                                      child: toSvgIcon(
                                          icon: Assets.iconsEmpty,
                                          color: Colors.white,
                                          size: 32.0))),
                            ),
                        ],
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 72,
                        height: 88,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        child: Center(
                          child: toSvgIcon(icon: Assets.iconsEmpty, size: 32),
                        ),
                      ),
                    ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quiz.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      quiz.description,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppTheme.disabledText,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 9),
                    Text(
                        "${quiz.questionCount} questions • par ${quiz.user.username}",
                        style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  animeItemImage({required BuildContext context, required Anime anime}) =>
      Image(
        image: context.read<AppCacheManager>().getAnimeImage(anime),
        fit: BoxFit.cover,
        width: double.infinity,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame != null) return child;
          return Container(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            width: double.infinity,
            child: wasSynchronouslyLoaded
                ? child
                : Center(
                    child: SizedBox(
                      height: 16.0,
                      width: 16.0,
                      child: CircularProgressIndicator(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
          );
        },
        errorBuilder: (_, __, ___) => const Icon(Icons.error),
      );
}
