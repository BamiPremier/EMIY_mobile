import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/activity/widgets/activity/activity_head.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/widgets/item_user.dart';

class UserAddWidget extends StatelessWidget {
  final String targetEntity;
  final User targetUser;
  static Widget get(
      {required BuildContext context,
      required User user,
      required User targetUser,
      required String targetEntity}) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child:
          UserAddWidget._(targetEntity: targetEntity, targetUser: targetUser),
    );
  }

  const UserAddWidget._({required this.targetEntity, required this.targetUser});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          final personCubit = context.read<PersonCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityHeadWidget.get(
                  targetEntity: targetEntity,
                  context: context,
                  user: personCubit.user),
              const SizedBox(height: 8),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      borderRadius: BorderRadius.circular(8)),
                  child: UserItem.get(context: context, user: targetUser)),
            ],
          );
        });
  }
}
