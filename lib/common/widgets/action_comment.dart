import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/utils/themes.dart';

class ActionComment<T extends XItem> extends StatefulWidget {
  final ActionCommentBaseCubit actionCommentBaseCubit;

  const ActionComment({super.key, required this.actionCommentBaseCubit});
  @override
  State<ActionComment<T>> createState() => _ActionCommentState<T>();
}

class _ActionCommentState<T extends XItem> extends State<ActionComment<T>> {
  late final commentCubit = context.read<CommentCubit<T>>();

  @override
  Widget build(BuildContext context) {
    final comment = commentCubit.comment;

    return BlocBuilder<CommentCubit<T>, CommentState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
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
                        '${comment.likesCount != 0 ? comment.likesCount : ''} J\'aime',
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
                      child: Text(
                          '${commentCubit.comment.likesCount != 0 ? commentCubit.comment.likesCount : ''} J\'aime',
                          style: Theme.of(context).textTheme.labelSmall!),
                    ),
              TextButton(
                onPressed: () {
                  widget.actionCommentBaseCubit.set(comment);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                child: const Text('répondre'),
              )
            ]),
            if (comment.commentResponsesCount != 0)
              TextButton(
                onPressed: () {
                  commentCubit.seeResponse();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                child: Text((state is SeeCommentResponseState)
                    ? 'voir moins'
                    : 'voir ${comment.commentResponsesCount} réponse${comment.commentResponsesCount > 1 ? 's' : ''}'),
              ),
          ],
        ),
      );
    });
  }
}
