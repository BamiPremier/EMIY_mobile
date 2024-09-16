import 'package:umai/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_anime_response.freezed.dart';
part 'category_anime_response.g.dart';

@freezed
class CategoryAnimeResponse with _$CategoryAnimeResponse {
  const factory CategoryAnimeResponse({
    required List<String> categories,
  }) = _CategoryAnimeResponse;

  factory CategoryAnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryAnimeResponseFromJson(json);

  static List<CategoryAnimeResponse> fromString(String response) {
    List<String> categories = response.split(',');
    return categories.map((category) {
      // Créer un CategoryAnimeResponse avec une seule catégorie
      return CategoryAnimeResponse(categories: [category]);
    }).toList();
  }
}
