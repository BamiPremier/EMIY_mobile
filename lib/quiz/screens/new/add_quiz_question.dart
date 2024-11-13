import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/create_quiz_question_cubit.dart';
import 'package:umai/quiz/bloc/quiz_cubit.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';

class AddQuizQuestionScreen extends StatefulWidget {
  @override
  _AddQuizQuestionScreenState createState() => _AddQuizQuestionScreenState();
}

class _AddQuizQuestionScreenState extends State<AddQuizQuestionScreen>
    with CompletableMixin {
  @override
  void initState() {
    super.initState();

    context.read<CreateQuizQuestionCubit>().initializeForm();
  }

  late final QuizCubit quizCubit = context.read<QuizCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocConsumer<CreateQuizQuestionCubit, CreateQuizQuestionState>(
        listener: onEventReceived,
        builder: (context, state) {
          final cubit = context.read<CreateQuizQuestionCubit>();

          if (state is QuizCreateQuestionFormBuildState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () => cubit.onPickImage(
                      source: ImageSource.gallery,
                    ),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      child: Center(
                        child: state.imagePath == null
                            ? SvgPicture.asset(Assets.iconPictureAdd)
                            : Image.file(
                                File(state.imagePath!),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),
                        const Text('Question'),
                        const SizedBox(height: 8),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodyMedium,
                          controller: state.questionController,
                          decoration: InputDecoration(
                            hintText: 'Pose une question',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant),
                          ),
                          maxLines: 4,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          onEditingComplete: FocusScope.of(context).unfocus,
                          validator: (value) => Validators.empty(value),
                        ),
                        const SizedBox(height: 16),
                        const Text('Propositions'),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...state.propositionControllers.map((controller) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    controller: controller,
                                    onChanged: (value) {
                                      if (value.trim().isEmpty) {
                                        cubit.selectCorrectAnswer(null);
                                      }
                                    },
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
                                    onTapOutside: (event) =>
                                        FocusScope.of(context).unfocus(),
                                    onEditingComplete:
                                        FocusScope.of(context).unfocus,
                                    validator: (value) =>
                                        Validators.empty(value),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => cubit.selectCorrectAnswer(
                                    state.propositionControllers
                                        .indexOf(controller),
                                  ),
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    size: 24,
                                    color: state.correctAnswerIndex ==
                                            state.propositionControllers
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
                        if (state.propositionControllers.length < 4)
                          GestureDetector(
                            onTap: cubit.addProposition,
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
            );
          }
          if (state is QuizUpdateQuestionFormBuildState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () => cubit.onPickImage(
                      source: ImageSource.gallery,
                    ),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      child: Center(
                        child: state.imagePath == null
                            ? SvgPicture.asset(Assets.iconPictureAdd)
                            : (state.imagePath!.contains('cloudfront'))
                                ? Image(
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    image: context
                                        .read<AppCacheManager>()
                                        .getImage((state).imagePath ?? ''),
                                    errorBuilder: (context, url, error) => Icon(
                                      Icons.error,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiaryContainer,
                                      size: 32,
                                    ),
                                  )
                                : Image.file(
                                    File(state.imagePath!),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),
                        const Text('Question'),
                        const SizedBox(height: 8),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodyMedium,
                          controller: state.questionController,
                          decoration: InputDecoration(
                            hintText: 'Pose une question',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant),
                          ),
                          maxLines: 4,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          onEditingComplete: FocusScope.of(context).unfocus,
                          validator: (value) => Validators.empty(value),
                        ),
                        const SizedBox(height: 16),
                        const Text('Propositions'),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...state.propositionControllers.map((controller) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    controller: controller,
                                    onChanged: (value) {
                                      if (value.trim().isEmpty) {
                                        cubit.selectCorrectAnswer(null);
                                      }
                                    },
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
                                    onTapOutside: (event) =>
                                        FocusScope.of(context).unfocus(),
                                    onEditingComplete:
                                        FocusScope.of(context).unfocus,
                                    validator: (value) =>
                                        Validators.empty(value),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => cubit.selectCorrectAnswer(
                                    state.propositionControllers
                                        .indexOf(controller),
                                  ),
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    size: 24,
                                    color: state.correctAnswerIndex ==
                                            state.propositionControllers
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
                        if (state.propositionControllers.length < 4)
                          GestureDetector(
                            onTap: cubit.addProposition,
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
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: BlocBuilder<CreateQuizQuestionCubit, CreateQuizQuestionState>(
          builder: (context, state) {
            final cubit = context.read<CreateQuizQuestionCubit>();

            return UmaiButton.primary(
              onPressed: (state is QuizCreateQuestionFormBuildState ||
                          state is QuizUpdateQuestionFormBuildState) &&
                      (state is QuizCreateQuestionFormBuildState
                          ? state.correctAnswerIndex != null &&
                              state.propositionControllers
                                      .where(
                                          (TextEditingController controller) =>
                                              controller.text.isNotEmpty)
                                      .length >=
                                  2
                          : (state as QuizUpdateQuestionFormBuildState)
                                      .correctAnswerIndex !=
                                  null &&
                              state.propositionControllers
                                      .where(
                                          (TextEditingController controller) =>
                                              controller.text.isNotEmpty)
                                      .length >=
                                  2)
                  ? () {
                      cubit.submitQuestion(
                          (quizCubit.state as QuizCreatedState).quiz);
                    }
                  : null,
              text: (state is QuizCreateQuestionFormBuildState)
                  ? "Enregistrer"
                  : "Mettre à jour",
            );
          },
        ),
      ),
    );
  }

  void onEventReceived(
      BuildContext context, CreateQuizQuestionState state) async {
    await waitForDialog();

    if (state is QuizCreateQuestionLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is QuizCreateQuestionSuccessState) {
      context.read<QuizCubit>().addQuestion(state.question);
      Navigator.pop(context);
    } else if (state is QuizCreateQuestionErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
