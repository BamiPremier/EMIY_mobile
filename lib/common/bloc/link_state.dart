part of 'link_cubit.dart';

mixin LinkState on Equatable {}

class LinkInitial extends CubitSuccessState with LinkState {
  const LinkInitial();

  @override
  List<Object?> get props => [];
}

class LinkLoading extends CubitLoadingState with LinkState {}

class DetectedLink extends CubitInformationState with LinkState {
  DetectedLink();
}

class PostLinkLoaded extends CubitInformationState with LinkState {
  final Post post;
  PostLinkLoaded(this.post);
}

class AnimeLinkLoaded extends CubitInformationState with LinkState {
  final Anime anime;
  AnimeLinkLoaded(this.anime);
}

class EpisodeLinkLoaded extends CubitInformationState with LinkState {
  final Episode episode;
  EpisodeLinkLoaded(this.episode);
}


class QuizLinkLoaded extends CubitInformationState with LinkState {
  final Quiz quiz;
  QuizLinkLoaded(this.quiz);
}
class UserLinkLoaded extends CubitInformationState with LinkState {
  final User user;
  UserLinkLoaded(this.user);
}

class LinkError extends CubitErrorState with LinkState {
  LinkError(super.error, [super.trace]);
}
