import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetailsScreen(post: post)),
        );
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CachedNetworkImage(
                      imageUrl: post.user.image ?? '',
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 24,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => SvgPicture.asset(
                        Assets.defaultAvatar,
                        height: 48.0,
                        width: 48.0,
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        Assets.defaultAvatar,
                        height: 48.0,
                        width: 48.0,
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
                          .copyWith(color: AppTheme.grey),
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        // Gérer les options de chaque commentaire
                      },
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context) {
                        return ['Signaler', 'Supprimer'].map((String choice) {
                          return PopupMenuItem<String>(
                            padding:
                                const EdgeInsets.only(right: 48.0, left: 16.0),
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      post.content,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            post.image == null || post.image == '' || post.image!.isEmpty
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.network(
                      post.image ?? '',
                      height: 368,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      frameBuilder: (BuildContext context, Widget child,
                          int? frame, bool wasSynchronouslyLoaded) {
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
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Container(
                          height: 368,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error, color: Colors.red, size: 48),
                                SizedBox(height: 16),
                                Text(
                                  "Erreur de chargement de l'image",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
}
