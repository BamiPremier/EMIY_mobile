import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class EpisodeHead extends StatelessWidget {
  const EpisodeHead({super.key});

  @override
  Widget build(BuildContext context) {
    const double width = 72;
    const double height = 88;
    final episode = context.read<EpisodeCubit>().episode;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: context
                        .read<AppCacheManager>()
                        .getImage(episode.anime.coverImage.extraLarge ?? ''),
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? progress) {
                      return Container(
                        alignment: Alignment.center,
                        height: height,
                        width: width,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        child: progress == null
                            ? child
                            : CircularProgressIndicator(
                                value: progress.cumulativeBytesLoaded /
                                    (progress.expectedTotalBytes ?? 1),
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                backgroundColor:
                                    Theme.of(context).colorScheme.tertiary,
                              ),
                      );
                    },
                    errorBuilder: (BuildContext context, _, __) {
                      return Container(
                        height: height,
                        width: width,
                        color: Colors.grey[300],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                  size: 48),
                              const SizedBox(height: 16),
                              Text(
                                "Erreur de chargement de l'image",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode.anime.title.romaji,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      episode.anime.title.english ?? '',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ))
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Épisode ${episode.episode}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  DateTime.fromMillisecondsSinceEpoch(
                                          episode.airingAt * 1000)
                                      .elapsed(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: AppTheme.disabledText,
                                      ),
                                ),
                              ]),
                          Text(
                            '${episode.commentsCount} commentaires',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: AppTheme.disabledText,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
