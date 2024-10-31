import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/quiz_cubit.dart';
import 'package:umai/quiz/models/question_quiz.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';

class AddQuizQuestionScreen extends StatefulWidget {
  @override
  _AddQuizQuestionScreenState createState() => _AddQuizQuestionScreenState();
}

class _AddQuizQuestionScreenState extends State<AddQuizQuestionScreen>
    with CompletableMixin {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _propositionControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  void _addProposition() {
    if (_propositionControllers.length < 4) {
      setState(() {
        _propositionControllers.add(TextEditingController());
      });
    }
  }

  void _removeProposition(int index) {
    if (_propositionControllers.length > 2) {
      setState(() {
        _propositionControllers.removeAt(index);
      });
    }
  }

  int? _correctAnswerIndex;
  void selectCorrectAnswer(int index) {
    if (_propositionControllers.length > 1 &&
        _correctAnswerIndex != index &&
        _questionController.text.isNotEmpty) {
      setState(() {
        _correctAnswerIndex = index;
      });
    }
  }

  late final QuizCubit quizCubit = context.read<QuizCubit>();
  var image = '';
  onPickImage({required ImageSource source, required BuildContext context}) {
    final picker = ImagePicker();
    picker.pickImage(source: source).then((image) {
      if (image == null) return;

      setState(() {
        this.image = image.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizCubit, QuizState>(
      listener: onEventReceived,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Question'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PopupMenuButton(
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    value: ImageSource.camera,
                    child: ListTile(
                      leading: Icon(Icons.camera_alt),
                      minLeadingWidth: 24.0,
                      title: Text('Prendre une photo'),
                      dense: true,
                    ),
                  ),
                  const PopupMenuItem(
                    value: ImageSource.gallery,
                    child: ListTile(
                      leading: Icon(Icons.image),
                      minLeadingWidth: 24.0,
                      title: Text('Choisir une image'),
                      dense: true,
                    ),
                  ),
                ],
                onSelected: (value) =>
                    onPickImage(source: value, context: context),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: Center(
                    child: image.isEmpty
                        ? SvgPicture.asset(Assets.iconPictureAdd)
                        : Image.file(File(image),
                            width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),
                        const Text('Question'),
                        const SizedBox(height: 8),
                        TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            controller: _questionController,
                            decoration: InputDecoration(
                              hintText: 'Pose une question',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                            maxLines: 4,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.done,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            onEditingComplete: FocusScope.of(context).unfocus,
                            validator: (value) => Validators.empty(value)),
                        const SizedBox(height: 16),
                        const Text('Propositions'),
                      ])),
              const Divider(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._propositionControllers.map((controller) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: 'Entre le texte',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textInputAction: TextInputAction.done,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  onTapOutside: (event) =>
                                      FocusScope.of(context).unfocus(),
                                  onEditingComplete:
                                      FocusScope.of(context).unfocus,
                                  validator: (value) =>
                                      Validators.empty(value)),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => selectCorrectAnswer(
                                  _propositionControllers.indexOf(controller)),
                              child: Icon(
                                Icons.check_circle_outline,
                                size: 24,
                                color: _correctAnswerIndex ==
                                        _propositionControllers
                                            .indexOf(controller)
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    if (_propositionControllers.length < 4)
                      GestureDetector(
                        onTap: _addProposition,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ajouter',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                            const Icon(Icons.keyboard_arrow_down_outlined),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UmaiButton.primary(
                onPressed: _correctAnswerIndex == null
                    ? null
                    : () {
                        quizCubit.addQuestion(QuestionQuiz(
                            correctAnswerIndex: _correctAnswerIndex!,
                            image: image,
                            label: _questionController.text,
                            responses: _propositionControllers
                                .map((e) => QuizResponse(
                                    label: e.text,
                                    isCorrect: _correctAnswerIndex ==
                                        _propositionControllers.indexOf(e)))
                                .toList()));
                      },
                text: "Enregistrer",
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
      Navigator.pop(context);
    } else if (state is QuizErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
