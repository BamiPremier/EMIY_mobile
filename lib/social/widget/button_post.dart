import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:share_plus/share_plus.dart';

class ButtonPost extends StatefulWidget {
  const ButtonPost({
    super.key,
  });

  @override
  State<ButtonPost> createState() => _ButtonPostState();
}

class _ButtonPostState extends State<ButtonPost> with CompletableMixin {
  late final postCubit = context.read<PostCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, XCommonState>(
      listener: onEventReceived,
      buildWhen: (_, state) => state is InitializingXCommonState,
      builder: (context, state) {
        final post = postCubit.x;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                post.itemHasLiked
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          postCubit.unLikeItem();
                        },
                      )
                    : IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          postCubit.likeItem();
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
              onPressed: () => postCubit.shareItem(),
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
