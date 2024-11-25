import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/utils/datetime_converter.dart';

part 'activitie.freezed.dart';
part 'activitie.g.dart';

@freezed
class Activitie with _$Activitie {
  const Activitie._();

  const factory Activitie({
    required String id,
    required User user,
    @JsonKey(name: 'created_at')
    @DateTimeConverter()
    required DateTime createdAt,
    required bool isPrivate,
    @JsonKey(name: 'target_entity') required String targetEntity,
    required dynamic target,
    dynamic subTarget,
  }) = _Activitie;

  factory Activitie.fromJson(Map<String, dynamic> json) =>
      _$ActivitieFromJson(json);
}

abstract class TargetEntity {
  static const posts = "POSTS";
  static const postLikes = "POST_LIKES";
  static const postComments = "POST_COMMENTS";
  static const postReports = "POST_REPORTS";
  static const follows = "FOLLOWS";
  static const userBlocked = "USER_BLOCKED";
  static const animesVieweds = "ANIMES_VIEWEDS";
  static const watchlists = "WATCHLISTS";
  static const quizzes = "QUIZZES";
  static const participations = "PARTICIPATIONS";
  static const quizReports = "QUIZ_REPORTS";
  static const episodeComments = "EPISODE_COMMENTS";
  static const episodeLikes = "EPISODE_LIKES";
  static const eventLikes = "EVENT_LIKES";
  static const eventReports = "EVENT_REPORTS";
  static const unknown = "UNKNOWN";
}
