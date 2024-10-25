import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/anime_manip_cubit.dart';
import 'package:umai/utils/themes.dart';

class BtnWatchView extends StatefulWidget {
  @override
  State<BtnWatchView> createState() => _BtnWatchViewState();
}

class _BtnWatchViewState extends State<BtnWatchView> {
  late final animeManipCubit = context.read<AnimeManipCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeManipCubit, AnimeManipState>(
        builder: (context, state) {
      return Row(
        children: [
          animeManipCubit.anime.isViewed
              ? Expanded(
                  child: FilledButton(
                      onPressed: () => animeManipCubit.removeFromViewed(),
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        textStyle:
                            Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        if (state is AnimeManipViewedLoadingState)
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                              strokeWidth: 2,
                            ),
                          )
                        else
                          Icon(
                            Icons.check,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                          ),
                        const SizedBox(width: 8),
                        Text(
                          "J'ai vu",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer),
                        ),
                      ])))
              : Expanded(
                  child: FilledButton(
                      onPressed: () => animeManipCubit.addToViewed(),
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        textStyle:
                            Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: AppTheme.mainText,
                                ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        state is AnimeManipViewedLoadingState
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    color: AppTheme.black, strokeWidth: 2),
                              )
                            : const Icon(
                                Icons.add,
                                color: AppTheme.black,
                              ),
                        const SizedBox(width: 8),
                        Text(
                          "J'ai vu",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppTheme.mainText,
                                  ),
                        )
                      ]))),
          const SizedBox(width: 8),
          animeManipCubit.anime.isInWatchlist
              ? Expanded(
                  child: FilledButton(
                      onPressed: () => animeManipCubit.removeFromWatchlist(),
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        textStyle:
                            Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        if (state is AnimeManipWatchlistLoadingState)
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              strokeWidth: 2,
                            ),
                          )
                        else
                          Icon(
                            Icons.check,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        const SizedBox(width: 8),
                        Text(
                          'A voir',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                        ),
                      ])))
              : Expanded(
                  child: FilledButton(
                      onPressed: () => animeManipCubit.addToWatchlist(),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.mainText,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        state is AnimeManipWatchlistLoadingState
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    color: AppTheme.white, strokeWidth: 2),
                              )
                            : const Icon(
                                Icons.add,
                                color: AppTheme.white,
                              ),
                        const SizedBox(width: 8),
                        Text(
                          'A voir',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppTheme.white,
                                  ),
                        )
                      ]))),
        ],
      );
    });
  }
}
