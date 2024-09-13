import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/anime_cubit.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/models/anime_response.dart';
import 'package:umai/auth/screens/registrationuser/registration_follow.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';

class RegistrationAnimeSelectionScreen extends StatefulWidget {
  final List<int> listCategory;

  const RegistrationAnimeSelectionScreen({
    super.key,
    required this.listCategory,
  });

  static Widget get({
    required BuildContext context,
    required List<int> listCategory,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AnimeCubit(context.read(), listCategory)),
      ],
      child: RegistrationAnimeSelectionScreen(listCategory: listCategory),
    );
  }

  @override
  State<RegistrationAnimeSelectionScreen> createState() =>
      _RegistrationAnimeSelectionScreenState();
}

class _RegistrationAnimeSelectionScreenState
    extends State<RegistrationAnimeSelectionScreen> with CompletableMixin {
  late final SignInCubit signInCubit;
  late final AnimeCubit animeCubit;

  @override
  void initState() {
    super.initState();
    signInCubit = context.read<SignInCubit>();
    animeCubit = context.read<AnimeCubit>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tu regardes quoi?")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Choisis tes animes favoris ou rajoutes-en dans ta washlist',
                      style: Theme.of(context).textTheme.bodySmall)),
              Expanded(
                  child: AutoListView.get<AnimeResponse>(
                      cubit: animeCubit,
                      viewType: ViewType.grid,
                      itemBuilder: (context, anime) => Container(
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                'Item $anime',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Nombre de colonnes
                              crossAxisSpacing:
                                  2.0, // Espacement horizontal entre les colonnes
                              mainAxisSpacing:
                                  2.0, // Espacement vertical entre les lignes

                              childAspectRatio: .65),
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
                          )))

              /*   GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Nombre de colonnes
                    crossAxisSpacing:
                        2.0, // Espacement horizontal entre les colonnes
                    mainAxisSpacing:
                        2.0, // Espacement vertical entre les lignes

                    childAspectRatio: .65),
                itemCount: 30, // Nombre total d'éléments dans la grille
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ) */
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
                        builder: (context) => const RegistrationFollowScreen()),
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
