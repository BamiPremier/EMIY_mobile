import 'dart:developer'; 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/quiz_cubit.dart';
import 'package:umai/quiz/screens/new/editing_quiz.dart';
import 'package:umai/quiz/screens/new/search_anime_delegate.dart'; 
import 'package:umai/utils/dialogs.dart';

class NewQuizScreen extends StatefulWidget {
  const NewQuizScreen({
    super.key,
  });

  @override
  State<NewQuizScreen> createState() => _NewQuizScreenState();
}

class _NewQuizScreenState extends State<NewQuizScreen> with CompletableMixin {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late final QuizCubit quizCubit = context.read<QuizCubit>();
  @override
  void initState() {
    super.initState();
    log(quizCubit.state.toString());
    if (quizCubit.state is QuizUpdateState) {
      setState(() {
        _titreController.text =
            (quizCubit.state as QuizUpdateState).quiz!.title;
        _descriptionController.text =
            (quizCubit.state as QuizUpdateState).quiz!.description;
    quizCubit.selectAnime((quizCubit.state as QuizUpdateState).anime!);
      });
    }
  }

  @override
  void dispose() {
    _titreController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: onEventReceived,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(quizCubit.state is QuizUpdateState
              ? "Modifier le quiz"
              : "Nouveau Quiz"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Titre'),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: _titreController,
                        decoration: InputDecoration(
                          hintText: "Titre du quiz",
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.done,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        validator: (value) => Validators.empty(value),
                        onEditingComplete: FocusScope.of(context).unfocus,
                      ),
                      const SizedBox(height: 16),
                      const Text('Description'),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          hintText: "Quel est le thème du quiz?",
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        minLines: 4,
                        maxLines: 4,
                        maxLength: 360,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        maxLengthEnforcement:
                            MaxLengthEnforcement.truncateAfterCompositionEnds,
                        onEditingComplete: FocusScope.of(context).unfocus,
                    
                      ),
                    ],
                  ),
                ),
                const Text('Anime'),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: SearchAnimeDelegate(context),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            (state is QuizSelectAnimeState)
                                ? (state).anime.title.romaji
                                : (state is QuizUpdateState)
                                    ? (state).anime?.title.romaji ??
                                        'Sélectionne un anime'
                                    : 'Sélectionne un anime',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UmaiButton.primary(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    quizCubit.saveQuiz(
                      title: _titreController.text,
                      description: _descriptionController.text,
                    );

                    // widget.isEdit
                    //     ? quizCubit.updateQuiz(
                    //         title: _titreController.text,
                    //         description: _descriptionController.text,
                    //       )
                    //     : quizCubit.createQuiz(
                    //         title: _titreController.text,
                    //         description: _descriptionController.text,
                    //       );
                  }
                },
                text: "Suivant",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, QuizState state) async {
    await waitForDialog();

    if (state is QuizLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is QuizCreatedState) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EditingQuizScreen(state.quiz)),
      );
    } else if (state is QuizErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
