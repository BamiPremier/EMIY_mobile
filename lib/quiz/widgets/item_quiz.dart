import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/screens/quiz_details.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class ItemQuiz extends StatefulWidget {
  final Quiz quiz;
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: ItemQuiz._(quiz),
    );
  }

  const ItemQuiz._(this.quiz);
  @override
  State<ItemQuiz> createState() => _ItemQuizState();
}

class _ItemQuizState extends State<ItemQuiz>
    with SingleTickerProviderStateMixin {
  late final quizParticipationCubit = context.read<QuizManageCubit>();
  late final Quiz quiz = quizParticipationCubit.quiz;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => QuizDetailScreen.get(context: context, quiz: quiz))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (quiz.anime != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  quiz.anime!.coverImage.large ?? '',
                  width: 72,
                  height: 88,
                  fit: BoxFit.cover,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (frame != null) return child;
                    return Container(
                      width: 72,
                      height: 88,
                      color: Theme.of(context).colorScheme.tertiaryContainer,
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
                  errorBuilder: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
            if (quiz.anime != null) const SizedBox(width: 12),
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
  }
}
