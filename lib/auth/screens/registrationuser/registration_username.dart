import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/auth/screens/registrationuser/registration_preffered.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/widgets/customtextfield.dart';
import 'package:umai/utils/dialogs.dart';

class RegistrationUsernameScreen extends StatefulWidget {
  const RegistrationUsernameScreen({super.key});

  @override
  State<RegistrationUsernameScreen> createState() =>
      _RegistrationUsernameScreenState();
}

class _RegistrationUsernameScreenState extends State<RegistrationUsernameScreen>
    with CompletableMixin {
  late final authCubit = context.read<AuthCubit>();
  final userNameNode = FocusNode();
  final userTagNode = FocusNode();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userTagController = TextEditingController();
  String generateUserTag(String username) {
    // Convertir en minuscules
    String tag = username.toLowerCase();

    // Remplacer les espaces par des tirets
    tag = tag.replaceAll(' ', '-');

    // Supprimer les accents
    tag = tag
        .replaceAllMapped(RegExp(r'[àáâãäå]'), (match) => 'a')
        .replaceAllMapped(RegExp(r'[èéêë]'), (match) => 'e')
        .replaceAllMapped(RegExp(r'[ìíîï]'), (match) => 'i')
        .replaceAllMapped(RegExp(r'[òóôõö]'), (match) => 'o')
        .replaceAllMapped(RegExp(r'[ùúûü]'), (match) => 'u')
        .replaceAllMapped(RegExp(r'[ýÿ]'), (match) => 'y')
        .replaceAllMapped(RegExp(r'[ñ]'), (match) => 'n');

    // Supprimer tous les caractères non autorisés
    tag = tag.replaceAll(RegExp(r'[^a-z0-9\-_.]'), '');

    // Supprimer les tirets consécutifs
    tag = tag.replaceAll(RegExp(r'-+'), '-');

    // Supprimer les tirets au début et à la fin
    tag = tag.trim().toLowerCase();

    return tag;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    userTagController.dispose();
    userNameNode.dispose();
    userTagNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: onEventReceived,
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Tu es nouveau?",
        )),
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: userNameController,
                        focusNode: userNameNode,
                        subText:
                            "Il sera visible lors de tes différentes intéractions",
                        hintText: "Ton nom d'utilisateur",
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          setState(() {
                            userTagController.text = generateUserTag(value);
                          });
                        },
                        onEditingCompleted: () =>
                            FocusScope.of(context).requestFocus(userNameNode),
                        validator: (value) => Validators.empty(value),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                          controller: userTagController,
                          focusNode: userTagNode,
                          subText: "Pour que tes amis te retrouvent facilement",
                          hintText: "Ton identifiant unique",
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          onChanged: (value) {
                            setState(() {
                              userTagController.text = generateUserTag(value);
                            });
                          },
                          textInputAction: TextInputAction.next,
                          onEditingCompleted: () =>
                              FocusScope.of(context).requestFocus(userTagNode),
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
                  onPressed: () => authCubit.completeUserName(
                    username: userNameController.text,
                    userTag: userTagController.text,
                  ),
                  text: "Continuer",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, AuthState state) async {
    await waitForDialog();

    if (state is AuthLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is CompleteUserSuccessUserState) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const RegistrationPrefferedScreen()),
      );
    } else if (state is AuthErrorState) {
      showError(context, state.error);
    }
  }
}
