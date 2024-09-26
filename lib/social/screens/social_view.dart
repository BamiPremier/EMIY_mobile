import 'package:flutter/material.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/widget/post_social_card.dart';
import 'package:umai/utils/themes.dart';

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Post> posts = [
      Post(
        username: 'Hari Randoll',
        userImage: 'https://via.placeholder.com/50',
        postText:
            'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
        postImage:
            'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
      ),
      Post(
        username: 'Hari Randoll',
        userImage: 'https://via.placeholder.com/50',
        postText:
            'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
        postImage:
            'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
      ),
      Post(
        username: 'Hari Randoll',
        userImage: 'https://via.placeholder.com/50',
        postText:
            'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
        postImage:
            'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
      ),
      Post(
        username: 'Hari Randoll',
        userImage: 'https://via.placeholder.com/50',
        postText:
            'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
        postImage:
            'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
      ),
      Post(
        username: 'Hari Randoll',
        userImage: 'https://via.placeholder.com/50',
        postText:
            'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
        postImage:
            'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
      ),
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 32,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ThemeApp.primaryYellow,
          ),
          child: Text(
            'Publication en cours...',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostSocialCard(post: posts[index]);
            },
          ),
        ),
      ],
    );
  }
}
