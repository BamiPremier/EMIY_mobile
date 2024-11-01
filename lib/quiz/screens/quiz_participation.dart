import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
import 'package:umai/quiz/bloc/quiz_question_cubit.dart';
import 'package:umai/quiz/bloc/timer_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart';
import 'package:umai/quiz/screens/quizz_finished.dart';
import 'package:umai/quiz/widgets/question_step.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'package:umai/quiz/widgets/head_quiz.dart';
import 'package:umai/utils/themes.dart';

class QuizParticipationScreen extends StatefulWidget {
  final Quiz quiz;
  static Widget get(
      {required BuildContext context,
      required Quiz quiz,
      required List<QuizQuestionResponse> questions}) {
    return BlocProvider(
      create: (context) => QuizParticipationCubit(
        context.read(),
        questions,
      ),
      child: QuizParticipationScreen._(quiz: quiz),
    );
  }

  const QuizParticipationScreen._({required this.quiz});

  @override
  State<QuizParticipationScreen> createState() =>
      _QuizParticipationScreenState();
}

class _QuizParticipationScreenState extends State<QuizParticipationScreen> {
  late final QuizQuestionCubit quizQuestionCubit =
      context.read<QuizQuestionCubit>();
  late final QuizParticipationCubit quizParticipationCubit =
      context.read<QuizParticipationCubit>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizQuestionCubit, QuizQuestionState>(
        listener: (context, stateQuizQuestion) {
      if (stateQuizQuestion is QuizParticipationFinishedState) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const QuizFinishedScreen()));
      }
    }, builder: (context, stateQuizQuestion) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            HeadQuiz.get(context: context, quiz: widget.quiz),
            if (stateQuizQuestion is QuizQuestionLoadingState)
              _buildLoadingIndicator(context)
            else if (stateQuizQuestion is QuizListQuestionState)
              stateQuizQuestion.questions.isNotEmpty
                  ? _buildQuestionContent(context)
                  : SliverToBoxAdapter(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Aucune question disponible'),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () {
                                quizQuestionCubit.getQuizQuestions(
                                    quiz: widget.quiz);
                              },
                              child: const Text('Rafraîchir'),
                            ),
                          ],
                        ),
                      ),
                    )
          ],
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
      );
    });
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.all(16.0),
        sliver: SliverToBoxAdapter(
            child: Center(
                child: LinearProgressIndicator(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(30),
        ))));
  }

  Widget _buildQuestionContent(BuildContext context) {
    return BlocBuilder<QuizParticipationCubit, QuizParticipationState>(
        builder: (context, stateParticipation) {
      final state = (stateParticipation as QuizParticipationIdleState);
      return SliverPadding(
        padding: const EdgeInsets.all(16.0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 0) {
                return Text(
                  'Question ${state.questions.indexOf(state.currentQuestion) + 1} - ${stateParticipation.questions.length}',
                  style: Theme.of(context).textTheme.titleSmall,
                );
              }

              return _buildQuestionDetails(context);
            },
            childCount: 2,
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
          ),
        ),
      );
    });
  }

  Widget _buildQuestionDetails(
    BuildContext context,
  ) {
    return BlocBuilder<QuizParticipationCubit, QuizParticipationState>(
      builder: (context, stateParticipation) {
        if (stateParticipation is! QuizParticipationIdleState) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (stateParticipation as QuizParticipationIdleState)
                  .currentQuestion
                  .label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppTheme.disabledText,
                  ),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            _buildTimer(context),
            const SizedBox(height: 32.0),
            _buildResponsesList(
              context,
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimer(BuildContext context) {
    return BlocProvider.value(
        value: quizParticipationCubit.timerCubit,
        child: BlocBuilder<TimerCubit, ATimerState>(
            builder: (context, timerState) {
          if (timerState is! TimerState) return const SizedBox.shrink();

          final timerCubit = context.read<QuizParticipationCubit>().timerCubit;
          return LinearProgressIndicator(
            value: timerState.timer.inMilliseconds /
                timerCubit.maxDuration.inMilliseconds,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(30),
          );
        }));
  }

  Widget _buildResponsesList(
    BuildContext context,
  ) {
    return BlocBuilder<QuizParticipationCubit, QuizParticipationState>(
      builder: (context, stateParticipation) {
        final currentQuestionState =
            (stateParticipation as QuizParticipationIdleState);
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: currentQuestionState.currentQuestion.responses.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
          itemBuilder: (context, index) {
            final backgroundColor, foregroundColor;
            final currentResponse =
                currentQuestionState.currentQuestion.responses[index];
            if (stateParticipation is QuizParticipationSubmittedState) {
              backgroundColor = currentResponse.isCorrect
                  ? AppTheme.green
                  : Theme.of(context).colorScheme.surfaceBright;
              foregroundColor = currentResponse.isCorrect
                  ? AppTheme.onHighGreen
                  : Theme.of(context).colorScheme.onSurfaceVariant;
            } else if (stateParticipation is QuizParticipationIdleState) {
              final isSelected =
                  stateParticipation.userResponse?.id == currentResponse.id;
              backgroundColor = isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceBright;
              foregroundColor = isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurfaceVariant;
            } else {
              // État par défaut
              backgroundColor = Theme.of(context).colorScheme.surfaceBright;
              foregroundColor = Theme.of(context).colorScheme.onSurfaceVariant;
            }

            return GestureDetector(
              onTap: () => context
                  .read<QuizParticipationCubit>()
                  .selectAnswer(currentResponse),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Text(
                  currentResponse.label,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: foregroundColor,
                      ),
                ),
              ) /*  isSelected
              ? selectedOption(currentResponse.label)
              : unSelectedOption(currentResponse.label) */
              ,
            );
          },
        );
      },
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return BlocBuilder<QuizParticipationCubit, QuizParticipationState>(
      builder: (context, stateParticipation) {
        return SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: UmaiButton.primary(
            onPressed: ((stateParticipation is! QuizParticipationIdleState)
                ? null
                : () {
                    if (stateParticipation is QuizParticipationSubmittedState) {
                      quizParticipationCubit.nextQuestion();
                    } else {
                      quizParticipationCubit.submit();
                    }
                  }),
            text: stateParticipation is QuizParticipationSubmittedState
                ? "Suivant"
                : "Valider",
          ),
        );
      },
    );
  }
}
