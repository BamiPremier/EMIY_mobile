import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/widgets/item_anime.dart';
import 'package:umai/auth/bloc/anime_by_genre_cubit.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/auth/bloc/select_anime_cubitt.dart';
import 'package:umai/auth/screens/registration/people.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';
import 'package:umai/utils/dialogs.dart';
class RegistrationAnimeWatchList extends StatefulWidget {
  static Widget init({
    required BuildContext context,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnimeByGenreCubit(
            cubitManager: context.read(),
            authService: context.read(),
            selectedTarget: AvailableValues.watchlist,
          ),
        ),
        BlocProvider(
          create: (context) => SelectAnimeCubit(),
        ),
      ],
      child: const RegistrationAnimeWatchList._(),
    );
  }

  const RegistrationAnimeWatchList._();

  @override
  State<RegistrationAnimeWatchList> createState() =>
      _RegistrationAnimeWatchListState();
}

class _RegistrationAnimeWatchListState extends State<RegistrationAnimeWatchList>
    with CompletableMixin {
  late final animeByGenreCubit = context.read<AnimeByGenreCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: onEventReceived,
      child: Scaffold(
        appBar: AppBar(
            forceMaterialTransparency: true,
            title: const Text("Ceux-ci m'intéressent")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                  'Sélectionne les animes que tu voudrais regarder dans un futur proche',
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: AutoListView.get<Anime>(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                cubit: animeByGenreCubit,
                viewType: ViewType.grid,
                itemBuilder: (context, anime) => AnimeItem.get(
                    context: context, anime: anime, withSelect: true),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: .65),
                emptyBuilder: (ctx) => const EmptyBuilder(),
                  errorBuilder: (context, retry) => ErrorBuilder(retry: retry),
              ),
            )
          ],
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UmaiButton.primary(
                onPressed: () => nextButtonAction,
                text: "Continuer",
              ),
            ],
          ),
        ),
      ),
    );
  }

  VoidCallback? get nextButtonAction {
    late final selectAnimeCubit = context.read<SelectAnimeCubit>();
    if (selectAnimeCubit.state.isNotEmpty &&
        selectAnimeCubit.state.length >= 3) {
      context.read<AuthCubit>().addToListAnimeWatchlist(selectAnimeCubit.state);
    } else {
      showBlackErrorToast(
          content: "Choisis au moins 3 animes", context: context);
    }
    return null;
  }

  void onEventReceived(BuildContext context, AuthState state) async {
    await waitForDialog();

    if (state is AuthAddListAnimeToWatchlistLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is AuthAddListAnimeToWatchlistSuccesState) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PeopleToFollowScreen()),
      );
    } else if (state is AuthErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
