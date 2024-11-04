import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/animes/bloc/episode_anime_cubit.dart';
import 'package:umai/animes/bloc/similar_anime_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/widgets/btn_watch_view.dart';
import 'package:umai/animes/widgets/item_anime.dart';
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

class SimilarScreen extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required Anime anime,
    bool withAction = false,
  }) {
    return BlocProvider.value(
      value: context.read<AnimeCubitManager>().get(anime),
      child: SimilarScreen._(),
    );
  }

  const SimilarScreen._();

  @override
  State<SimilarScreen> createState() => _SimilarScreenState();
}

class _SimilarScreenState extends State<SimilarScreen>
    with SingleTickerProviderStateMixin {
  late final animeManipCubit = context.read<AnimeManipCubit>();

  late final anime = animeManipCubit.anime;
  late final SimilarAnimeCubit cubit =
      SimilarAnimeCubit(context.read(), context.read(), anime.id.toString());
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeManipCubit, AnimeManipState>(
        builder: (context, state) {
      return AutoListView.get<Anime>(
        cubit: cubit,
        autoManage: false,
        viewType: ViewType.grid,
        itemBuilder: (context, anime) =>
            AnimeItem.get(context: context, anime: anime, withAction: false),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: .65),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        errorBuilder: (context, retry) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Une erreur s'est produite"),
            TextButton(
              onPressed: retry,
              child: const Text("Réessayer"),
            )
          ],
        ),
        // loadingBuilder: (context) => Container(
        //     padding: const EdgeInsets.only(top: 16, bottom: 28)
        //         .add(const EdgeInsets.symmetric(horizontal: 16)),
        //     child: LinearProgressIndicator(
        //       color: Theme.of(context).colorScheme.onTertiaryContainer,
        //       backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        //       borderRadius: BorderRadius.circular(30),
        //     )),
      );
    });
  }
}
