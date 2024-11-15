import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/utils/svg_utils.dart';

class ButtonCommon<T extends XItem> extends StatefulWidget {
  final bool canComment;

  const ButtonCommon({
    super.key,
    this.canComment = true,
  });

  @override
  State<ButtonCommon<T>> createState() => _ButtonCommonState<T>();
}

class _ButtonCommonState<T extends XItem> extends State<ButtonCommon<T>>
    with CompletableMixin {
  late final commonCubit = context.read<XCommonCubit<T>>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<XCommonCubit<T>, XCommonState>(
      listener: onEventReceived,
      buildWhen: (_, state) => state is InitializingXCommonState,
      builder: (context, state) {
        final item = commonCubit.x;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                item.itemHasLiked
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        icon: toSvgIcon(
                          icon: Assets.iconsLike,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          commonCubit.unLikeItem();
                        },
                      )
                    : IconButton(
                        padding: EdgeInsets.zero,
                        icon: toSvgIcon(
                          icon: Assets.iconsLike,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          commonCubit.likeItem();
                        },
                      ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: toSvgIcon(
                    icon: Assets.iconsComment,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: widget.canComment
                      ? () => context
                          .read<ActionCommentBaseCubit<XCommonCubit<T>>>()
                          .set(null)
                      : null,
                ),
              ],
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: toSvgIcon(
                icon: Assets.iconsShare,
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
    } else if (state is ShareItemSuccessState) {
      await Share.share(state.shareLink);
    } else if (state is XErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
