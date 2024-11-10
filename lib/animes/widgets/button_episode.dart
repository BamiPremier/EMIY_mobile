import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/animes/bloc/action_comment_episode_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';

class ButtonEpisode extends StatefulWidget {
  const ButtonEpisode({
    super.key,
  });

  @override
  State<ButtonEpisode> createState() => _ButtonEpisodeState();
}

class _ButtonEpisodeState extends State<ButtonEpisode> with CompletableMixin {
  late final episodeCubit = context.read<EpisodeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EpisodeCubit, XCommonState>(
      listener: onEventReceived,
      buildWhen: (_, state) => state is InitializingXCommonState,
      builder: (context, state) {
        final episode = episodeCubit.x;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                episode.itemHasLiked
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          episodeCubit.unLikeItem();
                        },
                      )
                    : IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          episodeCubit.likeItem();
                        },
                      ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    context.read<ActionCommentEpisodeCubit>().set(null);
                  },
                ),
              ],
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.share,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                episodeCubit.shareItem();
              },
            ),
          ],
        );
      },
    );
  }

  void onEventReceived(BuildContext context, XCommonState state) async {
    await waitForDialog();

    if (state is ShareItemLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    } else if (state is ShareItemSuccesState) {
      await Share.share(state.shareLink);
    } else if (state is XErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
