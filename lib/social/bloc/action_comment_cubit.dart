import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/model/comment.dart';

abstract class ActionCommentBaseCubit<C> extends ValueCubit<Comment?> {
  final C cubit;

  ActionCommentBaseCubit(this.cubit) : super(null);

  void comment({required String content});
}

class ActionCommentEpisodeCubit extends ActionCommentBaseCubit<EpisodeCubit> {
  final LoadEpisodeAnimeCubit loadEpisodeAnimeCubit;

  ActionCommentEpisodeCubit(
      EpisodeCubit episodeCubit, this.loadEpisodeAnimeCubit)
      : super(episodeCubit);

  @override
  void comment({required String content}) {
    cubit.commentEpisode(
      loadEpisodeAnimeCubit: loadEpisodeAnimeCubit,
      content: content,
      targetCommentId: state?.id,
    );
  }
}

class ActionCommentCubit extends ActionCommentBaseCubit<PostCubit> {
  ActionCommentCubit(PostCubit postCubit) : super(postCubit);

  @override
  void comment({required String content}) {
    cubit.commentItem(
      content: content,
      targetCommentId: state?.id,
    );
  }
}
