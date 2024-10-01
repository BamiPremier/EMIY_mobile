import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/common/models/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required String id,
    required String content,
    @JsonKey(name: 'has_liked') required bool hasLiked,
    @JsonKey(name: 'comment_responses_count')
    required int commentResponsesCount,
    required User user,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
