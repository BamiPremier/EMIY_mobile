import 'package:flutter/material.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/widget/post_image.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class PostSocialCardSecond extends StatelessWidget {
  final Post post;

  const PostSocialCardSecond({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ProfilePicture(
                  image: post.user.image,
                  height: 48.0,
                  width: 48.0,
                ),
                title: Text(
                  post.user.username,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  post.createdAt.elapsed(),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppTheme.grey),
                ),
                trailing: PopupMenuButton<String>(
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
                                color:
                                    Theme.of(context).colorScheme.onSurface),
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
        if (post.image?.isNotEmpty ?? false)
          PostImage(url: post.image!),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.chat_bubble_outline),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
