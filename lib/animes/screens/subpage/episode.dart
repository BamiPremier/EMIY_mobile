import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/animes/bloc/episode_anime_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/widgets/btn_watch_view.dart';
import 'package:umai/animes/widgets/item_episode.dart';
import 'package:umai/animes/widgets/primary_info.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/monthToString.dart';
import 'package:umai/utils/themes.dart';

class EpisodeScreen extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required Anime anime,
    bool withAction = false,
  }) {
    return BlocProvider.value(
      value: context.read<AnimeCubitManager>().get(anime),
      child: EpisodeScreen._(),
    );
  }

  const EpisodeScreen._();

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen>
    with SingleTickerProviderStateMixin {
  late final animeManipCubit = context.read<AnimeManipCubit>();

  late final anime = animeManipCubit.anime;
  late final EpisodeAnimeCubit _episodeAnimeCubit =
      EpisodeAnimeCubit(context.read(), anime.id.toString());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeManipCubit, AnimeManipState>(
        builder: (context, state) {
      return AutoListView.get<Episode>(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
        ),
        cubit: _episodeAnimeCubit,
        itemBuilder: (context, episode) => EpisodeItem(episode: episode),
        errorBuilder: (context, retry) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("An error occured"),
              TextButton(
                onPressed: retry,
                child: const Text("Retry"),
              )
            ],
          ),
        ),
      );
    });
  }
}
