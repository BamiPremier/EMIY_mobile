import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class ActivityBtnType3Widget<T extends XItem, C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>> extends StatefulWidget {
  final A actionCommentBaseCubit;
  final VoidCallback onPressed;
  const ActivityBtnType3Widget(
      {super.key,
      required this.onPressed,
      required this.actionCommentBaseCubit});

  @override
  State<ActivityBtnType3Widget<T, C, A>> createState() =>
      _ActivityBtnType3WidgetState<T, C, A>();
}

class _ActivityBtnType3WidgetState<T extends XItem, C extends XCommonCubit<T>,
        A extends ActionCommentBaseCubit<C>>
    extends State<ActivityBtnType3Widget<T, C, A>> {
  late final commentCubit = context.read<CommentCubit<T>>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: commentCubit,
      child: BlocConsumer<CommentCubit<T>, CommentState>(
        listener: (context, state) {
          if (state is CommentErrorState) {
            showErrorToast(content: state.error, context: context);
          }
        },
        builder: (context, state) {
          return Row(children: [
            const SizedBox(
              width: 4,
            ),
            commentCubit.comment.hasLiked
                ? TextButton(
                    onPressed: () => commentCubit.unLikeComment(),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      textStyle:
                          Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: AppTheme.primaryRed,
                              ),
                    ),
                    child: Text(
                      '${commentCubit.comment.likesCount != 0 ? commentCubit.comment.likesCount : ''} J\'aime',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppTheme.primaryRed,
                          ),
                    ),
                  )
                : TextButton(
                    onPressed: () => commentCubit.likeComment(),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text('J\'aime',
                        style: Theme.of(context).textTheme.labelSmall!),
                  ),
            TextButton(
              onPressed: widget.onPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                textStyle: Theme.of(context).textTheme.labelSmall,
              ),
              child: const Text('répondre'),
            )
          ]);
        },
      ),
    );
  }
}
