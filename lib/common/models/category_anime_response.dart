import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_anime_response.freezed.dart';
part 'category_anime_response.g.dart';

@freezed
class CategoryAnimeResponse with _$CategoryAnimeResponse {
  const factory CategoryAnimeResponse({
    required List<String> genres,
  }) = _CategoryAnimeResponse;

  factory CategoryAnimeResponse.fromJson(List<dynamic> json) =>
      CategoryAnimeResponse(
        genres: json.cast<String>().toList(),
      );
}
