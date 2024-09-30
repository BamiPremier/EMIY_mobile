import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/common/models/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String content,
    String? image,
    @JsonKey(name: 'has_liked') @Default(false) bool hasLiked,
    @JsonKey(name: 'comments_count') @Default(0) int commentsCount,
    required User user,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
