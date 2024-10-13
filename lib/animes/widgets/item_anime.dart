import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/anime.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class AnimeItem extends StatelessWidget {
  final bool withAction;

  static Widget get({
    required BuildContext context,
    required Anime anime,
    bool withAction = false,
  }) {
    return BlocProvider(
      create: (context) => AnimeManipCubit(context.read(), anime),
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
          final anime = animeManipCubit.anime!;
          return GestureDetector(
            onTapUp: (details) => showContextMenu(
              context: context,
              position: details.globalPosition,
              anime: anime,
              state: state,
              animeManipCubit: animeManipCubit,
            ),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              margin: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  // Image at the top of the card
                  CachedNetworkImage(
                    imageUrl: anime.coverImage.extraLarge,
                    height: 368,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  // The voting area (counters and buttons) at the bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: AppTheme.black.withOpacity(.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Positive votes counter
                          Row(
                            children: [
                              Text("428",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onInverseSurface)),
                              Icon(
                                Icons.check,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface,
                                size: 24.0,
                              ),
                            ],
                          ),
                          // Negative votes counter
                          Row(
                            children: [
                              Text("59",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onInverseSurface)),
                              Icon(
                                Icons.close,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface,
                                size: 24.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 24,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AnimeDetailsScreen(anime: anime)));
    }
  }

  void onEventReceived(BuildContext context, AnimeManipState state) async {
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
