// import 'package:flutter/material.dart';
// import 'package:potatoes/libs.dart';
// import 'package:umai/animes/bloc/action_comment_episode_cubit.dart';
// import 'package:umai/animes/bloc/episode_cubit.dart';
// import 'package:umai/common/bloc/common_cubit.dart';
// import 'package:umai/social/model/comment.dart';

// import 'package:umai/common/utils/validators.dart';
// import 'package:umai/utils/themes.dart';

// class CommentEpisodeInput extends StatefulWidget {
//   const CommentEpisodeInput({super.key});

//   @override
//   State<CommentEpisodeInput> createState() => _CommentEpisodeInputState();
// }

// class _CommentEpisodeInputState extends State<CommentEpisodeInput> {
//   final TextEditingController _commentController = TextEditingController();
//   late final episodeCubit = context.read<EpisodeCubit>();

//   final focusNode = FocusNode();
//   @override
//   void dispose() {
//     _commentController.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ActionCommentEpisodeCubit, Comment?>(
//         listener: (context, ystate) {
//           FocusScope.of(context).requestFocus(focusNode);
//         },
//         builder: (context, ystate) => BlocConsumer<EpisodeCubit, XCommonState>(
//             listener: (context, state) {
//               if (state is CommentItemSuccesState) {
//                 setState(() {
//                   _commentController.clear();
//                 });
//               }
//             },
//             builder: (context, state) => SafeArea(
//                   top: false,
//                   minimum: const EdgeInsets.all(16.0),
//                   child: Container(
//                     color: Theme.of(context).colorScheme.surface,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                               style: Theme.of(context).textTheme.bodyMedium,
//                               readOnly: state is XLoadingState ? true : false,
//                               controller: _commentController,
//                               decoration: InputDecoration(
//                                 hintText: (ystate != null)
//                                     ? 'Réponse à ${ystate.user.username}'
//                                     : "Ajouter un commentaire...",
//                                 hintStyle: Theme.of(context)
//                                     .textTheme
//                                     .bodyMedium!
//                                     .copyWith(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onSurfaceVariant,
//                                         overflow: TextOverflow.ellipsis),
//                               ),
//                               keyboardType: TextInputType.text,
//                               textInputAction: TextInputAction.done,
//                               textCapitalization: TextCapitalization.sentences,
//                               focusNode: focusNode,
//                               validator: Validators.empty,
//                               onTapOutside: (_) =>
//                                   FocusScope.of(context).unfocus()),
//                         ),
//                         const SizedBox(width: 8),
//                         IconButton(
//                           padding: EdgeInsets.zero,
//                           icon: CircleAvatar(
//                               backgroundColor: Theme.of(context).primaryColor,
//                               radius: 24,
//                               child: state is XLoadingState
//                                   ? const SizedBox(
//                                       width: 16,
//                                       height: 16,
//                                       child: CircularProgressIndicator(
//                                         strokeWidth: 2,
//                                         color: AppTheme.black,
//                                       ),
//                                     )
//                                   : const Icon(Icons.arrow_upward)),
//                           onPressed: () {
//                             print(_commentController.text);
//                             if (Validators.empty(_commentController.text) ==
//                                 null) {
//                               context
//                                   .read<ActionCommentEpisodeCubit>()
//                                   .commentEpisode(
//                                     content: _commentController.text,
//                                   );
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 )));
//   }
// }
