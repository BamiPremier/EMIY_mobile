import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower_response.freezed.dart';
part 'follower_response.g.dart';

@freezed
class FollowerResponse with _$FollowerResponse {
  const factory FollowerResponse({
    required List<User> content,
    required int page,
    required int size,
    required int total,
  }) = _FollowerResponse;

  factory FollowerResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowerResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String usertag,
    String? image,
    @JsonKey(name: 'image_full') String? imageFull,
    String? biography,
    @Default('DEFAULT') String type,
    @Default('ACTIVE') String status,
    @JsonKey(name: 'followers_count') @Default(0) int followersCount,
    @JsonKey(name: 'following_count') @Default(0) int followingCount,
    @JsonKey(name: 'animes_viewed_count') @Default(0) int animesViewedCount,
    @JsonKey(name: 'watchlist_count') @Default(0) int watchlistCount,
    @Default(false) bool followed,
    @JsonKey(name: 'is_following_me') @Default(false) bool isFollowingMe,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
