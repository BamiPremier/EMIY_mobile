import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/screens/param/edit_profile_picture.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/registrationuser/registration_preffered.dart';
import 'package:umai/account/widgets/large_text_field.dart';
import 'package:umai/account/widgets/profile_text_field.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with CompletableMixin {
  late final signInCubit = context.read<SignInCubit>();
  final userNameNode = FocusNode();
  final idUserdNode = FocusNode();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userTagController = TextEditingController();
  int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    userTagController.dispose();
    userNameNode.dispose();
    idUserdNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: onEventReceived,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Éditer mon profil",
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: 16),
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
                                      const EditProfilePicturePage())),
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(Assets.user),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      Expanded(
                        child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: ProfileTextField(
                            controller: userNameController,
                            focusNode: userNameNode,
                            hintText: "@userxxyz",
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.next,
                            onEditingCompleted: () => FocusScope.of(context)
                                .requestFocus(idUserdNode),
                            validator: (value) => Validators.empty(value),
                          ),
                        ),
                      )
                    ]),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      ProfileTextField(
                        controller: userNameController,
                        focusNode: userNameNode,
                        subText:
                            "Il sera visible lors de tes différentes intéractions",
                        hintText: "Nom d'utilisateur",
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        onEditingCompleted: () =>
                            FocusScope.of(context).requestFocus(idUserdNode),
                        validator: (value) => Validators.empty(value),
                      ),
                      const SizedBox(height: 32),
                      LargeTextField(
                          controller: userTagController,
                          focusNode: idUserdNode,
                          counter: counter,
                          hintText: "Ma bio...",
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          onEditingCompleted: () {},
                          onChanged: (value) {
                            setState(() {
                              counter = userTagController.text.length;
                            });
                          },
                          validator: (value) => Validators.empty(value),
                          prefixIcon: const Icon(
                            Icons.alternate_email,
                          )),
                    ],
                  ),
                ),
              ],
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
                  onPressed: () => signInCubit.completeUserName(
                    username: userNameController.text,
                    userTag: userTagController.text,
                  ),
                  text: "Enregistrer",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, SignInState state) async {
    await waitForDialog();

    if (state is SignInLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is CompleteUserSuccessUserState) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const RegistrationPrefferedScreen()),
      );
    } else if (state is SignInErrorState) {
      showError(context, state.error);
    }
  }
}
