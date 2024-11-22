import 'package:flutter/material.dart';
import 'package:potatoes_secured_preferences/potatoes_secured_preferences.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/animes/widgets/episode_head.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class EpisodeItem extends StatefulWidget {
  const EpisodeItem._();

  static Widget get({required BuildContext context, required Episode episode}) {
    return BlocProvider.value(
      value: context.read<EpisodeCubitManager>().get(episode),
      child: const EpisodeItem._(),
    );
  }

  @override
  State<EpisodeItem> createState() => _EpisodeItemState();
}

class _EpisodeItemState extends State<EpisodeItem> {
  late final episodeCubit = context.read<EpisodeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EpisodeCubit, XCommonState>(
        listener: (context, state) {},
        builder: (context, state) {
          Episode episode = context.read<EpisodeCubit>().x as Episode;

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CommonDetailsScreen.fromEpisode(
                    context: context,
                    episode: episode,
                    head: (context) => EpisodeHead.get(
                          context: context,
                          episode: episode,
                        )))),
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
                                        episode.airingAt * 1000,
                                        isUtc: false)
                                    .toLocal()
                                    .elapsed(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppTheme.disabledText,
                                    ),
                              ),
                            ]),
                        const SizedBox(height: 8),
                        Text(
                          '${episode.commentsCount} commentaire${episode.commentsCount < 2 ? "" : "s"}',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
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
        });
  }
}
