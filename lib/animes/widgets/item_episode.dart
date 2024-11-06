import 'package:flutter/material.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/screens/episode_details.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class EpisodeItem extends StatelessWidget {
  final Episode episode;

  const EpisodeItem({required this.episode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              EpisodeDetailsScreen.from(context: context, episode: episode))),
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
                          'Episode ${episode.episode}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "il y'a 12 h",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppTheme.disabledText,
                                  ),
                        ),
                      ]),
                  const SizedBox(height: 8),
                  Text(
                    '12 commentaires',
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
