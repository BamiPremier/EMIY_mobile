import 'package:umai/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower_response.freezed.dart';
part 'follower_response.g.dart';

@freezed
class FollowerResponse with _$FollowerResponse {
  const factory FollowerResponse({
    required User followes,
    required int total,
  }) = _FollowerResponse;

  factory FollowerResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowerResponseFromJson(json);
}
