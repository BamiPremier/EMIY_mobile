// import 'package:flutter/material.dart';
// import 'package:potatoes/libs.dart';
// import 'package:umai/animes/bloc/action_comment_episode_cubit.dart';
// import 'package:umai/animes/bloc/comment_episode_cubit.dart';
// import 'package:umai/social/bloc/action_comment_cubit.dart';
// import 'package:umai/utils/themes.dart';

// class ActionCommentEpisode extends StatefulWidget {
//   const ActionCommentEpisode({super.key});

//   @override
//   State<ActionCommentEpisode> createState() => _ActionCommentEpisodeState();
// }

// class _ActionCommentEpisodeState extends State<ActionCommentEpisode> {
//   late final commentEpisodeCubit = context.read<CommentEpisodeCubit>();

//   late final comment = commentEpisodeCubit.comment;

//   @override
//   void dispose() {
//     // loadCommentEpisodeCubit.close();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CommentEpisodeCubit, CommentEpisodeState>(
//         builder: (context, state) {
//       return Padding(
//         padding: const EdgeInsets.only(right: 16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(children: [
//               commentEpisodeCubit.comment.hasLiked
//                   ? TextButton(
//                       onPressed: () => commentEpisodeCubit.unLikeComment(),
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         textStyle:
//                             Theme.of(context).textTheme.labelSmall!.copyWith(
//                                   color: AppTheme.primaryRed,
//                                 ),
//                       ),
//                       child: Text(
//                         'J\'aime',
//                         style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                               color: AppTheme.primaryRed,
//                             ),
//                       ),
//                     )
//                   : TextButton(
//                       onPressed: () => commentEpisodeCubit.likeComment(),
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                       ),
//                       child: Text('J\'aime',
//                           style: Theme.of(context).textTheme.labelSmall!),
//                     ),
//               TextButton(
//                 onPressed: () {
//                   context.read<ActionCommentEpisodeCubit>().set(comment);
//                 },
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.zero,
//                   textStyle: Theme.of(context).textTheme.labelSmall,
//                 ),
//                 child: const Text('répondre'),
//               )
//             ]),
//             if (comment.commentResponsesCount != 0)
//               TextButton(
//                 onPressed: () {
//                   commentEpisodeCubit.seeResponse();
//                 },
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.zero,
//                   textStyle: Theme.of(context).textTheme.labelSmall,
//                 ),
//                 child: Text((state is SeeCommentEpisodeResponseState)
//                     ? 'voir moins'
//                     : 'voir ${comment.commentResponsesCount} réponse${comment.commentResponsesCount > 1 ? 's' : ''}'),
//               ),
//           ],
//         ),
//       );
//     });
//   }
// }
