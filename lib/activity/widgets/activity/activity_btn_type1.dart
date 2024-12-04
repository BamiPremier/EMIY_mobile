import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:share_plus/share_plus.dart';

class ActivityBtnType1Widget<T extends XItem> extends StatefulWidget {
  const ActivityBtnType1Widget({
    required this.onPressed,
    super.key,
  });
  final VoidCallback onPressed;

  @override
  State<ActivityBtnType1Widget<T>> createState() =>
      _ActivityBtnType1WidgetState<T>();
}

class _ActivityBtnType1WidgetState<T extends XItem>
    extends State<ActivityBtnType1Widget<T>> with CompletableMixin {
  late final commonCubit = context.read<XCommonCubit<T>>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<XCommonCubit<T>, XCommonState>(
      listener: onEventReceived,
      buildWhen: (_, state) => state is InitializingXCommonState,
      builder: (context, state) {
        final item = commonCubit.x;
        return Container(
            margin: const EdgeInsets.only(left: 8, right: 16.0),
            child: Row(
              children: [
                Text(
                  '${item.itemLikesCount != 0 ? item.itemLikesCount : ''}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: item.itemHasLiked
                            ? Theme.of(context).colorScheme.tertiary
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                IconButton(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  
                  icon: toSvgIcon(
                    icon: Assets.iconsLike,
                    color: item.itemHasLiked
                        ? Theme.of(context).colorScheme.tertiary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    item.itemHasLiked
                        ? commonCubit.unLikeItem()
                        : commonCubit.likeItem();
                  },
                ),
                IconButton(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  icon: toSvgIcon(
                    icon: Assets.iconsComment,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: widget.onPressed,
                ),
                const Spacer(),
                IconButton(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  icon: toSvgIcon(
                    icon: Assets.iconsShare,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () => commonCubit.shareItem(),
                ),
              ],
            ));
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
