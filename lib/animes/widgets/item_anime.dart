import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/dialogs.dart';

class AnimeItem extends StatelessWidget {
  final bool withAction;

  static Widget get({
    required BuildContext context,
    required Anime anime,
    bool withAction = false,
  }) {
    return BlocProvider.value(
      value: context.read<AnimeCubitManager>().get(anime),
      child: AnimeItem._(withAction),
    );
  }

  const AnimeItem._(this.withAction);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeManipCubit, AnimeManipState>(
        listener: onEventReceived,
        builder: (context, state) {
          final animeManipCubit = context.read<AnimeManipCubit>();
          final anime = animeManipCubit.anime;
          return GestureDetector(
            onTapUp: (details) => showContextMenu(
              context: context,
              position: details.globalPosition,
              anime: anime,
              state: state,
              animeManipCubit: animeManipCubit,
            ),
            child: Image(
              image: context
                  .read<AppCacheManager>()
                  .getImage(anime.coverImage.extraLarge ?? ''),
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (frame != null) return child;
                return Container(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  height: 368,
                  width: double.infinity,
                  child: wasSynchronouslyLoaded
                      ? child
                      : Center(
                          child: SizedBox(
                            height: 16.0,
                            width: 16.0,
                            child: CircularProgressIndicator(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                              strokeWidth: 2.0,
                            ),
                          ),
                        ),
                );
              },
              errorBuilder: (_, __, ___) => const Icon(Icons.error),
            ),
          );
        });
  }

  void showContextMenu({
    required BuildContext context,
    required Offset position,
    required Anime anime,
    required AnimeManipState state,
    required AnimeManipCubit animeManipCubit,
  }) async {
    if (withAction) {
      return showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          position.dx,
          position.dy,
          position.dx + 1,
          position.dy + 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.white,
        items: <PopupMenuEntry>[
          PopupMenuItem(
              value: 0,
              child: BlocProvider.value(
                  value: animeManipCubit,
                  child: BlocBuilder<AnimeManipCubit, AnimeManipState>(
                      builder: (context, state) => ListTile(
                            leading: state is AnimeManipViewedLoadingState
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2),
                                  )
                                : const Icon(Icons.check_circle_outline),
                            title: const Text("J'ai vu"),
                            onTap: () {
                              animeManipCubit.addToViewed();
                            },
                          )))),
          PopupMenuItem(
            value: 1,
            child: BlocProvider.value(
              value: animeManipCubit,
              child: BlocBuilder<AnimeManipCubit, AnimeManipState>(
                builder: (context, state) => ListTile(
                  leading: state is AnimeManipWatchlistLoadingState
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.check_circle_outline),
                  title: const Text("Ajouter à la liste"),
                  onTap: () {
                    animeManipCubit.addToWatchlist();
                  },
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) =>
              AnimeDetailScreen.get(context: context, anime: anime)));
    }
  }

  void onEventReceived(BuildContext context, AnimeManipState state) async {
    if (withAction) {
      if (state is WatchListAddSuccesState) {
        Navigator.of(context).pop();
        showSuccessToast(
            content: "Anime ajouté à votre watchlist", context: context);
      } else if (state is AnimeViewedAddSuccesState) {
        Navigator.of(context).pop();
        showSuccessToast(
            content: "Anime ajouté à votre liste de vue", context: context);
      } else if (state is AnimeManipErrorState) {
        showErrorToast(content: state.error, context: context);
      }
    }
  }
}
