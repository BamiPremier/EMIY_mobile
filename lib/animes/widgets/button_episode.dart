import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/animes/bloc/action_comment_episode_cubit.dart';
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
    return BlocConsumer<EpisodeCubit, EpisodeState>(
      listener: onEventReceived,
      buildWhen: (_, state) => state is InitializingEpisodeState,
      builder: (context, state) {
        final episode = episodeCubit.episode;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                episode.hasLiked
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          episodeCubit.unLikeEpisode();
                        },
                      )
                    : IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          episodeCubit.likeEpisode();
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
                episodeCubit.shareEpisode();
              },
            ),
          ],
        );
      },
    );
  }

  void onEventReceived(BuildContext context, EpisodeState state) async {
    await waitForDialog();

    if (state is ShareEpisodeLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    } else if (state is ShareEpisodeSuccesState) {
      await Share.share(state.link);
    } else if (state is EpisodeErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
