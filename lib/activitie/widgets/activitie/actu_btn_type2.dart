import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
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

class ActuBtnType2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: toSvgIcon(
            icon: Assets.iconsTick,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () {
            // postCubit.likePost(post);
          },
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: toSvgIcon(
            icon: Assets.iconsBookmark,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () {
            //  postCubit.commentPost(post);
          },
        ),
        const Spacer(),
        IconButton(
          padding: EdgeInsets.zero,
          icon: toSvgIcon(
            icon: Assets.iconsShare,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
