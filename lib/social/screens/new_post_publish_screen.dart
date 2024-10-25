import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/social/bloc/new_post_cubit.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';

class NewPostCompleteScreen extends StatefulWidget {
  const NewPostCompleteScreen({super.key, required this.file});

  final File? file;

  @override
  State<NewPostCompleteScreen> createState() => _NewPostCompleteScreenState();
}

class _NewPostCompleteScreenState extends State<NewPostCompleteScreen>
    with CompletableMixin {
  late final socialCubit = context.read<NewPostCubit>();

  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau Social"),
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
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('contenu'),
                      const SizedBox(height: 8.0),
                      TextFormField(
                          style: Theme.of(context).textTheme.bodyMedium,
                          controller: _contentController,
                          decoration: const InputDecoration(
                            hintText: "Quoi de neuf?",
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          minLines: 4,
                          maxLines: 4,
                          maxLength: 360,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          onEditingComplete: FocusScope.of(context).unfocus,
                          validator: (value) => Validators.empty(value)),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text('média'),
                const SizedBox(height: 8.0),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: widget.file == null
                        ? Row(children: [
                            SvgPicture.asset(
                              Assets.iconsCamera,
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(width: 16.0),
                            Text('Prendre une photo',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline))
                          ])
                        : Row(children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: FileImage(widget.file!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            SizedBox(
                                width: 232,
                                child: Text(widget.file!.path,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline))),
                          ])),
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
                if (Validators.empty(_contentController.text) == null ||
                    widget.file != null) {
                  socialCubit.create(
                    content: _contentController.text,
                    file: widget.file,
                  );
                  Navigator.of(context).popUntil((r) => r.isFirst);
                } else {
                  showErrorToast(
                      content: "Veuillez ajouter une image ou un texte",
                      context: context);
                }
              },
              text: "Publier",
            ),
          ],
        ),
      ),
    );
  }
}
