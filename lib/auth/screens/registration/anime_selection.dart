import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/widgets/item_anime.dart';
import 'package:umai/auth/screens/registration/people.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/widgets/buttons.dart';

class RegistrationAnimeSelection extends StatefulWidget {
  final List<String> listGenre;

  const RegistrationAnimeSelection({
    super.key,
    required this.listGenre,
  });

  @override
  State<RegistrationAnimeSelection> createState() =>
      _RegistrationAnimeSelectionState();
}

class _RegistrationAnimeSelectionState
    extends State<RegistrationAnimeSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tu regardes quoi?")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
                'Choisis tes animes favoris ou rajoutes-en dans ta washlist',
                style: Theme.of(context).textTheme.bodySmall),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: AutoListView.get<Anime>(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              cubit: AutoListCubit(
                  provider: ({int page = 1}) => context
                      .read<AuthService>()
                      .getAnimes(page: page, genres: widget.listGenre)),
              viewType: ViewType.grid,
              itemBuilder: (context, anime) => AnimeItem.get(
                  context: context, anime: anime, withAction: true),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: .65),
              errorBuilder: (context, retry) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("An error occured"),
                  TextButton(
                    onPressed: retry,
                    child: const Text("Retry"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:   SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UmaiButton.primary(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const PeopleToFollowScreen()),
                  );
                },
                text: "Continuer",
              ),
            ],
          ),
        ),
      
    );
  }
}
