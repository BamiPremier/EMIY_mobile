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

class SharePostLoadingState extends CubitLoadingState with PostState {
  const SharePostLoadingState() : super();
}

class SharePostSuccesState extends CubitInformationState with PostState {
  final String link;

  const SharePostSuccesState(this.link);

  @override
  List<Object?> get props => [link];
}

class CommentPostSuccesState extends CubitInformationState with PostState {
  final Comment comment;

  const CommentPostSuccesState(this.comment);

  @override
  List<Object?> get props => [comment];
}

class SendRepportLoadingState extends CubitLoadingState with PostState {
  const SendRepportLoadingState() : super();
}

class SuccessSendRepportPostState extends CubitSuccessState with PostState {
  final Post post;

  const SuccessSendRepportPostState(this.post);

  @override
  List<Object?> get props => [post];
}

class PostErrorState extends CubitErrorState with PostState {
  PostErrorState(super.error, [super.trace]);
}
