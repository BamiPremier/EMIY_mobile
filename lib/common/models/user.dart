import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'created_at') required int createdAt,
    required String email,
    required String type,
    required String status,
    @JsonKey(name: 'updated_at') required int updatedAt,
    @JsonKey(name: '__v') required int version,
    @JsonKey(name: 'auth_token') required String authToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
