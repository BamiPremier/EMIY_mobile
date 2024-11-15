import 'package:flutter/material.dart';

import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/widgets/item_episode.dart';

class EpisodeScreen extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required Anime anime,
    bool withAction = false,
  }) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(
        value: context.read<AnimeCubitManager>().get(anime),
      ),
      BlocProvider(
          create: (context) => LoadEpisodeAnimeCubit(
              context.read(), context.read(), anime.id.toString())),
    ], child: const EpisodeScreen._());
  }

  const EpisodeScreen._();

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen>
    with SingleTickerProviderStateMixin {
  late final loadEpisodeAnimeCubit = context.read<LoadEpisodeAnimeCubit>();

  @override
  Widget build(BuildContext context) {
    return AutoListView.get<Episode>(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
        ),
        cubit: loadEpisodeAnimeCubit,
        itemBuilder: (context, episode) => EpisodeItem(
            loadEpisodeAnimeCubit: loadEpisodeAnimeCubit, episode: episode),
        emptyBuilder: (ctx) => Center(
              child: toSvgIcon(
                icon: Assets.iconsEmpty,
                height: 56,
                width: 56,
              ),
            ),
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
            ));
  }
}
