import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class ChangePictureScreen extends StatefulWidget {
  final XFile image;
  const ChangePictureScreen({super.key, required this.image});

  @override
  State<ChangePictureScreen> createState() => _ChangePictureScreenState();
}

class _ChangePictureScreenState extends State<ChangePictureScreen>
    with CompletableMixin {
  late final userCubit = context.read<UserCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: onEventReceived,
      child: Theme(
        data: AppTheme.fullBlackTheme(context),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Photo de profil',
            ),
            centerTitle: true,
          ),
          // backgroundColor: AppTheme.black,
          body: SafeArea(
            minimum: const EdgeInsets.only(bottom: 48),
            child: Center(
              child: Image(
                image: FileImage(File(widget.image.path)),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UmaiButton.primary(
                  onPressed: () {
                    userCubit.updateProfilePicture(
                      file: File(widget.image.path),
                    );
                  },
                  text: "Enregistrer",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();

    if (state is UserUpdatingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is UserUpdatedState) {
      Navigator.of(context).pop();
    } else if (state is UserErrorState) {
      showErrorToast(state.error);
    }
  }
}
