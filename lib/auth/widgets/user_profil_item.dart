import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/models/follower_response.dart';
import 'package:umai/utils/themes.dart';

class UserProfileItem extends StatelessWidget {
  final User user;
  final VoidCallback? onFollowPressed;
  final VoidCallback? onUnFollowPressed;

  const UserProfileItem({
    super.key,
    required this.user,
    required this.onFollowPressed,
    required this.onUnFollowPressed,
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
      ),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 2.4,
          letterSpacing: 0.5),
      subtitle: Text(
        '${user.animesViewedCount} animes • ${user.followingCount} suivent',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitleTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
      trailing: !user.followed
          ? ElevatedButton(
              onPressed: onFollowPressed,
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: ThemeApp.mainText,
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
                          color: ThemeApp.mainText,
                        ),
                  ),
                ],
              ),
            )
          : ElevatedButton(
              onPressed: onUnFollowPressed,
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
