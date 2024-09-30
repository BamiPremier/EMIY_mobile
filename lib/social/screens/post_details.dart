import 'package:flutter/material.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/widget/post_social_card_second.dart';
import 'package:umai/utils/themes.dart';

class PostDetailsScreen extends StatefulWidget {
  final Post post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(.3),
        foregroundColor: Colors.white.withOpacity(.3),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          // Post principal
          // TODO ramener le contenu de ce widget ici, puisque utilisé une seule fois
          PostSocialCardSecond(
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
        side: BorderSide(color: AppTheme.grey, width: 0.3),
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
                        color: AppTheme.grey,
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
                                color: AppTheme.primaryRed,
                              ),
                    ),
                    child: Text(
                      'J\'aime',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppTheme.primaryRed,
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
