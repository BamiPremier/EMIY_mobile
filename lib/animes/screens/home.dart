import 'package:flutter/material.dart';
import 'package:umai/animes/widgets/anime_block.dart';

class AnimeHomeScreen extends StatefulWidget {
  const AnimeHomeScreen({super.key});

  @override
  State<AnimeHomeScreen> createState() => _AnimeHomeScreenState();
}

class _AnimeHomeScreenState extends State<AnimeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      headerSliverBuilder: (context, _) => const [
        AnimeBlock(
          title: "Tendance",
          filter: AnimeBlockFilter.trending,
        ),
        AnimeBlock(
          title: "Saison prochaine",
          filter: AnimeBlockFilter.nextSeason,
        ),
        AnimeBlock.empty(title: "Tous les animes"),
      ],
      body: const AnimeBlock.skinless(filter: AnimeBlockFilter.all),
    );
  }
}
