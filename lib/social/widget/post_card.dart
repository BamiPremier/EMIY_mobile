import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            title: Text(username),
          ),
          const SizedBox(height: 8),
          Text(postText),
          if (postImage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.network(postImage),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: const Icon(Icons.favorite_border), onPressed: () {}),
              IconButton(icon: const Icon(Icons.comment), onPressed: () {}),
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
