import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/cubit/account_cubit.dart';
import 'package:umai/account/screens/param/edit_profile_picture_screen.dart';
import 'package:umai/account/widgets/large_text_field.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/widgets/customtextfield.dart';
import 'package:umai/social/cubit/social_cubit.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> with CompletableMixin {
  late final socialCubit = context.read<SocialCubit>();

  File? _image;
  final TextEditingController _contentController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _contentController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialCubit, SocialState>(
      listener: onEventReceived,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "NOUVEAU SOCIAL",
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 48),
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('contenu'),
                        LargeTextField(
                            controller: _contentController,
                            counter: counter,
                            hintText: "Quoi de neuf?",
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.next,
                            onEditingCompleted: () {},
                            maxLines: 6,
                            onChanged: (value) {},
                            validator: (value) => Validators.empty(value),
                            prefixIcon: const Icon(
                              Icons.alternate_email,
                            )),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 8),
                      child: const Text('Media')),
                  GestureDetector(
                    onTap: _pickImage,
                    child: _image == null
                        ? Row(children: [
                            SvgPicture.asset(
                              Assets.iconsCamera,
                              width: 100,
                              height: 100,

                              // Container(
                              //   width: 100,
                              //   height: 100,
                              //   color: Colors.grey[300],
                              //   child: Icon(Icons.camera_indoor_outlined, size: 50),
                              // ),
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
                                  image: FileImage(File(_image!.path)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Container(
                                width: 232,
                                child: Text(_image!.path,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline))),
                          ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child: SafeArea(
            minimum:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UmaiButton.primary(
                  onPressed: () {
                    socialCubit.newPost(
                      content: _contentController.text,
                      file: _image!,
                    );
                  },
                  text: "Publier",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, SocialState state) async {
    await waitForDialog();

    if (state is NewPostLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is NewPostSuccessState) {
      showSuccessToast("Mise à jour effectuée avec succes");
    } else if (state is NewPostErrorState) {
      showErrorToast(state.error);
    }
  }
}
