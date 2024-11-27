import 'package:freezed_annotation/freezed_annotation.dart'; 
import 'package:umai/common/models/user.dart'; 
import 'package:umai/utils/datetime_converter.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const Activity._();

  const factory Activity({
    required String id,
    required User user,
    @JsonKey(name: 'created_at')
    @DateTimeConverter()
    required DateTime createdAt,
    bool? isPrivate,
    @JsonKey(name: 'target_entity') required String targetEntity,
    required dynamic target,
    @JsonKey(name: 'sub_target') dynamic subTarget,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
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
