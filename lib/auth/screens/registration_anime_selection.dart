import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/registration_follow.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/widgets/custom_app_bar.dart';
import 'package:umai/utils/app_dimension.dart';

class RegistrationAnimeSelectionScreen extends StatefulWidget {
  const RegistrationAnimeSelectionScreen({super.key});

  @override
  State<RegistrationAnimeSelectionScreen> createState() =>
      _RegistrationAnimeSelectionScreenState();
}

class _RegistrationAnimeSelectionScreenState
    extends State<RegistrationAnimeSelectionScreen> with CompletableMixin {
  late final signInCubit = context.read<SignInCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Tu regardes quoi?"),
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
                    Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Dimension.kMarginY / 2,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Choisis tes animes favoris ou rajoutes-en dans ta washlist',
                          style: TextStyle(fontSize: Dimension.kMiddle),
                        )),
                    const SizedBox(height: 10),
                    Container(
                        height: MediaQuery.of(context).size.height * .73,
                        // padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, // Nombre de colonnes
                                  crossAxisSpacing:
                                      8.0, // Espacement horizontal entre les colonnes
                                  mainAxisSpacing:
                                      8.0, // Espacement vertical entre les lignes

                                  childAspectRatio: .65),
                          itemCount:
                              30, // Nombre total d'éléments dans la grille
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey,
                              child: Center(
                                child: Text(
                                  'Item $index',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        )),
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
                              const RegistrationFollowScreen()),
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
