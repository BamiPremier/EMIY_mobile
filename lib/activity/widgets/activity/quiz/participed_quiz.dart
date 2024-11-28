import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/activity/widgets/activity/activity_head.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/widgets/item_quiz.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';

class ParticipedQuizWidget extends StatefulWidget {
  final String targetEntity;

  static Widget get(
      {required BuildContext context,
      required Quiz quiz,
      required String targetEntity,
      required User user}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonCubit>.value(
          value: context.read<PersonCubitManager>().get(user),
        ),
        BlocProvider.value(
          value: context.read<QuizManageCubitManager>().get(quiz),
        )
      ],
      child: ParticipedQuizWidget._(targetEntity: targetEntity),
    );
  }

  ParticipedQuizWidget._({required this.targetEntity});

  @override
  _ParticipedQuizWidgetState createState() => _ParticipedQuizWidgetState();
}

class _ParticipedQuizWidgetState extends State<ParticipedQuizWidget>
    with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizManageCubit, QuizManageState>(
        listener: onEventReceived,
        builder: (context, state) {
          final quizManageCubit = context.read<QuizManageCubit>();
          final Quiz quiz = quizManageCubit.quiz;
          final personCubit = context.read<PersonCubit>();
          final user = personCubit.user;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ActivityHeadWidget.get(
                  targetEntity: widget.targetEntity,
                  context: context,
                  user: user),
              SizedBox(
                height: 8,
              ),
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
                  SizedBox(
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
