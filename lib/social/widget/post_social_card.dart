import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:umai/social/model/post_response.dart';
import 'package:umai/social/screens/post_details_page.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class PostSocialCard extends StatelessWidget {
  final Post post;

  const PostSocialCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetailsPage(post: post)),
        );
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CachedNetworkImage(
                            imageUrl: post.user.image ?? '',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: imageProvider,
                                )),
                            placeholder: (context, url) => const CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(Assets.user),
                            ),
                            errorWidget: (context, url, error) => Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage(Assets.user),
                              ),
                            ),
                          ),
                          title: Text(
                            post.user.username,
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
                      ),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTapDown: (details) {
                            showContextMenu(
                              context: context,
                              position: details.globalPosition,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: const Icon(Icons.more_vert),
                          ))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.content,
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
                  post.image,
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
      ),
    );
  }

  void showContextMenu({
    required BuildContext context,
    required Offset position,
  }) async {
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx + 1,
        position.dy + 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.white,
      items: <PopupMenuEntry>[
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(right: 48.0, left: 16.0),
          value: 'Signaler',
          textStyle: Theme.of(context).textTheme.bodyLarge,
          child: ListTile(
            title: const Text(
              "Signaler",
            ),
            onTap: () {},
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(right: 48.0, left: 16.0),
          value: 'Supprimer',
          textStyle: Theme.of(context).textTheme.bodyLarge,
          child: ListTile(
            title: const Text("Supprimer"),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
