import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/utils/datetime_converter.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const Notification._();

  const factory Notification({
    required String target,
    @JsonKey(name: "type") required String type,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

abstract class NotificationType {
  static const String follows = 'follows';
  static const String participations = 'participations';
  static const String postLikes = 'post_likes';
  static const String postComments = 'post_comments';
  static const String postCommentLikes = 'post_comment_likes';
  static const String episodeComments = 'episode_comments';
  static const String episodeCommentLikes = 'episode_comment_likes';
}
