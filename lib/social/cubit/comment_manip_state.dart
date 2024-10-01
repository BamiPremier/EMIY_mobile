part of 'comment_manip_cubit.dart';

mixin CommentManipState on Equatable {}

class InitializingCommentManipState extends CubitSuccessState
    with CommentManipState {
  final Comment comment;

  const InitializingCommentManipState(this.comment);

  @override
  List<Object?> get props => [comment];
}

class CommentManipLoadingState extends CubitLoadingState
    with CommentManipState {
  const CommentManipLoadingState() : super();
}

class LikeCommentSuccesState extends CubitInformationState
    with CommentManipState {
  LikeCommentSuccesState();
}

class CommentCommentSuccesState extends CubitInformationState
    with CommentManipState {
  CommentCommentSuccesState();
}

class CommentManipErrorState extends CubitErrorState with CommentManipState {
  CommentManipErrorState(super.error, [super.trace]);
}

class SeeCommentResponsState extends CubitLoadingState with CommentManipState {
  SeeCommentResponsState();
}

class UnSeeCommentResponsState extends CubitInformationState
    with CommentManipState {
  UnSeeCommentResponsState();
}
