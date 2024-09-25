import 'package:cached_network_image/cached_network_image.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/cubit/account_cubit.dart';
import 'package:umai/account/screens/param/edit_profile_picture_screen.dart';
import 'package:umai/account/widgets/large_text_field.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/widgets/customtextfield.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with CompletableMixin {
  late final accountCubit = context.read<AccountCubit>();
  final userNameNode = FocusNode();
  final userTagNode = FocusNode();
  final userBioNode = FocusNode();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userTagController = TextEditingController();
  final TextEditingController userBioController = TextEditingController();
  int counter = 0;
  @override
  void initState() {
    setState(() {
      userNameController.text = accountCubit.user!.username!;
      userTagController.text = accountCubit.user!.usertag!;
      userBioController.text = accountCubit.user!.biography ?? '';
    });
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    userTagController.dispose();
    userBioController.dispose();
    userNameNode.dispose();
    userTagNode.dispose();
    userBioNode.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(
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
            key: _formKey,
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
                                        const EditProfilePictureScreen())),
                            child: CachedNetworkImage(
                              imageUrl: context
                                      .read<AccountCubit>()
                                      .user!
                                      .imageFull ??
                                  '',
                              height: 56,
                              width: 56,
                              fit: BoxFit.cover,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: CircleAvatar(
                                  radius: 56,
                                  backgroundImage: imageProvider,
                                ),
                              ),
                              placeholder: (context, url) => const CircleAvatar(
                                radius: 56,
                                backgroundImage: AssetImage(Assets.user),
                              ),
                              errorWidget: (context, url, error) => Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: const CircleAvatar(
                                  radius: 56,
                                  backgroundImage: AssetImage(Assets.user),
                                ),
                              ),
                            )),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: CustomTextField(
                              controller: userNameController,
                              focusNode: userNameNode,
                              hintText: "@userxxyz",
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next,
                              onEditingCompleted: () => FocusScope.of(context)
                                  .requestFocus(userNameNode),
                              validator: (value) => Validators.empty(value),
                            ),
                          ),
                        )
                      ]),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: userTagController,
                          focusNode: userTagNode,
                          helperText:
                              "Il sera visible lors de tes différentes intéractions",
                          hintText: "Nom d'utilisateur",
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          onEditingCompleted: () =>
                              FocusScope.of(context).requestFocus(userTagNode),
                          validator: (value) => Validators.empty(value),
                        ),
                        const SizedBox(height: 32),
                        LargeTextField(
                            controller: userBioController,
                            focusNode: userBioNode,
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
                    accountCubit.updateUser(user: {
                      "username": userNameController.text,
                      "userTag": userTagController.text,
                      "biography": userBioController.text
                    });
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

  void onEventReceived(BuildContext context, AccountState state) async {
    await waitForDialog();

    if (state is AccountLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is AccountSuccessState) {
      showSuccessToast("Mise à jour effectuée avec succes");
    } else if (state is AccountErrorState) {
      showErrorToast(state.error);
    }
  }
}
