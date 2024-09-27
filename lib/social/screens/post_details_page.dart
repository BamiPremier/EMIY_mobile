import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:umai/social/model/post_response.dart';
import 'package:umai/social/widget/post_social_card.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class PostDetailsPage extends StatefulWidget {
  final Post post;

  const PostDetailsPage({required this.post});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(.3),
        foregroundColor: Colors.white.withOpacity(.3),
        elevation: 0,
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: NetworkImage(widget.post.postImage),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        //     child: Container(
        //       color: Colors.black.withOpacity(0.2),
        //     ),
        //   ),
        // ),
      ),
      body: ListView(
        children: [
          // Post principal
          PostSocialCard(
            post: widget.post,
          ),
          // SizedBox(height: 16),

          // Commentaires
          _buildCommentSection(
              context,
              'Hari Randoll',
              'Il y a 18h',
              'Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.',
              6),
          _buildCommentSection(
              context,
              'Hari Randoll',
              'Il y a 18h',
              'Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.',
              4),
          _buildCommentSection(
              context,
              'Hari Randoll',
              'Il y a 18h',
              'Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.Lorem ipsum dolor sit amet consectetur. Tristique curabitur massa dui.',
              1),
        ],
      ),
    );
  }

  Widget _buildCommentSection(BuildContext context, String username,
      String time, String comment, int responses) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: ThemeApp.grey, width: 0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(top: 8.0)
                .add(const EdgeInsets.symmetric(horizontal: 16.0)),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Lien de l'avatar
            ),
            title: Text(username),
            subtitle: null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ThemeApp.grey,
                      ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    // Gérer les options de chaque commentaire
                  },
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context) {
                    return ['Copier', 'Signaler', 'Supprimer']
                        .map((String choice) {
                      return PopupMenuItem<String>(
                        padding: const EdgeInsets.only(right: 48.0, left: 16.0),
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(comment),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  TextButton(
                    onPressed: () {
                      // Action pour répondre
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      textStyle:
                          Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: ThemeApp.primaryRed,
                              ),
                    ),
                    child: Text(
                      'J\'aime',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ThemeApp.primaryRed,
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Action pour répondre
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      textStyle: Theme.of(context).textTheme.labelSmall,
                    ),
                    child: const Text('répondre'),
                  )
                ]),
                TextButton(
                  onPressed: () {
                    // Afficher les réponses
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    textStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  child: Text('voir $responses réponses'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
