// import 'package:flutter/material.dart';
// import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
// import 'package:potatoes/libs.dart';
// import 'package:umai/animes/bloc/action_comment_episode_cubit.dart';
// import 'package:umai/animes/bloc/episode_cubit.dart';
// import 'package:umai/animes/bloc/load_comment_episode_cubit.dart';
// import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
// import 'package:umai/social/model/comment.dart';

// import 'package:umai/animes/models/episode.dart';
// import 'package:umai/animes/services/episode_cubit_manager.dart';
// import 'package:umai/animes/widgets/button_episode.dart';
// import 'package:umai/animes/widgets/comment_episode_input.dart';
// import 'package:umai/animes/widgets/episode_head.dart';
// import 'package:umai/animes/widgets/item_comment_episode.dart';

// class EpisodeDetailsScreen extends StatefulWidget {
//   final Episode episode;
//   final LoadEpisodeAnimeCubit loadEpisodeAnimeCubit;
//   static Widget from(
//       {required LoadEpisodeAnimeCubit loadEpisodeAnimeCubit,
//       required BuildContext context,
//       required Episode episode}) {
//     return MultiBlocProvider(
//         providers: [
//           BlocProvider.value(
//               value: context.read<EpisodeCubitManager>().get(episode)),
//           BlocProvider(
//               create: (context) => ActionCommentEpisodeCubit(
//                   context.read<EpisodeCubit>(), loadEpisodeAnimeCubit)),
//           BlocProvider(
//               create: (context) => LoadCommentEpisodeCubit(
//                     context.read(),
//                     episode.id,
//                     '',
//                     loadEpisodeAnimeCubit,
//                     context.read(),
//                   )),
//         ],
//         child: EpisodeDetailsScreen._(
//             episode: episode, loadEpisodeAnimeCubit: loadEpisodeAnimeCubit));
//   }

//   const EpisodeDetailsScreen._(
//       {required this.episode, required this.loadEpisodeAnimeCubit});

//   @override
//   State<EpisodeDetailsScreen> createState() => _EpisodeDetailsScreenState();
// }

// class _EpisodeDetailsScreenState extends State<EpisodeDetailsScreen> {
//   late final loadCommentEpisodeCubit = context.read<LoadCommentEpisodeCubit>();
//   late final episodeCubit = context.read<EpisodeCubit>();
//   @override
//   void dispose() {
//     loadCommentEpisodeCubit.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<EpisodeCubit, EpisodeState>(listener: (context, state) {
//       if (state is CommentEpisodeSuccesState) {
//         loadCommentEpisodeCubit.putFirst(state.comment);
//       }
//     }, builder: (context, state) {
//       return Scaffold(
//           extendBodyBehindAppBar: true,
//           appBar: AppBar(
//             backgroundColor: Colors.white.withOpacity(0.6),
//           ),
//           body: Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   children: [
//                     const EpisodeHead(),
//                     const SizedBox(height: 16),
//                     const Divider(),
//                     const ButtonEpisode(),
//                     const Divider(),
//                     AutoListView.get<CommentEpisode>(
//                         padding: EdgeInsets.zero,
//                         shrinkWrap: true,
//                         autoManage: false,
//                         physics: const NeverScrollableScrollPhysics(),
//                         cubit: loadCommentEpisodeCubit,
//                         itemBuilder: (context, comment) =>
//                             ItemCommentEpisode.get(
//                               idEpisode: episodeCubit.x.id,
//                               context: context,
//                               comment: comment,
//                               loadEpisodeAnimeCubit:
//                                   widget.loadEpisodeAnimeCubit,
//                             ),
//                         emptyBuilder: (context) => const Center(
//                               child: Text("Aucun commentaire"),
//                             ),
//                         loadingBuilder: (context) => Container(
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.all(16),
//                             child: LinearProgressIndicator(
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .onTertiaryContainer,
//                               backgroundColor: Theme.of(context)
//                                   .colorScheme
//                                   .tertiaryContainer,
//                               borderRadius: BorderRadius.circular(30),
//                             )),
//                         loadingMoreBuilder: (context) => Container(
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.all(16),
//                             child: LinearProgressIndicator(
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .onTertiaryContainer,
//                               backgroundColor: Theme.of(context)
//                                   .colorScheme
//                                   .tertiaryContainer,
//                               borderRadius: BorderRadius.circular(30),
//                             )),
//                         errorBuilder: (context, retry) => Center(
//                                 child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 const Text("Une erreur est survenue"),
//                                 TextButton(
//                                   onPressed: retry,
//                                   child: const Text("Réessayer"),
//                                 )
//                               ],
//                             )))
//                   ],
//                 ),
//               ),
//               const CommentEpisodeInput()
//             ],
//           ));
//     });
//   }
// }
