import 'package:umai/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_response.freezed.dart';
part 'anime_response.g.dart';

@freezed
class AnimeResponse with _$AnimeResponse {
  const factory AnimeResponse({
    required User user,
    required bool status,
  }) = _AnimeResponse;

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);
}
