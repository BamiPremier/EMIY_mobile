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
    bool? isPrivate,
    @JsonKey(name: 'target_entity') required String targetEntity,
    required dynamic target,
    @JsonKey(name: 'sub_target') dynamic subTarget,
  }) = _Activitie;

  factory Activitie.fromJson(Map<String, dynamic> json) =>
      _$ActivitieFromJson(json);
}

abstract class TargetEntity {
  static const posts = "posts";
  static const postLikes = "post_likes";
  static const postComments = "post_comments";
  static const postReports = "post_reports";
  static const follows = "follows";
  static const userBlocked = "user_blocked";
  static const animesVieweds = "animes_vieweds";
  static const watchlists = "watchlists";
  static const quizzes = "quizzes";
  static const participations = "participations";
  static const quizReports = "quiz_reports";
  static const episodeComments = "episode_comments";
  static const episodeLikes = "episode_likes";
  static const eventLikes = "event_likes";
  static const eventReports = "event_reports";
  static const unknown = "unknown";
}
