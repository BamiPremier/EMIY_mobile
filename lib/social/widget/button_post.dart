import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:share_plus/share_plus.dart';

class ButtonPost extends StatefulWidget {
  const ButtonPost({
    super.key,
  });

  @override
  _ButtonPostState createState() => _ButtonPostState();
}

class _ButtonPostState extends State<ButtonPost> with CompletableMixin {
  late final postCubit = context.read<PostCubit>();

  @override
  Widget build(BuildContext context) {
    final post = postCubit.post;
    return BlocListener<PostCubit, PostState>(
      listener: onEventReceived,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              post.hasLiked
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        postCubit.unLikePost();
                      },
                    )
                  : IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      onPressed: () {
                        postCubit.likePost();
                      },
                    ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onPressed: () {
                  context.read<ActionCommentCubit>().set(null);
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
            onPressed: () => postCubit.sharePost(),
          ),
        ],
      ),
    );
  }

  bool isSharing = false;
  void onEventReceived(BuildContext context, PostState state) async {
    await waitForDialog();

    if (state is SharePostLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    } else if (state is SharePostSuccesState) {
      if (!isSharing) {
        isSharing = true;

        final result = await Share.share(
          'Suivre ce lien pour voir le post : ${state.link}',
        );

        isSharing = false;
      }
    } else if (state is PostErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
