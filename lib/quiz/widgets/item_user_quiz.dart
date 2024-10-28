import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/widgets/btn_action_item_user.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/utils/assets.dart';

class UserItemQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final userCubit = context.read<UserCubit>();

    // final personCubit = context.read<PersonCubit>();
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 0.0,
      ),
      leading: const ProfilePicture(
        image:
            "https://dz1j657wnhl0d.cloudfront.net/eyJidWNrZXQiOiJ1bWFpLWFwcC1zdGFnaW5nIiwia2V5IjoicG9zdHNcXDE3NzFtY20xazJ0ajliIiwiZWRpdHMiOnsicmVzaXplIjp7ImZpdCI6ImNvdmVyIiwiaGVpZ2h0Ijo3MjAsIndpZHRoIjo3MjB9fX0=",
        height: 48.0,
        width: 48.0,
      ),
      title: Text("Martin DuChamp",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text('10 points',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.iconMedalFirst,
            height: 20,
            width: 20,
          ),
          Text(
            "4e",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      // onTap: () => (personCubit.user.id == userCubit.user.id)
      //     ? Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => PersonAccountScreen.get(
      //             context: context, user: personCubit.user)))
      //     : null,
    );
  }
}
