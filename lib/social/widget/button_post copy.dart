import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/social/cubit/post_cubit.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:share_plus/share_plus.dart';

class ButtonPost extends StatefulWidget {
  final PostCubit postCubit;
  final VoidCallback? actionFocus;

  const ButtonPost({required this.postCubit, this.actionFocus});

  @override
  _ButtonPostState createState() => _ButtonPostState();
}

class _ButtonPostState extends State<ButtonPost> with CompletableMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
        listener: onEventReceived,
        builder: (context, state) {
          final post = widget.postCubit.post;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  post.hasLiked
                      ? IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            widget.postCubit.unLikePost();
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () {
                            widget.postCubit.likePost();
                          },
                        ),
                  IconButton(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    onPressed: widget.actionFocus,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onPressed: () => widget.postCubit.sharePost(),
              ),
            ],
          );
        });
  }

  void onEventReceived(BuildContext context, PostState state) async {
    await waitForDialog();

    if (state is PostLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    }
    if (state is SharePostPostSuccesState) {
      Share.share('Suivre ce lien pour voir le post : ${state.link}');
    } else if (state is PostErrorState) {
      showErrorToast(state.error);
    }
  }
}
