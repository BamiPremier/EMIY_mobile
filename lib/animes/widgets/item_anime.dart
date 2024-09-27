import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/anime.dart';
import 'package:umai/utils/themes.dart';

class AnimeItem extends StatelessWidget {
  final Anime anime;
  final bool _withActions;

  const AnimeItem({super.key, required this.anime}) : _withActions = false;

  const AnimeItem.withActions({super.key, required this.anime}) : _withActions = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (_withActions) {
          showContextMenu(
            context: context,
            // TODO
            position: Offset.zero
          );
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => AnimeDetailsScreen(anime: anime)
          ));
        }
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
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
  }) {
    showMenu(
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
          child: ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: const Text("J'ai vu"),
            onTap: () {},
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: const Text("Ajouter à la liste"),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
