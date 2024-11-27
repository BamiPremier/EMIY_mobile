import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/activity/widgets/activity/anime/anime_primary_info.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart'; 
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/assets.dart'; 
import 'package:umai/utils/svg_utils.dart'; 

class AnimeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeManipCubit, AnimeManipState>(
      builder: (context, state) {
        final animeManipCubit = context.read<AnimeManipCubit>();
        final anime = animeManipCubit.anime;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding:
                const EdgeInsets.all(8).add(const EdgeInsets.only(left: 8)),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: context.read<AppCacheManager>().getAnimeImage(anime),
                    width: 72,
                    height: 88,
                    fit: BoxFit.cover,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (frame != null) return child;
                      return Container(
                        width: 72,
                        height: 88,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
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
                    errorBuilder: (_, __, ___) => toSvgIcon(
                      icon: Assets.iconsError,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anime.title.romaji,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (anime.title.english != null)
                        Text(
                          anime.title.english!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 8),
                      const ActivityAnimePrimaryInfo()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
