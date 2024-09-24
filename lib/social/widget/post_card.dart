import 'package:flutter/material.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String userImage;
  final String postText;
  final String postImage;
  final Color backgroundColor;

  const PostCard({
    super.key,
    required this.username,
    required this.userImage,
    required this.postText,
    required this.postImage,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 0.0),
                  leading: const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(Assets.avatar),
                  ),
                  title: Text(
                    username,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    'Il y a 10h',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: ThemeApp.grey),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  postText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Image.network(
                'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
                height: 368,
                width: double.infinity,
                fit: BoxFit.cover,
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    child: child,
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    height: 368,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.tertiary,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
