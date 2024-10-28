import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/screens/new/editing_quiz.dart';
import 'package:umai/quiz/screens/new/search_anime_delegate.dart';
import 'package:umai/social/bloc/new_post_cubit.dart';
import 'package:umai/utils/assets.dart';
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

  @override
  void dispose() {
    _titreController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau Quiz"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 48),
        child: Form(
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
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          onEditingComplete: FocusScope.of(context).unfocus,
                          validator: (value) => Validators.empty(value)),
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
                      delegate: SearchAnimeDelegate(),
                    );

                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SearchAnime()),
                    // );
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
                        Text(
                          'Sélectionne un anime',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
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
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UmaiButton.primary(
              onPressed: () {
                if (Validators.empty(_titreController.text) == null ||
                    Validators.empty(_descriptionController.text) == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditingQuizScreen()),
                  );
                } else {
                  showErrorToast(
                      content: "Veuillez ajouter un titre et une description",
                      context: context);
                }
              },
              text: "Suivant",
            ),
          ],
        ),
      ),
    );
  }
}
