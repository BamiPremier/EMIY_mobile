import 'package:flutter/material.dart'; 
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/action_comment_episode_cubit.dart'; 

class ButtonEpisode extends StatefulWidget {
  const ButtonEpisode({
    super.key,
  });

  @override
  State<ButtonEpisode> createState() => _ButtonEpisodeState();
}

class _ButtonEpisodeState extends State<ButtonEpisode> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.chat_bubble_outline,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                context.read<ActionCommentEpisodeCubit>().set(null);
              },
            ),
          ],
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.share,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
