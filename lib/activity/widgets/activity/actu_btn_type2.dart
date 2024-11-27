import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart'; 
import 'package:share_plus/share_plus.dart'; 
import 'package:umai/common/bloc/anime_manip_cubit.dart'; 
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart'; 

class ActuBtnType2Widget extends StatefulWidget {
  const ActuBtnType2Widget({super.key});

  @override
  State<ActuBtnType2Widget> createState() => _ActuBtnType2WidgetState();
}

class _ActuBtnType2WidgetState extends State<ActuBtnType2Widget>
    with CompletableMixin {
  late final animeManipCubit = context.read<AnimeManipCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeManipCubit, AnimeManipState>(
      listener: onEventReceived,
      builder: (context, state) {
        final anime = animeManipCubit.anime;
        final viewedForegroundColor = anime.isViewed
            ? AppTheme.primaryYellow
            : Theme.of(context).colorScheme.onSurfaceVariant;
        final watchlistForegroundColor = anime.isInWatchlist
            ? AppTheme.primaryYellow
            : Theme.of(context).colorScheme.onSurfaceVariant;
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                
                  padding: EdgeInsets.zero,
                  icon: toSvgIcon(
                    icon: Assets.iconsTick,
                    color: viewedForegroundColor,
                  ),
                  onPressed: () {
                    anime.isViewed
                        ? animeManipCubit.removeFromViewed()
                        : animeManipCubit.addToViewed();
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: toSvgIcon(
                    icon: Assets.iconsBookmark,
                    color: watchlistForegroundColor,
                  ),
                  onPressed: () {
                    anime.isInWatchlist
                        ? animeManipCubit.removeFromWatchlist()
                        : animeManipCubit.addToWatchlist();
                  },
                ),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: toSvgIcon(
                    icon: Assets.iconsShare,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    animeManipCubit.shareAnime();
                  },
                ),
              ],
            ));
      },
    );
  }

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
}
