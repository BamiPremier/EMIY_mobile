import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/screens/home.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/quiz_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/screens/new/add_quiz_question.dart';
import 'package:umai/quiz/screens/new/list_quiz_questions.dart';
import 'package:umai/quiz/screens/new/new_quiz.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class EditingQuizScreen extends StatefulWidget {
  final Quiz quiz;

  const EditingQuizScreen(this.quiz, {super.key});

  @override
  State<EditingQuizScreen> createState() => _EditingQuizScreenState();
}

class _EditingQuizScreenState extends State<EditingQuizScreen>
    with CompletableMixin {
  late final quizCubit = context.read<QuizCubit>();
  late final Quiz quiz = widget.quiz;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        return await showAppBottomSheet(
          context: context,
          builder: (_) => Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Quitter sans publier?',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    'Ton quiz est enregistré mais il ne sera pas publié. Tu peux continuer de l\'éditer en allant dans ton profil, onglet Quiz',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32.0),
                  UmaiButton.primary(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pop();
                      });
                    },
                    text: "Quitter",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  UmaiButton.white(
                    onPressed: () => Navigator.pop(context),
                    text: 'retour',
                  )
                ],
              )),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mon Quiz'),
        ),
        body: BlocConsumer<QuizCubit, QuizState>(
          listener: onEventReceived,
          builder: (context, state) {
            return (state is QuizCreatedState)
                ? SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (quiz.anime == null)
                              Image(
                                fit: BoxFit.cover,
                                width: 72,
                                height: 88,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                image: context
                                    .read<AppCacheManager>()
                                    .getImage(''),
                                errorBuilder: (context, url, error) =>
                                    Container(),
                              ),
                            if (quiz.anime != null)
                              Container(
                                width: 72,
                                height: 88,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: context
                                      .read<AppCacheManager>()
                                      .getImage(
                                          quiz.anime!.coverImage.large ?? ''),
                                  errorBuilder: (context, url, error) => Icon(
                                    Icons.error,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                    size: 32,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Expanded(
                                      child: Text(
                                        (state).quiz.title,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit_outlined),
                                      onPressed: () {
                                        quizCubit.toUpdate();
                                      },
                                    ),
                                  ]),
                                  Text(
                                    (state).quiz.description,
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
                        const ListQuizQuestionsScreen()
                      ],
                    ),
                  )
                : Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddQuizQuestionScreen()),
          ),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) {
                  return UmaiButton.primary(
                    onPressed: (state is QuizCreatedState &&
                            state.questions.isNotEmpty)
                        ? () {
                            quizCubit.publishQuiz();
                          }
                        : null,
                    text: "Publier",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, QuizState state) async {
    await waitForDialog();

    if (state is QuizLoadingPublishState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is QuizPublishedState) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    } else if (state is QuizUpdateState) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NewQuizScreen()),
      );
    } else if (state is QuizErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
