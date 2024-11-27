import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart'; 
import 'package:umai/common/screens/common_details.dart'; 
import 'package:umai/utils/themes.dart'; 

class ActuBtnType3Widget<T extends XItem, C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>> extends StatefulWidget {
  final A actionCommentBaseCubit;
  final VoidCallback onPressed;
  const ActuBtnType3Widget(
      {super.key,
      required this.onPressed,
      required this.actionCommentBaseCubit});

  @override
  State<ActuBtnType3Widget<T, C, A>> createState() =>
      _ActuBtnType3WidgetState<T, C, A>();
}

class _ActuBtnType3WidgetState<T extends XItem, C extends XCommonCubit<T>,
        A extends ActionCommentBaseCubit<C>>
    extends State<ActuBtnType3Widget<T, C, A>> {
  late final commentCubit = context.read<CommentCubit<T>>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: commentCubit,
        child: BlocBuilder<CommentCubit<T>, CommentState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: [
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
                          'J\'aime',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
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
              ]),
            );
          },
        ));
  }
}
