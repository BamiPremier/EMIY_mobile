import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_response.freezed.dart';
part 'post_response.g.dart';

@freezed
class PostResponse with _$PostResponse {
  const factory PostResponse({
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int nextPage,
    @Default(0) int previousPage,
    @Default(0) int total,
    @Default([]) List<Post> content,
  }) = _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String content,
    required String image,
    @Default(false) bool isMeLiked,
    @Default(0) int nbComments,
    required User user,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String id,
    required String email,
    required String type,
    required String status,
    required String username,
    required String usertag,
    required String biography,
    String? image,
    String? imageFull,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
