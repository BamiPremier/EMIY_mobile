import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/preference_user_cubit.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/auth/screens/registrationuser/registration_follow_screen.dart';
import 'package:umai/auth/widgets/anime_item.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/utils/dialogs.dart';

class RegistrationAnimeSelectionScreen extends StatefulWidget {
  final List<String> listGenre;

  const RegistrationAnimeSelectionScreen({
    super.key,
    required this.listGenre,
  });

  @override
  State<RegistrationAnimeSelectionScreen> createState() =>
      _RegistrationAnimeSelectionScreenState();
}

class _RegistrationAnimeSelectionScreenState
    extends State<RegistrationAnimeSelectionScreen> with CompletableMixin {
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
    return BlocConsumer<PreferenceUserCubit, PreferenceUserState>(
        listener: onEventReceived,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Tu regardes quoi?")),
            body: Padding(
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
                      child: AutoListView.get<Anime>(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          cubit: AutoListCubit(
                              provider: ({int page = 1}) => context
                                      .read<AuthService>()
                                      .getAnimes(
                                          page: page,
                                          listGenre: widget.listGenre)
                                      .then((p) {
                                    print('==================p${p}');

                                    return PaginatedList(
                                        items: p.content,
                                        page: p.page,
                                        total: p.total);
                                  })),
                          viewType: ViewType.grid,
                          itemBuilder: (context, anime) =>
                              AnimeItem(anime: anime),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2.0,
                                  mainAxisSpacing: 2.0,
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
                ],
              ),
            ),
            bottomNavigationBar: Container(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UmaiButton.primary(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationFollowScreen()),
                        );
                      },
                      text: "Continuer",
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void onEventReceived(BuildContext context, PreferenceUserState state) async {
    if (state is WatchListAddSuccesState) {
      showSuccessToast(
           "Anime ajouté à votre watchlist");
    } else if (state is WatchListAddErrorState) {
      showErrorToast(state.error);
    }

    if (state is AnimeViewedAddSuccesState) {
      showSuccessToast(
          "Anime ajouté à votre liste de vue");
    } else if (state is AnimeViewedAddErrorState) {
      showErrorToast(state.error);
    }
  }
}
