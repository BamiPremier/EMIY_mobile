// part of 'episode_cubit.dart';

// mixin EpisodeState on Equatable {}

// class InitializingXCommonState extends CubitSuccessState with EpisodeState {
//   final Episode episode;

//   const InitializingXCommonState(this.episode);

//   @override
//   List<Object?> get props => [episode];
// }

// class EpisodeLoadingState extends CubitLoadingState with EpisodeState {
//   const EpisodeLoadingState() : super();
// }

// class LikeEpisodeSuccesState extends CubitInformationState with EpisodeState {
//   LikeEpisodeSuccesState();
// }

// class ShareEpisodeLoadingState extends CubitLoadingState with EpisodeState {
//   const ShareEpisodeLoadingState() : super();
// }

// class ShareEpisodeSuccesState extends CubitInformationState with EpisodeState {
//   final String link;

//   const ShareEpisodeSuccesState(this.link);

//   @override
//   List<Object?> get props => [link];
// }

// class CommentEpisodeSuccesState extends CubitInformationState
//     with EpisodeState {
//   final CommentEpisode comment;

//   const CommentEpisodeSuccesState(this.comment);

//   @override
//   List<Object?> get props => [comment];
// }

// class SendRepportLoadingState extends CubitLoadingState with EpisodeState {
//   const SendRepportLoadingState() : super();
// }

// class SuccessSendRepportEpisodeState extends CubitSuccessState
//     with EpisodeState {
//   final Episode episode;

//   const SuccessSendRepportEpisodeState(this.episode);

//   @override
//   List<Object?> get props => [episode];
// }

// class EpisodeErrorState extends CubitErrorState with EpisodeState {
//   EpisodeErrorState(super.error, [super.trace]);
// }
