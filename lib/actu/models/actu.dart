import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/common/bloc/repport_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/utils/datetime_converter.dart';

part 'actu.freezed.dart';
part 'actu.g.dart';

@freezed
class Actu with _$Actu {
  const Actu._();
  const factory Actu({
    required String id,
    required String content,
    String? image,
    @JsonKey(name: 'has_liked') @Default(false) bool hasLiked,
    @JsonKey(name: 'comments_count') @Default(0) int commentsCount,
    required User user,
    @Default(false) bool reported,
    @JsonKey(name: 'created_at')
    @DateTimeConverter()
    required DateTime createdAt,
  }) = _Actu;

  factory Actu.fromJson(Map<String, dynamic> json) => _$ActuFromJson(json);
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
