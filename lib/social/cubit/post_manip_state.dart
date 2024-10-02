part of 'post_manip_cubit.dart';

mixin PostManipState on Equatable {}

class InitializingPostManipState extends CubitSuccessState with PostManipState {
  final Post post;

  const InitializingPostManipState(this.post);

  @override
  List<Object?> get props => [post];
}

class PostManipLoadingState extends CubitLoadingState with PostManipState {
  const PostManipLoadingState() : super();
}

class LikePostSuccesState extends CubitInformationState with PostManipState {
  LikePostSuccesState();
}

class CommentPostSuccesState extends CubitInformationState with PostManipState {
  final Comment comment;

  const CommentPostSuccesState(this.comment);

  @override
  List<Object?> get props => [comment];
  
}

class PostManipErrorState extends CubitErrorState with PostManipState {
  PostManipErrorState(super.error, [super.trace]);
}
