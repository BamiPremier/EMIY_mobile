import 'package:umai/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower_response.freezed.dart';
part 'follower_response.g.dart';

@freezed
class FollowerResponse with _$FollowerResponse {
  const factory FollowerResponse({
    required List<User> users,
    required Pagination pagination,
  }) = _FollowerResponse;

  factory FollowerResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowerResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'created_at') required int createdAt,
    String? uid,
    required String email,
    @JsonKey(name: 'user_type') String? userType,
    String? type,
    required String status,
    @JsonKey(name: 'updated_at') required int updatedAt,
    String? username,
    String? usertag,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    required int take,
    required int total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
