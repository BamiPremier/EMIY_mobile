import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
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
  late final signInCubit = context.read<SignInCubit>();
  final userNameNode = FocusNode();
  final idUserdNode = FocusNode();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController idUserNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    idUserNameController.dispose();
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
          "Tu es nouveau?",
        )),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        onEditingCompleted: () =>
                            FocusScope.of(context).requestFocus(idUserdNode),
                        validator: (value) => Validators.empty(value),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                          controller: idUserNameController,
                          focusNode: idUserdNode,
                          subText: "Pour que tes amis te retrouvent facilement",
                          hintText: "Ton identifiant unique",
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          onEditingCompleted: () {},
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
                const EdgeInsets.symmetric(horizontal: 31.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UmaiButton.primary(
                  onPressed: () => signInCubit.completeUserName(
                    username: userNameController.text,
                    idUserName: idUserNameController.text,
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
