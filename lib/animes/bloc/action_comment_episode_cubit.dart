// import 'package:potatoes/potatoes.dart' hide PreferencesService;
// import 'package:umai/animes/bloc/episode_cubit.dart';
// import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
// import 'package:umai/social/model/comment.dart'; 

// class ActionCommentEpisodeCubit extends ValueCubit<Comment?> {
//   final EpisodeCubit episodeCubit;
//   final LoadEpisodeAnimeCubit loadEpisodeAnimeCubit;

//   ActionCommentEpisodeCubit(this.episodeCubit, this.loadEpisodeAnimeCubit)
//       : super(null);

//   void commentEpisode({
//     required String content,
//   }) {
//     episodeCubit.commentEpisode(
//         loadEpisodeAnimeCubit: loadEpisodeAnimeCubit,
//         content: content,
//         targetCommentId: state?.id);
//   }
// }
