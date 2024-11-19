import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/auth/bloc/select_anime_cubitt.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

class AnimeItem extends StatelessWidget {
  final bool withSelect;
  final bool isViewedList;

  static Widget get({
    required BuildContext context,
    required Anime anime,
    bool withSelect = false,
    bool isViewedList = false,
  }) {
    return BlocProvider.value(
      value: context.read<AnimeCubitManager>().get(anime),
      child: AnimeItem._(
        withSelect,
        isViewedList,
      ),
    );
  }

  const AnimeItem._(
    this.withSelect,
    this.isViewedList,
  );

  @override
  Widget build(BuildContext context) {
    return withSelect
        ? BlocBuilder<SelectAnimeCubit, List<Anime>>(builder: (context, state) {
            final animeManipCubit = context.read<AnimeManipCubit>();
            final anime = animeManipCubit.anime;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => action(
                context: context,
                anime: anime,
                selectAnimeCubit: context.read<SelectAnimeCubit>(),
              ),
              child: Stack(
                children: [
                  animeItemImage(anime: anime, context: context),
                  if (context.read<SelectAnimeCubit>().isSelected(anime))
                    isViewedList
                        ? Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.7),
                              child: Center(
                                  child: toSvgIcon(
                                      icon: Assets.iconsTick,
                                      size: 32.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface)),
                            ),
                          )
                        : Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.7),
                              child: Center(
                                  child: toSvgIcon(
                                      icon: Assets.iconsBookmark,
                                      size: 32.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface)),
                            ),
                          ),
                ],
              ),
            );
          })
        : BlocConsumer<AnimeManipCubit, AnimeManipState>(
            listener: (context, state) {},
            builder: (context, state) {
              final animeManipCubit = context.read<AnimeManipCubit>();
              final anime = animeManipCubit.anime;
              return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AnimeDetailScreen.get(
                          context: context, anime: anime))),
                  child: animeItemImage(anime: anime, context: context));
            });
  }

  void action({
    required BuildContext context,
    required Anime anime,
    required SelectAnimeCubit selectAnimeCubit,
  }) async {
    if (withSelect) {
      if (selectAnimeCubit.isSelected(anime)) {
        selectAnimeCubit.removeAnime(anime);
      } else {
        selectAnimeCubit.addAnime(anime);
      }
    }
  }

  animeItemImage({required BuildContext context, required Anime anime}) =>
      Image(
        image: context.read<AppCacheManager>().getAnimeImage(anime),
        fit: BoxFit.cover,
        width: double.infinity,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame != null) return child;
          return Container(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            width: double.infinity,
            child: wasSynchronouslyLoaded
                ? child
                : Center(
                    child: SizedBox(
                      height: 16.0,
                      width: 16.0,
                      child: CircularProgressIndicator(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
          );
        },
        errorBuilder: (_, __, ___) => const Icon(Icons.error),
      );
}
