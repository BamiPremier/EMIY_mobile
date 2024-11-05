import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
import 'package:umai/quiz/bloc/quiz_question_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/utils/themes.dart';

class HeadParticipation extends StatefulWidget {
  const HeadParticipation({super.key});
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: HeadParticipation._(),
    );
  }

  HeadParticipation._();
  @override
  State<HeadParticipation> createState() => _HeadParticipationState();
}

class _HeadParticipationState extends State<HeadParticipation>
    with SingleTickerProviderStateMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();
  late final Quiz quiz = quizManageCubit.quiz;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizQuestionCubit, QuizQuestionState>(
        builder: (context, stateQuizQuestion) {
      return BlocBuilder<QuizParticipationCubit, QuizParticipationState>(
          builder: (context, stateParticipation) {
        if (stateParticipation is! QuizParticipationIdleState) {
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
                  Image(
                    fit: BoxFit.cover,
                    image: context.read<AppCacheManager>().getImage(''),
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    errorBuilder: (context, error, stackTrace) => Container(),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: MediaQuery.of(context).viewPadding.top +
                          kToolbarHeight,
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
            leading: const BackButton(
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
        final state = stateParticipation;
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
                Image(
                  fit: BoxFit.cover,
                  image: context
                      .read<AppCacheManager>()
                      .getImage(state.currentQuestion.image ?? ''),
                  color: state.currentQuestion == null
                      ? Theme.of(context).colorScheme.onTertiaryContainer
                      : null,
                  errorBuilder: (context, error, stackTrace) =>
                      quiz.anime != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                              size: 32,
                            )
                          : Container(),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height:
                        MediaQuery.of(context).viewPadding.top + kToolbarHeight,
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
          leading: const BackButton(
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
      });
    });
  }

  void actionsOptions() => showAppBottomSheet(
      context: context,
      horizontalPadding: 16.0,
      builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ActionWidget(
                title: 'Partager...',
                icon: Icons.share_outlined,
                onTap: () => quizManageCubit.shareQuiz(),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          )));
}
