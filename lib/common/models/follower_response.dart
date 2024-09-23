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
    required String type,
    required String status,
    @JsonKey(name: 'followers_count') required int followersCount,
    @JsonKey(name: 'following_count') required int followingCount,
    @JsonKey(name: 'animes_viewed_count') required int animesViewedCount,
    @JsonKey(name: 'watchlist_count') required int watchlistCount,
    required bool followed,
    @JsonKey(name: 'is_following_me') required bool isFollowingMe,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
