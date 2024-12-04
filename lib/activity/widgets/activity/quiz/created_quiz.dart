import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/activity/widgets/activity/activity_head.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/widgets/item_quiz.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';

class CreatedQuizWidget extends StatefulWidget {
  final String targetEntity;

  static Widget get({
    required BuildContext context,
    required String targetEntity,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: CreatedQuizWidget._(targetEntity: targetEntity),
    );
  }

  const CreatedQuizWidget._({required this.targetEntity});
  @override
  State<CreatedQuizWidget> createState() => _CreatedQuizWidgetState();
}

class _CreatedQuizWidgetState extends State<CreatedQuizWidget>
    with CompletableMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizManageCubit, QuizManageState>(
        listener: onEventReceived,
        builder: (context, state) {
          final Quiz quiz = quizManageCubit.quiz;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ActivityHeadWidget.get(
                  targetEntity: widget.targetEntity,
                  context: context,
                  user: quiz.user),
              const SizedBox(height: 8),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      borderRadius: BorderRadius.circular(8)),
                  child: ItemQuiz.get(context: context, quiz: quiz)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: toSvgIcon(
                      icon: Assets.iconsShare,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () => quizManageCubit.shareQuiz(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ],
          );
        });
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
