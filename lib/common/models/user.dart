import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

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
    @Default('PENDING_REGISTRATION') String status,
    @JsonKey(name: 'followers_count') @Default(0) int followersCount,
    @JsonKey(name: 'following_count') @Default(0) int followingCount,
    @JsonKey(name: 'animes_viewed_count') @Default(0) int animesViewedCount,
    @JsonKey(name: 'watchlist_count') @Default(0) int watchlistCount,
    @Default(false) bool followed,
    @JsonKey(name: 'is_following_me') @Default(false) bool isFollowingMe,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
