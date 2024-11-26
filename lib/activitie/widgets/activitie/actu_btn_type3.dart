import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class ActuBtnType3Widget<T extends XItem, C extends XCommonCubit<T>, A extends ActionCommentBaseCubit<C>> extends StatelessWidget {
  final A actionCommentBaseCubit;

  const ActuBtnType3Widget({Key? key, required this.actionCommentBaseCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentCubit = context.read<CommentCubit<T>>();
    final comment = commentCubit.comment;

    return BlocBuilder<CommentCubit<T>, CommentState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              comment.hasLiked
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
                onPressed: () {
                  actionCommentBaseCubit.set(comment);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                child: const Text('répondre'),
              )
            ]),
          ],
        );
      },
    );
  }
}
