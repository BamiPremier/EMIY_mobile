import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/registration_preffered.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/widgets/custom_app_bar.dart';
import 'package:umai/common/widgets/customtextfield.dart';
import 'package:umai/utils/app_dimension.dart';

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
  final TextEditingController idUserController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    idUserController.dispose();
    userNameNode.dispose();
    idUserdNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Tu es nouveau?"),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimension.kMarginX / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                // padding: const EdgeInsets.symmetric(
                //     horizontal: Dimension.kMarginX / 2),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: userNameController,
                      focusNode: userNameNode,
                      subText:
                          "Il sera visible lors de tes différentes intéractions",
                      hintText: "Ton nom d'utilisateur",
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      onEditingCompleted: () =>
                          FocusScope.of(context).requestFocus(idUserdNode),
                      validator: (value) => Validators.empty(value),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: idUserController,
                      focusNode: idUserdNode,
                      subText: "Pour que tes amis te retrouvent facilement",
                      hintText: "Ton identifiant unique",
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      onEditingCompleted: () {},
                      validator: (value) => Validators.empty(value),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimension.kMarginY / 2),
                child: UmaiButton.primary(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegistrationPrefferedScreen()),
                    );
                  },
                  text: "Continuer",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
