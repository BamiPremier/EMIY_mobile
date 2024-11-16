import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class BtnWatchView extends StatefulWidget {
  const BtnWatchView({super.key});

  @override
  State<BtnWatchView> createState() => _BtnWatchViewState();
}

class _BtnWatchViewState extends State<BtnWatchView> {
  late final animeManipCubit = context.read<AnimeManipCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeManipCubit, AnimeManipState>(
        builder: (context, state) {
      final anime = animeManipCubit.anime;
      final viewedForegroundColor = anime.isViewed
        ? Theme.of(context).colorScheme.onTertiaryContainer
        : Theme.of(context).colorScheme.onPrimary;
      final watchlistForegroundColor = anime.isInWatchlist
        ? Theme.of(context).colorScheme.onSurfaceVariant
        : AppTheme.white;
      return Row(
        children: [
          Expanded(
            child: FilledButton(
              onPressed: () {
                anime.isViewed
                  ? animeManipCubit.removeFromViewed()
                  : animeManipCubit.addToViewed();
              },
              style: FilledButton.styleFrom(
                backgroundColor: anime.isViewed
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : Theme.of(context).colorScheme.primary,
                foregroundColor: viewedForegroundColor,
                textStyle: Theme.of(context).textTheme.labelLarge,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state is AnimeManipViewedLoadingState)
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        color: viewedForegroundColor,
                        strokeWidth: 2,
                      ),
                    )
                  else
                    toSvgIcon(
                      icon: Assets.iconsTick,
                      color: viewedForegroundColor,
                      size: 14,
                    ),
                  const SizedBox(width: 8),
                  const Text("J'ai vu"),
                ])),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: FilledButton(
              onPressed: () {
                anime.isInWatchlist
                  ? animeManipCubit.removeFromWatchlist()
                  : animeManipCubit.addToWatchlist();
              },
              style: FilledButton.styleFrom(
                backgroundColor: anime.isInWatchlist
                  ? Theme.of(context).colorScheme.surfaceContainerHighest
                  : AppTheme.black,
                foregroundColor: watchlistForegroundColor,
                textStyle: Theme.of(context).textTheme.labelLarge,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state is AnimeManipWatchlistLoadingState)
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        color: watchlistForegroundColor,
                        strokeWidth: 2,
                      ),
                    )
                  else
                    toSvgIcon(
                      icon: Assets.iconsBookmark,
                      color: watchlistForegroundColor,
                      size: 14,
                    ),
                  const SizedBox(width: 8),
                  const Text('À voir')
                ]
              )
            ),
          )
        ],
      );
    });
  }
}
