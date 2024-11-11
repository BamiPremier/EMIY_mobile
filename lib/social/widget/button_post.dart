import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/bloc/action_comment_cubit.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:share_plus/share_plus.dart';

class ButtonPost<T extends XItem, C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>> extends StatefulWidget {
  @override
  State<ButtonPost<T, C, A>> createState() => _ButtonPostState<T, C, A>();
}

class _ButtonPostState<T extends XItem, C extends XCommonCubit<T>,
        A extends ActionCommentBaseCubit<C>> extends State<ButtonPost<T, C, A>>
    with CompletableMixin {
  late final commonCubit = context.read<C>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, XCommonState>(
      listener: onEventReceived,
      buildWhen: (_, state) => state is InitializingXCommonState,
      builder: (context, state) {
        final post = commonCubit.x;
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
                          commonCubit.unLikeItem();
                        },
                      )
                    : IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          commonCubit.likeItem();
                        },
                      ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    context.read<A>().set(null);
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
              onPressed: () => commonCubit.shareItem(),
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
