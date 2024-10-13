import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/screens/param/edit_profile_picture_screen.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/utils/dialogs.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with CompletableMixin {
  late final userCubit = context.read<UserCubit>();
  late final TextEditingController userNameController =
      TextEditingController(text: userCubit.user.username);
  late final TextEditingController userBioController =
      TextEditingController(text: userCubit.user.biography);
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    userBioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: onEventReceived,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Éditer mon profil",
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 48),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).add(
                const EdgeInsets.only(top: 16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfilePictureScreen())),
                          child: ProfilePicture(
                            image: userCubit.user.imageFull,
                            height: 56,
                            width: 56,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "@${userCubit.user.usertag}"),
                              readOnly: true,
                            ),
                          ),
                        )
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userNameController,
                          decoration: const InputDecoration(
                            helperText:
                                "Il sera visible lors de tes différentes intéractions",
                            hintText: "Nom d'utilisateur",
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: FocusScope.of(context).unfocus,
                          validator: (value) => Validators.empty(value),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: userBioController,
                          decoration: const InputDecoration(
                            hintText: "Ma bio...",
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          minLines: 4,
                          maxLines: 4,
                          maxLength: 180,
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          onEditingComplete: FocusScope.of(context).unfocus,
                        ),
                      ],
                    ),
                  ),
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
                onPressed: onSaveTap,
                text: "Enregistrer",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSaveTap() {
    if (formKey.currentState?.validate() ?? false) {
      userCubit.updateUser(
          username: userNameController.text.trim(),
          biography: userBioController.text.trim());
    }
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();

    if (state is UserUpdatingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is UserUpdatedState) {
      showSuccessToast(content: "Modifications enregistrées", context: context);
    } else if (state is UserErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
