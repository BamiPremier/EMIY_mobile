import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/services/social_service.dart';

part 'comment_manip_state.dart';

class CommentManipCubit extends ObjectCubit<Comment, CommentManipState> {
  final SocialService socialService;

  CommentManipCubit(this.socialService, Comment comment)
      : super(InitializingCommentManipState(comment));

  @override
  Comment? getObject(CommentManipState state) {
    if (state is InitializingCommentManipState) {
      return state.comment;
    }
    return null;
  }

  Comment? get comment {
    final comment = getObject(state) ?? object;

    if (comment != null) return comment;
    throw UnsupportedError(
        'cannot retrieve comment: Current state is ${state.runtimeType}');
  }

  @override
  void update(Comment object) {
    emit(InitializingCommentManipState(object));
  }

  void seeResponse() {
    if (state is SeeCommentResponsState) {
      emit(UnSeeCommentResponsState());
    }
    if (state is UnSeeCommentResponsState) {
      emit(SeeCommentResponsState());
    }
  }

  void likeComment() {
    final stateBefore = state;
    var newComment = comment!.copyWith(hasLiked: !comment!.hasLiked);
    update(newComment);
    socialService
        .likeComment(
      commentId: comment!.id,
    )
        .then((updatecomment) {}, onError: (error, trace) {
      emit(CommentManipErrorState(error, trace));
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
      emit(CommentManipErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void deleteComment() {
    final stateBefore = state;
    var newComment = comment!.copyWith(hasLiked: !comment!.hasLiked);
    update(newComment);
    socialService
        .deleteComment(
      commentId: comment!.id,
    )
        .then((updatecomment) {}, onError: (error, trace) {
      emit(CommentManipErrorState(error, trace));
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
      emit(CommentManipErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void responseComment() {
    final stateBefore = state;

    emit(const CommentManipLoadingState());
    socialService.commentComment(commentId: comment!.id).then((updatecomment) {
      emit(CommentCommentSuccesState());
      update(updatecomment);
    }, onError: (error, trace) {
      emit(CommentManipErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
