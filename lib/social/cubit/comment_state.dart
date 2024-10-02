part of 'comment_cubit.dart';

mixin CommentState on Equatable {}

class InitializingCommentState extends CubitSuccessState with CommentState {
  final Comment comment;

  const InitializingCommentState(this.comment);

  @override
  List<Object?> get props => [comment];
}

class CommentLoadingState extends CubitLoadingState with CommentState {
  const CommentLoadingState() : super();
}

class LikeCommentSuccesState extends CubitInformationState with CommentState {
  LikeCommentSuccesState();
}

class CommentCommentSuccesState extends CubitInformationState
    with CommentState {
  CommentCommentSuccesState();
}

class CommentErrorState extends CubitErrorState with CommentState {
  CommentErrorState(super.error, [super.trace]);
}

class SeeCommentResponseState extends CubitLoadingState with CommentState {
  SeeCommentResponseState();
}

class UnSeeCommentResponseState extends CubitInformationState
    with CommentState {
  UnSeeCommentResponseState();
}

class SelectCommentState extends CubitLoadingState with CommentState {
  final Comment comment;

  const SelectCommentState(this.comment);

  @override
  List<Object?> get props => [comment];
}
