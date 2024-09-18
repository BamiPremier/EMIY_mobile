import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/anime_cubit.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/auth/bloc/preference_user_cubit.dart';
import 'package:umai/auth/models/anime_response.dart';
import 'package:umai/auth/screens/registrationuser/registration_follow_screen.dart';
import 'package:umai/auth/widgets/anime_item.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/utils/dialogs.dart';

class RegistrationAnimeSelectionScreen extends StatefulWidget {
  final List<String> listCategory;

  const RegistrationAnimeSelectionScreen({
    super.key,
    required this.listCategory,
  });

  static Widget get({
    required BuildContext context,
    required List<String> listCategory,
  }) {
    print('-------${listCategory}');
    return BlocProvider(
      create: (_) => AnimeCubit(context.read(), listCategory),
      child: RegistrationAnimeSelectionScreen(listCategory: listCategory),
    );
  }

  @override
  State<RegistrationAnimeSelectionScreen> createState() =>
      _RegistrationAnimeSelectionScreenState();
}

class _RegistrationAnimeSelectionScreenState
    extends State<RegistrationAnimeSelectionScreen> with CompletableMixin {
  late final animeCubit;

  @override
  void initState() {
    super.initState();

    animeCubit = context.read<AnimeCubit>();
  }

  @override
  void dispose() {
    animeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreferenceUserCubit, PreferenceUserState>(
        listener: onEventReceived,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Tu regardes quoi?")),
            body: SafeArea(
              minimum: const EdgeInsets.only(bottom: 48),
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
                        child: AutoListView.get<Anime>(
                            cubit: AutoListCubit(
                                provider: ({int page = 1}) => context
                                    .read<AnimeCubit>()
                                    .getAnimes(
                                        listCategory: widget.listCategory,
                                        page: page)),
                            // cubit: animeCubit,
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
    await waitForDialog();

    if (state is WatchListAddLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is WatchListAddSuccesState) {
      showSuccessToast(
          context: context, content: "Anime ajouté à votre watchlist");
    } else if (state is WatchListAddErrorState) {
      showError(context, state.error);
    }

    if (state is AnimeViewedAddLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is AnimeViewedAddSuccesState) {
      showSuccessToast(
          context: context, content: "Anime ajouté à votre liste de vue");
    } else if (state is AnimeViewedAddErrorState) {
      showError(context, state.error);
    }
  }
}
