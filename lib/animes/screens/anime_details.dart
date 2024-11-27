import 'dart:math';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/subpage/episode.dart';
import 'package:umai/animes/screens/subpage/quiz_anime.dart';
import 'package:umai/animes/screens/subpage/similar.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/widgets/btn_watch_view.dart';
import 'package:umai/animes/widgets/primary_info.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';
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
    with CompletableMixin {
  late final animeManipCubit = context.read<AnimeManipCubit>();
  late final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeManipCubit, AnimeManipState>(
      listener: onEventReceived,
      builder: (context, state) {
        final anime = animeManipCubit.anime;

        return NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              backgroundColor:
                Theme.of(context).colorScheme.tertiaryContainer,
              foregroundColor: AppTheme.white,
              expandedHeight: 200,
              pinned: true,
              actions: [
                IconButton(
                  onPressed: actionsOptions,
                  icon: toSvgIcon(
                    icon: Assets.iconsOptions,
                    color: AppTheme.white,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: context
                          .read<AppCacheManager>()
                          .getAnimeImage(anime),
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(
                            Icons.error,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                            size: 32,
                          ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height:
                        MediaQuery.of(context).viewPadding.top +
                            kToolbarHeight,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .inverseSurface,
                              Colors.transparent
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              systemOverlayStyle: Theme.of(context)
                  .appBarTheme
                  .systemOverlayStyle
                  ?.copyWith(statusBarIconBrightness: Brightness.light),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: AppTheme.white,
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 16.0,
                  right: 16.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.title.romaji,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                      Theme.of(context).textTheme.titleMedium,
                    ),
                    if (anime.title.english != null)
                      Text(
                        anime.title.english!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant),
                      ),
                    const SizedBox(height: 16),
                    const PrimaryInfo(),
                    const SizedBox(height: 32),
                    const BtnWatchView(),
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
                        parse(anime.description ?? '')
                            .documentElement!
                            .text,
                        trimMode: TrimMode.Line,
                        trimLines: 3,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                          inherit: true,
                          color: AppTheme.disabledText,
                        ),
                        colorClickableText:
                        Theme.of(context).primaryColor,
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
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 16)
                            .copyWith(
                            top: 2, bottom: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                          BorderRadius.circular(
                              100.0),
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
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
          body: Material(
            child: DefaultTabController(
                length: 3,
                child: Column(children: [
                  _TabBarGap(controller: _scrollController),
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding:
                    const EdgeInsets.symmetric(horizontal: 32),
                    unselectedLabelColor:
                    Theme.of(context).colorScheme.onSurfaceVariant,
                    labelStyle: Theme.of(context)
                        .tabBarTheme
                        .labelStyle!
                        .copyWith(
                        color:
                        Theme.of(context).colorScheme.onSurface),
                    tabs: const [
                      Tab(text: "Épisodes"),
                      Tab(text: "Recommandations"),
                      Tab(text: "Quiz"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        EpisodeScreen.get(context: context, anime: anime),
                        SimilarScreen.get(context: context, anime: anime),
                        QuizAnimeScreen.get(
                            context: context, anime: anime),
                      ],
                    ),
                  ),
                ])),
          ),
        );
      },
    );
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
                icon: toSvgIcon(
                  icon: Assets.iconsShare,
                ),
                onTap: () => animeManipCubit.shareAnime(),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          )));

  void onEventReceived(BuildContext context, AnimeManipState state) async {
    await waitForDialog();

    if (state is ShareAnimeLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    } else if (state is ShareAnimeSuccesState) {
      await Share.share(state.link);
    } else if (state is AnimeManipErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _TabBarGap extends StatefulWidget {
  final ScrollController controller;

  const _TabBarGap({required this.controller});

  @override
  State<_TabBarGap> createState() => _TabBarGapState();
}

class _TabBarGapState extends State<_TabBarGap> {
  double gap = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (!widget.controller.hasClients) return;

      // calcule la distance entre le début du body (du NestedScrollView) et
      // le haut de l'écran, et en fait un SizedBox. L'écart s'adapte en
      // fonction de la distance entre les deux, ce qui donne l'effet sticky.
      setState(() {
        gap = max(
          widget.controller.position.pixels
              - (widget.controller.position.maxScrollExtent
                - MediaQuery.of(context).viewPadding.top
                - kToolbarHeight),
          0
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: gap);
  }
}
