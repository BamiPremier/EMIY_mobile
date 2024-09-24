import 'package:flutter/material.dart';
import 'package:umai/social/widget/post_card.dart';

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        PostCard(
          username: 'Hari Randoll',
          userImage: 'https://via.placeholder.com/50',
          postText:
              'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
          postImage: 'https://via.placeholder.com/300',
          backgroundColor: Colors.white,
        ),
        PostCard(
          username: 'Hari Randoll',
          userImage: 'https://via.placeholder.com/50',
          postText:
              'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
          postImage: 'https://via.placeholder.com/300',
          backgroundColor: Colors.white,
        ),
        PostCard(
          username: 'Hari Randoll',
          userImage: 'https://via.placeholder.com/50',
          postText:
              'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
          postImage: 'https://via.placeholder.com/300',
          backgroundColor: Colors.white,
        ),
        PostCard(
          username: 'Hari Randoll',
          userImage: 'https://via.placeholder.com/50',
          postText:
              'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
          postImage: 'https://via.placeholder.com/300',
          backgroundColor: Colors.white,
        ),
        PostCard(
          username: 'Hari Randoll',
          userImage: 'https://via.placeholder.com/50',
          postText:
              'Lorem ipsum dolor sit amet consectetur. Odio ornare malesuada non et dignissim erat leo amet aliquet.',
          postImage: 'https://via.placeholder.com/300',
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
