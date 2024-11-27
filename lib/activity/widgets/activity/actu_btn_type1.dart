import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart'; 
import 'package:potatoes/common/widgets/loaders.dart'; 
import 'package:umai/common/bloc/common_cubit.dart'; 
import 'package:umai/common/screens/common_details.dart'; 
import 'package:umai/utils/dialogs.dart';
import 'package:share_plus/share_plus.dart';

class ActuBtnType1Widget<T extends XItem> extends StatefulWidget {
  const ActuBtnType1Widget({
    required this.onPressed,
    super.key,
  });
  final VoidCallback onPressed;

  @override
  State<ActuBtnType1Widget<T>> createState() => _ActuBtnType1WidgetState<T>();
}

class _ActuBtnType1WidgetState<T extends XItem>
    extends State<ActuBtnType1Widget<T>> with CompletableMixin {
  late final commonCubit = context.read<XCommonCubit<T>>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<XCommonCubit<T>, XCommonState>(
      listener: onEventReceived,
      buildWhen: (_, state) => state is InitializingXCommonState,
      builder: (context, state) {
        final item = commonCubit.x;
        return Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
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
                  padding: EdgeInsets.zero,
                  icon: toSvgIcon(
                    icon: Assets.iconsComment,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: widget.onPressed,
                ),
                const Spacer(),
                IconButton(
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
