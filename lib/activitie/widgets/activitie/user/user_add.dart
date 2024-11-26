import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type1.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type3.dart';
import 'package:umai/activitie/widgets/activitie/actu_head.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/item_user.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class UserAddWidget extends StatelessWidget {
  final String targetEntity;

  static Widget get(
      {required BuildContext context,
      required User user,
      required String targetEntity}) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child: UserAddWidget._(targetEntity: targetEntity),
    );
  }

  const UserAddWidget._({required this.targetEntity});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          final personCubit = context.read<PersonCubit>();
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActuHeadWidget.get(
                    targetEntity: targetEntity,
                    context: context,
                    user: personCubit.user),
                const SizedBox(height: 8),
                Container(
                    padding: const EdgeInsets.all(8)
                        .add(const EdgeInsets.only(left: 8)),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(8)),
                    child:
                        UserItem.get(context: context, user: personCubit.user)),
              ],
            ),
          );
        });
  }
}
