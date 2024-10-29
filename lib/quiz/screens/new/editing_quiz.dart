import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/screens/home.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/quiz_cubit.dart';
import 'package:umai/quiz/screens/new/add_quiz_question.dart';
import 'package:umai/quiz/screens/new/list_quiz_questions.dart';
import 'package:umai/quiz/screens/new/new_quiz.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class EditingQuizScreen extends StatefulWidget {
  const EditingQuizScreen({
    super.key,
  });

  @override
  State<EditingQuizScreen> createState() => _EditingQuizScreenState();
}

class _EditingQuizScreenState extends State<EditingQuizScreen>
    with CompletableMixin {
  late final QuizCubit quizCubit = context.read<QuizCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
        listener: onEventReceived,
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text('Mon Quiz'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.surfacegrey,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 72,
                          height: 88,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    'Animes de foot (version intermédiaire)',
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit_outlined),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewQuizScreen(isEdit: true)),
                                    );
                                  },
                                ),
                              ]),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Mattis cras egestas tris...',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppTheme.disabledText),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Text('Questions'),
                    ),
                    const Divider(),
                    ListQuizQuestionsScreen()
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddQuizQuestionScreen()),
                ),
                child: const Icon(Icons.add),
              ),
              bottomNavigationBar: SafeArea(
                minimum: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UmaiButton.primary(
                      onPressed: () {
                        quizCubit.publishQuiz();
                      },
                      text: "Publier",
                    ),
                  ],
                ),
              ),
            ));
  }

  void onEventReceived(BuildContext context, QuizState state) async {
    await waitForDialog();

    if (state is QuizLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is QuizPublishedState) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (state is QuizErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
