import 'package:flutter/material.dart';
import 'package:umai/utils/app_dimension.dart';
import 'package:umai/utils/themes.dart';

class UserProfileItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final VoidCallback onFollowPressed;

  const UserProfileItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.onFollowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Text(name, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(
        description,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Chip(
        label: Text('Suivre', style: Theme.of(context).textTheme.labelLarge),
        avatar: Icon(Icons.add, color: ThemeApp.mainText),
        backgroundColor: ThemeApp.primaryYellow,
        deleteIcon: const SizedBox.shrink(),
        onDeleted: () {},
      ),
    );
  }
}
