import 'package:umai/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_complete_user.freezed.dart';
part 'auth_response_complete_user.g.dart';

@freezed
class AuthResponseCompleteUser with _$AuthResponseCompleteUser {
  const factory AuthResponseCompleteUser({
    required User user,
  }) = _AuthResponseCompleteUser;

  factory AuthResponseCompleteUser.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseCompleteUserFromJson(json);
}
