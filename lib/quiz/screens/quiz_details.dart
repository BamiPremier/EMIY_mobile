 
import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/load_quiz_ranking_cubit.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart'; 
import 'package:umai/quiz/bloc/quiz_question_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/screens/quiz_participation.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'package:umai/quiz/widgets/head_quiz.dart';
import 'package:umai/quiz/widgets/item_user_quiz.dart';
import 'package:umai/quiz/widgets/quiz_info.dart'; 
import 'package:umai/utils/dialogs.dart'; 

class QuizDetailScreen extends StatefulWidget {
  final Quiz quiz;
  static Widget get({
    required BuildContext context,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: QuizDetailScreen._(quiz: quiz),
    );
  }

  const QuizDetailScreen._({required this.quiz});
  @override
  State<QuizDetailScreen> createState() => _QuizDetailScreenState();
}

class _QuizDetailScreenState extends State<QuizDetailScreen>
    with CompletableMixin {
  final isCollapsed = ValueNotifier<bool>(true);
  late final quizManageCubit = context.read<QuizManageCubit>();
  late final Quiz quiz = quizManageCubit.quiz;
  late final QuizQuestionCubit quizQuestionCubit =
      context.read<QuizQuestionCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizQuestionCubit, QuizQuestionState>(
      listener: onEventReceived,
      builder: (context, stateQuizQuestion) => Scaffold(
        body: CustomScrollView(
          slivers: [
            HeadQuiz.get(context: context, quiz: quiz),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuizInfo.get(context: context, quiz: quiz),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Classement",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall),
                          Divider(
                            color: Theme.of(context).colorScheme.outlineVariant,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AutoListView.get<QuizParticipation>(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                cubit: LoadQuizRankingCubit(
                  context.read<QuizService>(),
                  quiz.id,
                ),
                itemBuilder: (context, quizParticipation) =>
                    UserItemQuiz(quizParticipation: quizParticipation),
                loadingBuilder: (context) => Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: LinearProgressIndicator(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      backgroundColor:
                          Theme.of(context).colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(30),
                    )),
                loadingMoreBuilder: (context) => Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: LinearProgressIndicator(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      backgroundColor:
                          Theme.of(context).colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(30),
                    )),
                errorBuilder: (context, retry) => Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Une erreur est survenue"),
                      TextButton(
                        onPressed: retry,
                        child: const Text("Réessayer"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UmaiButton.primary(
                onPressed: participer,
                text: "Participer",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void participer() => showAppBottomSheet(
      context: context,
      builder: (_) => Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Participer au quiz',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Tu auras 30s pour répondre à chacune des 8 questions, ton score te sera dévoilé à la fin. ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32.0),
                UmaiButton.primary(
                  onPressed: () {
                    Navigator.of(context).pop();
                    quizQuestionCubit.getQuizQuestions(quiz: widget.quiz);
                  },
                  text: "Commencer",
                ),
              ],
            ),
          ));

  void onEventReceived(BuildContext context, QuizQuestionState state) async {
    await waitForDialog();

    if (state is QuizQuestionLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is QuizListQuestionState) {
      if (state.questions.isNotEmpty) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => QuizParticipationScreen.get(
                context: context,
                quiz: widget.quiz,
                questions: state.questions)));
      } else {
        showErrorToast(content: "Aucune question trouvée", context: context);
      }
    } else if (state is QuizQuestionErrorState) {
      showErrorToast(content: state.error, context: context);
    }
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
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Editer',
                icon: Icons.edit_outlined,
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Signaler',
                icon: Icons.report_gmailerrorred_rounded,
                onTap: () => print(''),
              ),
            ],
          )));
}
