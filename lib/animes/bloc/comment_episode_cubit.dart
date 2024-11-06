import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/animes/models/comment_episode.dart';
import 'package:umai/animes/services/anime_service.dart';

part 'comment_episode_state.dart';

class CommentEpisodeCubit extends ObjectCubit<CommentEpisode, CommentEpisodeState> {
  final AnimeService animeService;

  CommentEpisodeCubit(this.animeService, CommentEpisode comment)
      : super(InitializingCommentEpisodeState(comment));

  @override
  CommentEpisode? getObject(CommentEpisodeState state) {
    if (state is InitializingCommentEpisodeState) {
      return state.comment;
    }
    return null;
  }

  CommentEpisode get comment {
    final comment = getObject(state) ?? object;

    if (comment != null) return comment;
    throw UnsupportedError(
        'cannot retrieve comment: Current state is ${state.runtimeType}');
  }

  @override
  void update(CommentEpisode object) {
    emit(InitializingCommentEpisodeState(object));
  }

  void seeResponse() {
    if (state is SeeCommentEpisodeResponseState) {
      emit(UnSeeCommentEpisodeResponseState());
    } else {
      emit(SeeCommentEpisodeResponseState());
    }
  }

  void likeCommentEpisode() {
    final stateBefore = state;
    // var newCommentEpisode = comment.copyWith(hasLiked: !comment.hasLiked);

    // update(newCommentEpisode);
    // animeService
    //     .likeCommentEpisode(
    //   commentId: comment.id,
    // )
    //     .then((updatecomment) {}, onError: (error, trace) {
    //   emit(CommentEpisodeErrorState(error, trace));
    //   emit(stateBefore);
    // });
  }

  void unLikeCommentEpisode() {
    // final stateBefore = state;
    // var newCommentEpisode = comment.copyWith(hasLiked: !comment.hasLiked);
    // update(newCommentEpisode);
    // animeService
    //     .unLikeCommentEpisode(
    //   commentId: comment.id,
    // )
    //     .then((updatecomment) {}, onError: (error, trace) {
    //   emit(CommentEpisodeErrorState(error, trace));
    //   emit(stateBefore);
    // });
  }

  reset() {
    update(comment);
  }

  void report({required String reason}) {
    // if (state is InitializingCommentEpisodeState) {
    //   final stateBefore = state;
    //   emit(const SendCommentEpisodeRepportLoadingState());
    //   animeService
    //       .reportCommentEpisode(
    //     commentId: comment.id,
    //     reason: reason,
    //   )
    //       .then((_) {
    //     emit(SuccessSendCommentEpisodeRepportState(comment));
    //   }, onError: (error, trace) {
    //     emit(CommentEpisodeErrorState(error, trace));
    //     emit(stateBefore);
    //   });
    // }
  }
}
