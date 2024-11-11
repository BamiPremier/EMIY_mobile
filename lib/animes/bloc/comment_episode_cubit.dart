// import 'package:potatoes/libs.dart';
// import 'package:potatoes/potatoes.dart';
// import 'package:umai/social/model/comment.dart';

// import 'package:umai/animes/services/anime_service.dart';
// import 'package:umai/animes/services/episode_service.dart';

// part 'comment_episode_state.dart';

// class CommentEpisodeCubit extends ObjectCubit<Comment, CommentEpisodeState> {
//   final EpisodeService episodeService;

//   CommentEpisodeCubit(this.episodeService, Comment comment)
//       : super(InitializingCommentEpisodeState(comment));

//   @override
//   Comment? getObject(CommentEpisodeState state) {
//     if (state is InitializingCommentEpisodeState) {
//       return state.comment;
//     }
//     return null;
//   }

//   Comment get comment {
//     final comment = getObject(state) ?? object;

//     if (comment != null) return comment;
//     throw UnsupportedError(
//         'cannot retrieve comment: Current state is ${state.runtimeType}');
//   }

//   @override
//   void update(Comment object) {
//     emit(InitializingCommentEpisodeState(object));
//   }

//   void seeResponse() {
//     if (state is SeeCommentEpisodeResponseState) {
//       emit(UnSeeCommentEpisodeResponseState());
//     } else {
//       emit(SeeCommentEpisodeResponseState());
//     }
//   }

//   void likeComment() {
//     final stateBefore = state;
//     var newCommentEpisode = comment.copyWith(hasLiked: !comment.hasLiked);

//     update(newCommentEpisode);
//     episodeService
//         .likeComment(
//       commentId: comment.id,
//     )
//         .then((updatecomment) {}, onError: (error, trace) {
//       emit(CommentEpisodeErrorState(error, trace));
//       emit(stateBefore);
//     });
//   }

//   void unLikeComment() {
//     final stateBefore = state;
//     var newCommentEpisode = comment.copyWith(hasLiked: !comment.hasLiked);
//     update(newCommentEpisode);
//     episodeService
//         .unLikeComment(
//       commentId: comment.id,
//     )
//         .then((updatecomment) {}, onError: (error, trace) {
//       emit(CommentEpisodeErrorState(error, trace));
//       emit(stateBefore);
//     });
//   }

//   reset() {
//     update(comment);
//   }

//   void report({required String reason}) {
//     if (state is InitializingCommentEpisodeState) {
//       final stateBefore = state;
//       emit(const SendCommentEpisodeRepportLoadingState());
//       episodeService
//           .reportComment(
//         commentId: comment.id,
//         reason: reason,
//       )
//           .then((_) {
//         emit(SuccessSendCommentEpisodeRepportState(comment));
//       }, onError: (error, trace) {
//         emit(CommentEpisodeErrorState(error, trace));
//         emit(stateBefore);
//       });
//     }
//   }
// }
