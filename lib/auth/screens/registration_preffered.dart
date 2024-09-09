import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/registration_anime_selection.dart';
import 'package:umai/auth/widgets/auth_button.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/widgets/custom_app_bar.dart';
import 'package:umai/common/widgets/customtextfield.dart';
import 'package:umai/common/widgets/textfield.dart';
import 'package:umai/utils/app_dimension.dart';
import 'package:umai/utils/themes.dart';

class RegistrationPrefferedScreen extends StatefulWidget {
  const RegistrationPrefferedScreen({super.key});

  @override
  State<RegistrationPrefferedScreen> createState() =>
      _RegistrationPrefferedScreenState();
}

class _RegistrationPrefferedScreenState
    extends State<RegistrationPrefferedScreen> with CompletableMixin {
  late final signInCubit = context.read<SignInCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static const List<String> animeCategories = [
    'Action',
    'Aventure',
    'Comédie',
    'Drame',
    'Fantaisie',
    'Horreur',
    'Mystère',
    'Psychologique',
    'Romance',
    'Science-fiction',
    'Slice of Life',
    'Sports',
    'Surnaturel',
    'Thriller',
    'Mecha',
    'Historique',
    'Musical',
    'Parodie',
    'Shoujo',
    'Shounen',
    'Seinen',
    'Josei',
    'Ecchi',
    'Harem',
    'Isekai',
    'Magical Girl',
    'Post-apocalyptique',
    'Cyberpunk',
    'Steampunk',
    'Guerre'
  ];
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
                            vertical: Dimension.kMarginY / 2),
                        child: const Text(
                          'Quels genres d’animes préfères-tu? Tu recevras une sélection de recommandation en fonction de ces choix',
                          style: TextStyle(fontSize: Dimension.kMiddle),
                        )),
                    const SizedBox(height: 10),
                    Container(
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 3,
                        children: animeCategories.map((item) {
                          final isSelected = true;
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                // color: isSelected
                                //     ? ThemeApp.boldText
                                //     : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: isSelected
                                      ? ThemeApp.primaryBlack
                                      : ThemeApp.boldText,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimension.kMarginX / 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 150),
                                    child: Text(
                                      item,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
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
                              const RegistrationAnimeSelectionScreen()),
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
