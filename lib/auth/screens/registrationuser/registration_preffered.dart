import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/category_anime_cubit.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/models/category_anime_response.dart';
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
  late final categoryAnimeCubit = context.read<CategoryAnimeCubit>();

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
                    child: /*  Wrap(
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
                ) */

                        AutoListView.get<CategoryAnimeResponse>(
                            cubit: categoryAnimeCubit,
                            customBuilder: (context, user) => Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: user.map((item) {
                                    return Chip(
                                        avatar: const Icon(
                                            Icons
                                                .indeterminate_check_box_outlined,
                                            color: ThemeApp.mainText),
                                        side: const BorderSide(),
                                        deleteIcon: Container(),
                                        onDeleted: () {},
                                        label: const Text(
                                          'item',
                                        ));
                                  }).toList(),
                                ),
                            emptyBuilder: (context) => const Center(
                                  child: Text("Empty list"),
                                ),
                            errorBuilder: (context, retry) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("An error occured"),
                                    TextButton(
                                      onPressed: retry,
                                      child: const Text("Retry"),
                                    )
                                  ],
                                ))),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UmaiButton.primary(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            const RegistrationAnimeSelectionScreen(
                                listCategory: [])),
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
