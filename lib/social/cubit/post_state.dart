part of 'post_cubit.dart';

mixin PostState on Equatable {}

class InitializingPostState extends CubitSuccessState with PostState {
  final Post post;

  const InitializingPostState(this.post);

  @override
  List<Object?> get props => [post];
}

class PostLoadingState extends CubitLoadingState with PostState {
  const PostLoadingState() : super();
}

class LikePostSuccesState extends CubitInformationState with PostState {
  LikePostSuccesState();
}

class CommentPostSuccesState extends CubitInformationState with PostState {
  final Comment comment;

  const CommentPostSuccesState(this.comment);

  @override
  List<Object?> get props => [comment];
}

class PostErrorState extends CubitErrorState with PostState {
  PostErrorState(super.error, [super.trace]);
}
