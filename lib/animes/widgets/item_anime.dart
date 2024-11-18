import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/auth/bloc/anime_by_genre_cubit.dart';
import 'package:umai/auth/bloc/select_anime_cubitt.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

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
                  Image(
                    image: context.read<AppCacheManager>().getAnimeImage(anime),
                    fit: BoxFit.cover,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (frame != null) return child;
                      return Container(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        height: 368,
                        width: double.infinity,
                        child: wasSynchronouslyLoaded
                            ? child
                            : Center(
                                child: SizedBox(
                                  height: 16.0,
                                  width: 16.0,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                    strokeWidth: 2.0,
                                  ),
                                ),
                              ),
                      );
                    },
                    errorBuilder: (_, __, ___) => const Icon(Icons.error),
                  ),
                  if (context.read<SelectAnimeCubit>().isSelected(anime))
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                        child: Center(
                            child: toSvgIcon(
                                icon: Assets.iconsBookmark,
                                size: 32.0,
                                color: AppTheme.disabledText)),
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
                    builder: (_) =>
                        AnimeDetailScreen.get(context: context, anime: anime))),
                child: Stack(
                  children: [
                    Image(
                      image:
                          context.read<AppCacheManager>().getAnimeImage(anime),
                      fit: BoxFit.cover,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        if (frame != null) return child;
                        return Container(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          height: 368,
                          width: double.infinity,
                          child: wasSynchronouslyLoaded
                              ? child
                              : Center(
                                  child: SizedBox(
                                    height: 16.0,
                                    width: 16.0,
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiaryContainer,
                                      strokeWidth: 2.0,
                                    ),
                                  ),
                                ),
                        );
                      },
                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                    ),
                  ],
                ),
              );
            });
  }

  void action({
    required BuildContext context,
    required Anime anime,
    required SelectAnimeCubit selectAnimeCubit,
  }) async {
    if (withSelect) {
      // if (isViewedList) {
      if (selectAnimeCubit.isSelected(anime)) {
        selectAnimeCubit.removeAnime(anime);
      } else {
        selectAnimeCubit.addAnime(anime);
      }
    }
  }

  // void onEventReceived(BuildContext context, AnimeManipState state) async {
  //   if (withSelect) {
  //     if (state is WatchListAddSuccesState) {
  //       Navigator.of(context).pop();
  //       showSuccessToast(
  //           content: "Anime ajouté à votre watchlist", context: context);
  //     } else if (state is AnimeViewedAddSuccesState) {
  //       Navigator.of(context).pop();
  //       showSuccessToast(
  //           content: "Anime ajouté à votre liste de vue", context: context);
  //     } else if (state is AnimeManipErrorState) {
  //       showErrorToast(content: state.error, context: context);
  //     }
  //   }
  // }
}
