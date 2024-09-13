import 'package:umai/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_anime_response.freezed.dart';
part 'category_anime_response.g.dart';

@freezed
class CategoryAnimeResponse with _$CategoryAnimeResponse {
  const factory CategoryAnimeResponse({
    required User user,
    required bool status, 
  }) = _CategoryAnimeResponse;

  factory CategoryAnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryAnimeResponseFromJson(json);
}
