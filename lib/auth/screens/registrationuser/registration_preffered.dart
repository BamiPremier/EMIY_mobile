import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/registrationuser/registration_anime_selection.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
          title: const Text(
        "Tu regardes quoi?",
      )),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                      'Quels genres d’animes préfères-tu? Tu recevras une sélection de recommandation en fonction de ces choix',
                      style: Theme.of(context).textTheme.bodySmall)),
              Expanded(
                child: SingleChildScrollView(
                    child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: animeCategories.map((item) {
                    final isSelected = true;
                    return Chip(
                        avatar: const Icon(
                            Icons.indeterminate_check_box_outlined,
                            color: ThemeApp.mainText),
                        side: const BorderSide(),
                        deleteIcon: Container(),
                        onDeleted: () {},
                        label: Text(
                          item,
                        ));
                  }).toList(),
                )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UmaiButton.primary(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            const RegistrationAnimeSelectionScreen()),
                  );
                },
                text: "Continuer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
