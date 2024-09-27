import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/utils/themes.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      leading: CachedNetworkImage(
        // imageUrl: user.imageFull!,
      
        imageUrl:
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx55-uG26UwIxEJkJ.png",
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 28,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) => const CircleAvatar(
          radius: 28,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        errorWidget: (context, url, error) => const CircleAvatar(
          radius: 28,
          child: Icon(Icons.person, size: 28, color: Colors.white),
        ),
      ),
      title: Text(
        user.username,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${user.animesViewedCount} animes • ${user.followingCount} suivent',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: !user.followed
          ? ElevatedButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppTheme.mainText,
                    ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  const SizedBox(width: 8),
                  Text(
                    'Suivre',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppTheme.mainText,
                        ),
                  ),
                ],
              ),
            )
          : ElevatedButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check),
                  const SizedBox(width: 8),
                  Text(
                    'Suivi(e)',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer),
                  ),
                ],
              ),
            ),
    );
  }
}
