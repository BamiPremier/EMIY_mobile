import 'package:flutter/services.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/auth/screens/registration/genres_selection.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/utils/dialogs.dart';

class RegistrationUsername extends StatefulWidget {
  const RegistrationUsername({super.key});

  @override
  State<RegistrationUsername> createState() => _RegistrationUsernameState();
}

class _RegistrationUsernameState extends State<RegistrationUsername>
    with CompletableMixin {
  late final authCubit = context.read<AuthCubit>();
  final userTagNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userTagNode.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: onEventReceived,
        buildWhen: (_, state) => state is AuthIdleState,
        builder: (context, state) {
          var authIdleState = (state as AuthIdleState);
          return Scaffold(
            appBar: AppBar(
                title: const Text(
              "Tu es nouveau?",
            )),
            body: SafeArea(
              minimum: const EdgeInsets.only(bottom: 48),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              controller: authIdleState.userNameController,
                              decoration: const InputDecoration(
                                helperText:
                                    "Il sera visible lors de tes différentes intéractions",
                                hintText: "Ton nom d'utilisateur",
                              ),
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) =>
                                  authCubit.updateUserNameAndTag(value),
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(userTagNode),
                              validator: (value) => Validators.empty(value),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              controller: authIdleState.userTagController,
                              decoration: const InputDecoration(
                                  helperText:
                                      "Pour que tes amis te retrouvent facilement",
                                  hintText: "Ton identifiant unique",
                                  prefixIcon: Icon(Icons.alternate_email)),
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-z0-9\-_.]')),
                                LengthLimitingTextInputFormatter(30),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'L\'identifiant ne peut pas être vide';
                                }

                                final RegExp userTagRegex =
                                    RegExp(r'^[a-z0-9\-_.]{3,30}$');

                                if (!userTagRegex.hasMatch(value)) {
                                  return 'L\'identifiant doit contenir entre 3 et 30 caractères alphanumériques, tirets, points ou underscores';
                                }

                                return null;
                              },
                              textCapitalization: TextCapitalization.none,
                              onChanged: (value) {},
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(userTagNode),
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
              minimum:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UmaiButton.primary(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authCubit.completeUserName(
                          username: authIdleState.userNameController.text,
                          userTag: authIdleState.userTagController.text,
                        );
                      }
                    },
                    text: "Continuer",
                  ),
                ],
              ),
            ),
          );
        });
  }

  void onEventReceived(BuildContext context, AuthState state) async {
    await waitForDialog();

    if (state is AuthLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is CompleteUserSuccessUserState) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const RegistrationGenresSelection()),
      );
    } else if (state is AuthErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
