import 'package:flutter/material.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/models/episode.dart'; 
import 'package:umai/animes/widgets/episode_head.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class EpisodeItem extends StatelessWidget {
  final Episode episode;
  final LoadEpisodeAnimeCubit loadEpisodeAnimeCubit;
  const EpisodeItem({
    super.key,
    required this.episode,
    required this.loadEpisodeAnimeCubit
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CommonDetailsScreen.fromEpisode(
              loadEpisodeAnimeCubit: loadEpisodeAnimeCubit,
              context: context,
              episode: episode,
              head: (context) => const EpisodeHead()))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Row(
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
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppTheme.disabledText,
                                  ),
                        ),
                      ]),
                  const SizedBox(height: 8),
                  Text(
                    '${episode.commentsCount} commentaire${episode.commentsCount < 1 ? '' : 's'}',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: AppTheme.disabledText,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
