import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_response.freezed.dart';
part 'post_response.g.dart';

@freezed
class PostResponse with _$PostResponse {
  const factory PostResponse({
    @Default(0) int page,
    @Default(0) int size,
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
    String? image,
    @JsonKey(name: 'is_me_liked') @Default(false) bool isMeLiked,
    @JsonKey(name: 'nb_comments') @Default(0) int nbComments,
    required User user,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required String id,
    required String username,
    String? usertag,
    required String type,
    required String status,
    String? biography,
    String? image,
    @JsonKey(name: 'image_full') String? imageFull,
    @JsonKey(name: 'followers_count') @Default(0) int followersCount,
    @JsonKey(name: 'following_count') @Default(0) int followingCount,
    @JsonKey(name: 'animes_viewed_count') @Default(0) int animesViewedCount,
    @JsonKey(name: 'watchlist_count') @Default(0) int watchlistCount,
    @Default(false) bool followed,
    @JsonKey(name: 'is_following_me') @Default(false) bool isFollowingMe,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
