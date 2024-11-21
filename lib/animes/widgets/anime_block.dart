import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/category_anime_cubit.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/widgets/item_anime.dart';

class AnimeBlock extends StatefulWidget {
  final String title;
  final AnimeBlockFilter? filter;
  final AnimeBlockType type;

  const AnimeBlock({super.key, required this.title, required this.filter})
      : type = AnimeBlockType.regular;

  const AnimeBlock.empty({
    super.key,
    required this.title,
  })  : type = AnimeBlockType.empty,
        filter = null;

  const AnimeBlock.skinless({
    super.key,
    required this.filter,
  })  : type = AnimeBlockType.skinless,
        title = '';

  @override
  State<AnimeBlock> createState() => _AnimeBlockState();
}

class _AnimeBlockState extends State<AnimeBlock> {
  late final cubit = CategoryAnimeCubit(
      context.read(),
      context.read(),
      widget.filter?.name ?? '',
      widget.type == AnimeBlockType.skinless ? 9 : null);

  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      childAspectRatio: .65);

  Widget headerBuilder(BuildContext context, SliverStickyHeaderState state) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Theme.of(context).colorScheme.surface,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: state.isPinned
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : Theme.of(context).colorScheme.outline,
              width: 2.0),
          borderRadius: BorderRadius.circular(100),
          color: state.isPinned
              ? Theme.of(context).colorScheme.tertiaryContainer
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Text(widget.title,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: state.isPinned
                    ? Theme.of(context).colorScheme.onTertiaryContainer
                    : Theme.of(context).colorScheme.onSurfaceVariant)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case AnimeBlockType.regular:
        return SliverStickyHeader.builder(
          builder: headerBuilder,
          sliver: SliverToBoxAdapter(
            child: AutoListView.manual<Anime>(
              cubit: cubit,
              autoManage: false,
              viewType: ViewType.grid,
              itemBuilder: (context, anime) => AnimeItem.get(
                  context: context, anime: anime, withSelect: false),
              gridDelegate: gridDelegate,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                emptyBuilder: (ctx) => const EmptyBuilder(),
               errorBuilder: (context, retry) => ErrorBuilder(retry: retry),
              loadingBuilder: widgetBuilder,
              manualLoadMoreBuilder: (ctx, loadMore) => Container(
                margin: const EdgeInsets.only(right: 16.0),
                alignment: Alignment.bottomRight,
                child: TextButton.icon(
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    textStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                  onPressed: loadMore,
                  icon: toSvgIcon(icon: Assets.iconsDirectionDown, size: 12.0),
                  label: const Text("Voir plus"),
                ),
              ),
              loadingMoreBuilder: (context) => Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 28)
                      .add(const EdgeInsets.symmetric(horizontal: 16)),
                  child: LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
        );
      case AnimeBlockType.empty:
        return SliverStickyHeader.builder(
          builder: headerBuilder,
        );
      case AnimeBlockType.skinless:
        return AutoListView.get<Anime>(
          cubit: cubit,
          autoManage: false,
          viewType: ViewType.grid,
          itemBuilder: (context, anime) =>
              AnimeItem.get(context: context, anime: anime, withSelect: false),
          gridDelegate: gridDelegate,
          emptyBuilder: (ctx) => const EmptyBuilder(),
           errorBuilder: (context, retry) => ErrorBuilder(retry: retry),
          loadingBuilder: widgetBuilder,
          loadingMoreBuilder: (context) => Container(
              padding: const EdgeInsets.only(top: 16, bottom: 28)
                  .add(const EdgeInsets.symmetric(horizontal: 16)),
              child: LinearProgressIndicator(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(30),
              )),
        );
    }
  }

  Widget widgetBuilder(context) => Column(
        children: [
          GridView.builder(
            padding: EdgeInsets.zero,
            physics: const PageScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: gridDelegate,
            itemBuilder: (_, __) => Container(
              alignment: Alignment.center,
              color: Theme.of(context).colorScheme.tertiaryContainer,
              child: SizedBox(
                height: 16.0,
                width: 16.0,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  strokeWidth: 2.0,
                ),
              ),
            ),
            itemCount: 6, // Nombre de carrés souhaité
          ),
          if (widget.type == AnimeBlockType.regular)
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                iconAlignment: IconAlignment.end,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
                onPressed: null,
                icon: toSvgIcon(icon: Assets.iconsDirectionDown, size: 12.0),
                label: const Text("Voir plus"),
              ),
            ),
        ],
      );
}

enum AnimeBlockType { regular, empty, skinless }

enum AnimeBlockFilter { trending, nextSeason, all }

extension AnimeBlockFilterExtension on AnimeBlockFilter {
  String get name {
    switch (this) {
      case AnimeBlockFilter.trending:
        return 'TRENDING';
      case AnimeBlockFilter.nextSeason:
        return 'NEXT_SEASON';
      case AnimeBlockFilter.all:
        return 'ALL';
    }
  }
}
