import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/widgets/anime_block.dart';
import 'package:umai/common/services/home_anime_service.dart';

class AnimeHomeScreen extends StatefulWidget {
  const AnimeHomeScreen({
    super.key,
  });

  @override
  State<AnimeHomeScreen> createState() => _AnimeHomeScreenState();
}

class _AnimeHomeScreenState extends State<AnimeHomeScreen> {
  late final homeAnimeService = context.read<HomeAnimeService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: RefreshIndicator(
        onRefresh: () async => homeAnimeService.refresh(),
        notificationPredicate: (notification) {
          return notification.depth == 1 &&
            notification.metrics.axisDirection == AxisDirection.down;
        },
        child: NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, _) => [
            AnimeBlock(
              title: "Tendance",
              filter: AnimeBlockFilter.trending,
              cubit: homeAnimeService.trendingCubit,
            ),
            AnimeBlock(
              title: "Saison prochaine",
              filter: AnimeBlockFilter.nextSeason,
              cubit: homeAnimeService.nextSeasonCubit,
            ),
            AnimeBlock.empty(
                title: "Tous les animes", cubit: homeAnimeService.allCubit),
          ],
          body: AnimeBlock.skinless(
            filter: AnimeBlockFilter.all,
            cubit: homeAnimeService.allCubit,
          ),
        ),
      ),
    );
  }
}
