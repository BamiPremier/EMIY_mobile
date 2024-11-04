import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/subpage/episode.dart';
import 'package:umai/animes/screens/subpage/similar.dart';
import 'package:umai/animes/widgets/btn_watch_view.dart';
import 'package:umai/animes/widgets/primary_info.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/monthToString.dart';
import 'package:umai/utils/themes.dart';

class AnimeDetailScreen extends StatefulWidget {
  final Anime anime;

  static Widget get({
    required BuildContext context,
    required Anime anime,
    bool withAction = false,
  }) {
    return BlocProvider.value(
      value: context.read<AnimeCubitManager>().get(anime),
      child: AnimeDetailScreen._(anime: anime),
    );
  }

  const AnimeDetailScreen._({
    required this.anime,
  });

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen>
    with SingleTickerProviderStateMixin {
  late final animeManipCubit = context.read<AnimeManipCubit>();

  final _trimMode = TrimMode.Line;
  final isCollapsed = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeManipCubit, AnimeManipState>(
        builder: (context, state) {
      final anime = animeManipCubit.anime;
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              foregroundColor: AppTheme.white,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: context
                          .read<AppCacheManager>()
                          .getImage(anime.coverImage.extraLarge ?? ''),
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.error,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        size: 32,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: MediaQuery.of(context).viewPadding.top +
                            kToolbarHeight,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).colorScheme.inverseSurface,
                              Colors.transparent
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: actionsOptions,
                  icon: const Icon(Icons.more_vert),
                ),
              ],
              systemOverlayStyle: Theme.of(context)
                  .appBarTheme
                  .systemOverlayStyle
                  ?.copyWith(statusBarIconBrightness: Brightness.light),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.title.romaji,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (anime.title.english != null)
                      Text(
                        anime.title.english!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    const SizedBox(height: 16),
                    const PrimaryInfo(),
                    const SizedBox(height: 32),
                    BtnWatchView(),
                    const SizedBox(height: 32),
                    Text(
                      "Synopsis",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.topCenter,
                      curve: Curves.easeInOut,
                      child: ReadMoreText(
                        anime.description ?? '',
                        trimMode: _trimMode,
                        trimLines: 3,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              inherit: true,
                              color: const Color(0xff9F9F9F),
                            ),
                        colorClickableText: Theme.of(context).primaryColor,
                        trimCollapsedText: 'Lire plus',
                        trimExpandedText: ' moins',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: anime.genres
                              ?.map((genre) => Container(
                                    padding: const EdgeInsets.symmetric(
                                            horizontal: 16)
                                        .copyWith(top: 2, bottom: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface),
                                      color: Theme.of(context)
                                          .chipTheme
                                          .backgroundColor,
                                    ),
                                    child: Text(
                                      genre,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ))
                              .toList() ??
                          [],
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    TabBar(
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onSurfaceVariant,
                      labelStyle: Theme.of(context)
                          .tabBarTheme
                          .labelStyle!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onSurface),
                      tabs: const [
                        Tab(text: "Épisodes"),
                        Tab(text: "Recommandations"),
                        Tab(text: "Quiz"),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: TabBarView(
                        children: [
                          EpisodeScreen.get(context: context, anime: anime),
                          SimilarScreen.get(context: context, anime: anime),
                          const Center(child: Text("Quiz Content")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  void actionsOptions() => showAppBottomSheet(
      context: context,
      horizontalPadding: 16.0,
      builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ActionWidget(
                title: 'Partager...',
                icon: Icons.share_outlined,
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          )));
}
