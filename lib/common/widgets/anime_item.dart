import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/preference_user_cubit.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/utils/themes.dart';

class AnimeItem extends StatefulWidget {
  final Anime anime;
  final VoidCallback onTap;
  const AnimeItem({super.key, required this.anime, required this.onTap});
  @override
  State<AnimeItem> createState() => _AnimeItemState();
}

class _AnimeItemState extends State<AnimeItem> {
  late final preferenceUserCubit = context.read<PreferenceUserCubit>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        margin: const EdgeInsets.all(0),
        child: Stack(
          children: [
            // Image at the top of the card
            CachedNetworkImage(
              imageUrl: widget.anime.coverImage.extraLarge,
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
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

            // The voting area (counters and buttons) at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: ThemeApp.black.withOpacity(.4),
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
                          color: Theme.of(context).colorScheme.onInverseSurface,
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
                          color: Theme.of(context).colorScheme.onInverseSurface,
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
  }

  void showContextMenu({
    required BuildContext context,
    required Offset position,
    required String anime,
  }) async {
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
        PopupMenuItem<String>(
          value: 'visited',
          child: ListTile(
            leading: BlocBuilder<PreferenceUserCubit, PreferenceUserState>(
                builder: (context, state) => state is AnimeViewedAddLoadingState
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.check_circle_outline)),
            title: Text("J'ai vu",
                style: Theme.of(context).popupMenuTheme.textStyle),
            onTap: () {
              preferenceUserCubit.addToViewedList(anime);
              Navigator.of(context).pop();
              showContextMenu(
                  context: context, position: position, anime: anime);
            },
          ),
        ),
        PopupMenuItem<String>(
          value: 'add_to_list',
          child: ListTile(
            leading: BlocBuilder<PreferenceUserCubit, PreferenceUserState>(
                builder: (context, state) => (state is WatchListAddLoadingState)
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.add_circle_outline)),
            title: Text("Ajouter à la liste",
                style: Theme.of(context).popupMenuTheme.textStyle),
            onTap: () {
              preferenceUserCubit.addToWatchList(anime);
              Navigator.of(context).pop();
              showContextMenu(
                  context: context, position: position, anime: anime);
            },
          ),
        ),
      ],
    );
  }
}
