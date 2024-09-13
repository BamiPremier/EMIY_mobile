import 'package:flutter/material.dart';
import 'package:umai/auth/models/follower_response.dart';
import 'package:umai/utils/themes.dart';

class UserProfileItem extends StatelessWidget {
  final FollowerResponse user;
  final Function onFollowPressed;

  const UserProfileItem({
    super.key,
    required this.user,
    required this.onFollowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: const CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage('imageUrl'),
      ),
      title: Text('name', style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(
        'description',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Chip(
          label: Text('Suivre', style: Theme.of(context).textTheme.labelLarge),
          avatar: const Icon(Icons.add, color: ThemeApp.mainText),
          backgroundColor: ThemeApp.primaryYellow,
          deleteIcon: const SizedBox.shrink(),
          onDeleted: () => onFollowPressed()),
    );
  }
}
