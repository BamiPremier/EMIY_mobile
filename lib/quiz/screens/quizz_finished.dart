import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class QuizFinishedScreen extends StatefulWidget {
  final int nombrePoints;
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
    required int nombrePoints,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: QuizFinishedScreen._(nombrePoints: nombrePoints),
    );
  }

  const QuizFinishedScreen._({
    required this.nombrePoints,
  });

  @override
  State<QuizFinishedScreen> createState() => _QuizFinishedScreenState();
}

class _QuizFinishedScreenState extends State<QuizFinishedScreen>
    with CompletableMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizManageCubit, QuizManageState>(
      listener: onEventReceived,
      builder: (context, stateQuizManage) {
        final Quiz quiz = quizManageCubit.quiz;

        return Theme(
          data: AppTheme.primaryColorTheme(context),
          child: Scaffold(
            body: SafeArea(
              minimum: const EdgeInsets.only(bottom: 32.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const Spacer(),
                    Text('Tu viens de jouer à',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                    const SizedBox(height: 12),
                    Text(quiz.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge),
                    const Spacer(),
                    Text('Ton Score',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 16,
                            )),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 40),
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: Text(
                        '${widget.nombrePoints.toString().padLeft(quiz.questionCount.toString().length, '0')} / ${quiz.questionCount}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 64),
                      ),
                    ),
                    const Spacer(flex: 2),
                    UmaiButton.white(
                      large: false,
                      onPressed: () {
                        context.read<QuizManageCubit>().shareQuiz();
                      },
                      icon: toSvgIcon(icon: Assets.iconsShare),
                      text: "Partager",
                    ),
                    const SizedBox(height: 24),
                    UmaiButton.white(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: "Fermer",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onEventReceived(BuildContext context, QuizManageState state) async {
    await waitForDialog();

    if (state is ShareQuizLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    } else if (state is ShareQuizSuccesState) {
      await Share.share(state.link);
    } else if (state is QuizManageErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
