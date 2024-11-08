part of 'comment_episode_cubit.dart';
 
mixin CommentEpisodeState on Equatable {}

class InitializingCommentEpisodeState extends CubitSuccessState
    with CommentEpisodeState {
  final CommentEpisode comment;

  const InitializingCommentEpisodeState(this.comment);

  @override
  List<Object?> get props => [comment];
}

class CommentEpisodeLoadingState extends CubitLoadingState
    with CommentEpisodeState {
  const CommentEpisodeLoadingState() : super();
}

class LikeCommentEpisodeSuccesState extends CubitInformationState
    with CommentEpisodeState {
  LikeCommentEpisodeSuccesState();
}

class CommentEpisodeCommentEpisodeSuccesState extends CubitInformationState
    with CommentEpisodeState {
  CommentEpisodeCommentEpisodeSuccesState();
}

class CommentEpisodeErrorState extends CubitErrorState
    with CommentEpisodeState {
  CommentEpisodeErrorState(super.error, [super.trace]);
}

class SeeCommentEpisodeResponseState extends CubitLoadingState
    with CommentEpisodeState {
  SeeCommentEpisodeResponseState();
}

class UnSeeCommentEpisodeResponseState extends CubitInformationState
    with CommentEpisodeState {
  UnSeeCommentEpisodeResponseState();
}

class SelectCommentEpisodeState extends CubitSuccessState
    with CommentEpisodeState {
  final CommentEpisode comment;

  const SelectCommentEpisodeState(this.comment);

  @override
  List<Object?> get props => [comment];
}

class SendCommentEpisodeRepportLoadingState extends CubitLoadingState
    with CommentEpisodeState {
  const SendCommentEpisodeRepportLoadingState() : super();
}

class SuccessSendCommentEpisodeRepportState extends CubitSuccessState
    with CommentEpisodeState {
  final CommentEpisode comment;

  const SuccessSendCommentEpisodeRepportState(this.comment);

  @override
  List<Object?> get props => [comment];
}
