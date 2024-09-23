import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower_response.freezed.dart';
part 'follower_response.g.dart';

@freezed
class FollowerResponse with _$FollowerResponse {
  const factory FollowerResponse({
    required int page,
    required int size,
    required List<User> content,
    required int total,
  }) = _FollowerResponse;

  factory FollowerResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowerResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'created_at') required int createdAt,
    required String email,
    required String type,
    required String status,
    @JsonKey(name: 'updated_at') required int updatedAt,
    required String username,
    required String usertag,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
