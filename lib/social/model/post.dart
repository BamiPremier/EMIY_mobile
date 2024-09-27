import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/common/models/user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String content,
    String? image,
    @JsonKey(name: 'has_liked') @Default(false) bool hasLiked,
    @JsonKey(name: 'comments_count') @Default(0) int commentsCount,
    required User user,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
