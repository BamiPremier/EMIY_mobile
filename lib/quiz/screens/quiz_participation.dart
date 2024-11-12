import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
import 'package:umai/quiz/bloc/quiz_question_cubit.dart';
import 'package:umai/quiz/bloc/timer_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart';
import 'package:umai/quiz/screens/quiz_details.dart';
import 'package:umai/quiz/screens/quizz_finished.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/widgets/head_particiation.dart';
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

class _QuizParticipationScreenState extends State<QuizParticipationScreen>
    with CompletableMixin {
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
    return BlocListener<QuizParticipationCubit, QuizParticipationState>(
        listener: onEventReceived,
        child: BlocBuilder<QuizQuestionCubit, QuizQuestionState>(
          builder: (context, stateQuizQuestion) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  HeadParticipation.get(context: context, quiz: widget.quiz),
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
          },
        ));
  }

  void onEventReceived(
      BuildContext context, QuizParticipationState state) async {
    await waitForDialog();

    if (state is QuizParticipationLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    }

    if (state is QuizParticipationFinishedState) {
      context.read<QuizManageCubitManager>().add(state.quiz);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (_) => QuizFinishedScreen(
                  nombrePoints: state.nombrePoints, quiz: widget.quiz)),
          (route) => route.settings.name == quizRouteName);
    }
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
      if (stateParticipation is QuizParticipationFinishedState ||
          stateParticipation is QuizParticipationLoadingState) {
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      }
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
              (stateParticipation).currentQuestion.label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppTheme.disabledText,
                  ),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            _buildTimer(context),
            const SizedBox(height: 32.0),
            _buildResponsesList(context),
          ],
        );
      },
    );
  }

  Widget _buildTimer(BuildContext context) {
    return BlocProvider.value(
        value: quizParticipationCubit.timerCubit,
        child: BlocConsumer<TimerCubit, ATimerState>(
            listener: (context, state) {},
            builder: (context, timerState) {
              if (timerState is! TimerState) return const SizedBox.shrink();

              final timerCubit =
                  context.read<QuizParticipationCubit>().timerCubit;
              return LinearProgressIndicator(
                value: 1.0 -
                    timerState.timer.inMicroseconds /
                        timerCubit.maxDuration.inMicroseconds,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
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
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: currentQuestionState.currentQuestion.responses.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
          itemBuilder: (context, index) {
            final Color backgroundColor, foregroundColor;
            final currentResponse =
                currentQuestionState.currentQuestion.responses[index];
            if (stateParticipation is QuizParticipationSubmittedState) {
              final isSelected =
                  stateParticipation.userResponse?.id == currentResponse.id;
              backgroundColor = currentResponse.isCorrect
                  ? AppTheme.green
                  : isSelected
                      ? AppTheme.errorRed
                      : Theme.of(context).colorScheme.surfaceBright;
              foregroundColor = currentResponse.isCorrect
                  ? AppTheme.onHighGreen
                  : isSelected
                      ? Colors.white
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
              backgroundColor = Theme.of(context).colorScheme.surfaceBright;
              foregroundColor = Theme.of(context).colorScheme.onSurfaceVariant;
            }

            return GestureDetector(
                onTap: () =>
                    stateParticipation is QuizParticipationSubmittedState
                        ? null
                        : context
                            .read<QuizParticipationCubit>()
                            .selectAnswer(currentResponse),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16),
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
                ));
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
            onPressed: getAction(stateParticipation),
            text: stateParticipation is QuizParticipationSubmittedState
                ? "Suivant"
                : "Valider",
          ),
        );
      },
    );
  }

  getAction(QuizParticipationState stateParticipation) {
    return (stateParticipation is QuizParticipationSubmittedState)
        ? () => quizParticipationCubit.nextQuestion()
        : ((stateParticipation is! QuizParticipationIdleState &&
                stateParticipation is! QuizParticipationSubmittedState)
            ? null
            : (stateParticipation is QuizParticipationIdleState &&
                    (stateParticipation as QuizParticipationIdleState)
                            .userResponse ==
                        null)
                ? null
                : () => quizParticipationCubit.submit());
  }
}
