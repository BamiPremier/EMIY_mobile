
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/comment_episode.dart'; 

class ActionCommentEpisodeCubit extends ValueCubit<CommentEpisode?> {
  final EpisodeCubit episodeCubit;
  ActionCommentEpisodeCubit(this.episodeCubit) : super(null);

  void commentEpisode({
    required String content,
  }) {
    episodeCubit.commentEpisode(content: content, targetCommentId: state?.id);
  }
}
