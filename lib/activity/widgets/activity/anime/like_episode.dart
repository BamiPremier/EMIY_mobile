import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/activity/widgets/activity/activity_btn_type1.dart';
import 'package:umai/activity/widgets/activity/activity_head.dart';
import 'package:umai/activity/widgets/activity/anime/episode_info.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/person_cubit_manager.dart';

class LikeEpisodeWidget extends StatefulWidget {
  final String targetEntity;
  final Episode? episode;

  LikeEpisodeWidget.forNoEpisode({
    required this.targetEntity,
  }) : episode = null;

  LikeEpisodeWidget.forEpisode({
    required this.targetEntity,
    required this.episode,
  });

  static Widget get({
    required BuildContext context,
    Episode? episode,
    required String targetEntity,
    required User user,
  }) {
    if (episode == null) {
      return BlocProvider.value(
          value: context.read<PersonCubitManager>().get(user),
          child: LikeEpisodeWidget.forNoEpisode(targetEntity: targetEntity));
    } else {
      final episodeCubit = context.read<EpisodeCubitManager>().get(episode);
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: episodeCubit,
          ),
          BlocProvider<XCommonCubit<Episode>>.value(value: episodeCubit),
          BlocProvider.value(
            value: context.read<PersonCubitManager>().get(user),
          ),
        ],
        child: LikeEpisodeWidget.forEpisode(
            targetEntity: targetEntity, episode: episode),
      );
    }
  }

  @override
  _LikeEpisodeWidgetState createState() => _LikeEpisodeWidgetState();
}

class _LikeEpisodeWidgetState extends State<LikeEpisodeWidget> {
  @override
  Widget build(BuildContext context) {
    return (widget.episode == null)
        ? buildNoEpisode()
        : buildEpisode(widget.episode!);
  }

  Widget buildNoEpisode() {
    final personCubit = context.read<PersonCubit>();
    final user = personCubit.user;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ActivityHeadWidget.get(
            context: context, targetEntity: widget.targetEntity, user: user),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Le contenu n’est plus disponible",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildEpisode(Episode episode) {
    return BlocConsumer<EpisodeCubit, XCommonState>(
      listener: (context, state) {},
      builder: (context, state) {
        Episode episode = context.read<EpisodeCubit>().x as Episode;

        final personCubit = context.read<PersonCubit>();
        final user = personCubit.user;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivityHeadWidget.get(
                context: context,
                targetEntity: widget.targetEntity,
                user: user),
            const SizedBox(height: 8),
            const EpisodeInfo(),
            ActivityBtnType1Widget<Episode>(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CommonDetailsScreen.fromEpisode(
                          context: context,
                          episode: episode,
                        ))))
          ],
        );
      },
    );
  }
}
