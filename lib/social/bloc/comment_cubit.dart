import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/services/social_service.dart';

part 'comment_state.dart';

class CommentCubit extends ObjectCubit<Comment, CommentState> {
  final SocialService socialService;

  CommentCubit(this.socialService, Comment comment)
      : super(InitializingCommentState(comment));

  @override
  Comment? getObject(CommentState state) {
    if (state is InitializingCommentState) {
      return state.comment;
    }
    return null;
  }

  Comment get comment {
    final comment = getObject(state) ?? object;

    if (comment != null) return comment;
    throw UnsupportedError(
        'cannot retrieve comment: Current state is ${state.runtimeType}');
  }

  @override
  void update(Comment object) {
    emit(InitializingCommentState(object));
  }

  void seeResponse() {
    
    if (state is SeeCommentResponseState) {
      emit(UnSeeCommentResponseState());
    } else {
      emit(SeeCommentResponseState());
    }
    
  }

  void likeComment() {
    final stateBefore = state;
    var newComment = comment!.copyWith(hasLiked: !comment!.hasLiked);
    print(newComment.toJson());
    update(newComment);
    socialService
        .likeComment(
      commentId: comment!.id,
    )
        .then((updatecomment) {}, onError: (error, trace) {
      emit(CommentErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void unLikeComment() {
    final stateBefore = state;
    var newComment = comment!.copyWith(hasLiked: !comment!.hasLiked);
    update(newComment);
    socialService
        .unLikeComment(
      commentId: comment!.id,
    )
        .then((updatecomment) {}, onError: (error, trace) {
      emit(CommentErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void signalerComment() {
    final stateBefore = state;
    var newComment = comment!.copyWith(hasLiked: !comment!.hasLiked);
    update(newComment);
    socialService
        .signalerComment(
      commentId: comment!.id,
      reason: 'reason',
    )
        .then((updatecomment) {}, onError: (error, trace) {
      emit(CommentErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
