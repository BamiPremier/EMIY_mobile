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

class ActuBtnType3Widget<T extends XItem, C extends XCommonCubit<T>,
    A extends ActionCommentBaseCubit<C>> extends StatefulWidget {
  final A actionCommentBaseCubit;
  final VoidCallback onPressed;
  ActuBtnType3Widget(
      {super.key, required this.onPressed, required this.actionCommentBaseCubit});

  @override
  _ActuBtnType3WidgetState<T, C, A> createState() =>
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
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  commentCubit.comment.hasLiked
                      ? TextButton(
                          onPressed: () => commentCubit.unLikeComment(),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: AppTheme.primaryRed,
                                ),
                          ),
                          child: Text(
                            'J\'aime',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
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
                    onPressed:   widget.onPressed,
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
        ));
  }
}
