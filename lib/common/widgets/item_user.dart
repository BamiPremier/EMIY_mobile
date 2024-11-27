import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/widgets/btn_action_item_user.dart';
import 'package:umai/common/widgets/profile_picture.dart';

class UserItem extends StatelessWidget {
  final bool canNavigate;

  static Widget get(
      {required BuildContext context,
      required User user,
      bool canNavigate = true}) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child: UserItem._(canNavigate: canNavigate),
    );
  }

  const UserItem._({this.canNavigate = true});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {},
      builder: (context, state) {
        final userCubit = context.read<UserCubit>();

        final personCubit = context.read<PersonCubit>();
        return GestureDetector(
          child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              leading: ProfilePicture(
                image: personCubit.user.imageFull ?? '',
                size: 48.0,
              ),
              title: Text(personCubit.user.username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge),
              subtitle: Text(
                '${personCubit.user.animesViewedCount} animes • ${personCubit.user.followingCount} suivent',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const BtnActionItemUser()),
          onTap: () => canNavigate && (personCubit.user.id != userCubit.user.id)
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PersonAccountScreen.get(
                      context: context, user: personCubit.user)))
              : null,
        );
      },
    );
  }
}
