import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/episode.dart'; 
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/cache_manager.dart'; 
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart'; 

class EpisodeInfo extends StatelessWidget {
  const EpisodeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EpisodeCubit, XCommonState>(
        listener: (context, state) {},
        builder: (context, state) {
          Episode episode = context.read<EpisodeCubit>().x as Episode;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CommonDetailsScreen.fromEpisode(
                        context: context,
                        episode: episode)),
              );
            },
            child: Container(
              padding:
                  const EdgeInsets.all(8).add(const EdgeInsets.only(left: 8)),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      image: context
                          .read<AppCacheManager>()
                          .getAnimeImage(episode.anime),
                      width: 72,
                      height: 88,
                      fit: BoxFit.cover,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        if (frame != null) return child;
                        return Container(
                          width: 72,
                          height: 88,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
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
                      errorBuilder: (_, __, ___) => toSvgIcon(
                        icon: Assets.iconsError,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          episode.anime.title.romaji,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (episode.anime.title.english != null)
                          Text(
                            episode.anime.title.english!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        const SizedBox(height: 9),
                        Text(
                          "Épisode ${episode.episode}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
