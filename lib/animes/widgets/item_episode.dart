import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class EpisodeItem extends StatelessWidget {
  final Episode episode;

  const EpisodeItem({required this.episode});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      subtitleTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppTheme.disabledText,
          ),
      leadingAndTrailingTextStyle:
          Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppTheme.disabledText,
              ),
      title: Text('Episode ${episode.episode}'),
      subtitle: Text('${episode.airingAt} commentaires'),
      trailing: Text(DateTime(episode.timeUntilAiring).elapsed()),
    );
  }
}
