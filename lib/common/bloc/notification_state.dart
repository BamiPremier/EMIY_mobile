part of 'notification_cubit.dart';

mixin NotificationState on Equatable {}

class NotificationInitial extends CubitSuccessState with NotificationState {
  const NotificationInitial();

  @override
  List<Object?> get props => [];
}

class NotificationLoading extends CubitLoadingState with NotificationState {}

class DetectedNotification extends CubitInformationState with NotificationState {
  DetectedNotification();
}

class PersonNotificationLoaded extends CubitInformationState with NotificationState {
  final User user;
  PersonNotificationLoaded(this.user);
}

class PostNotificationLoaded extends CubitInformationState with NotificationState {
  final Post post;
  PostNotificationLoaded(this.post);
}

class AnimeNotificationLoaded extends CubitInformationState with NotificationState {
  final Anime anime;
  AnimeNotificationLoaded(this.anime);
}

class EpisodeNotificationLoaded extends CubitInformationState with NotificationState {
  final Episode episode;
  EpisodeNotificationLoaded(this.episode);
}


class QuizNotificationLoaded extends CubitInformationState with NotificationState {
  final Quiz quiz;
  QuizNotificationLoaded(this.quiz);
}
class UserNotificationLoaded extends CubitInformationState with NotificationState {
  final User user;
  UserNotificationLoaded(this.user);
}

class NotificationError extends CubitErrorState with NotificationState {
  NotificationError(super.error, [super.trace]);
}
