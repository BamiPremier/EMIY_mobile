import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_response.freezed.dart';
part 'anime_response.g.dart';

@freezed
class AnimeResponse with _$AnimeResponse {
  const factory AnimeResponse({
    required int page,
    required int size,
    required List<Anime> content,
    required int total,
  }) = _AnimeResponse;

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);
}

@freezed
class Anime with _$Anime {
  const factory Anime({
    required int id,
    required Title title,
    required String description,
    required CoverImage coverImage,
    String? bannerImage,
  }) = _Anime;

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
}

@freezed
class Title with _$Title {
  const factory Title({
    required String romaji,
    String? english,
  }) = _Title;

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}

@freezed
class CoverImage with _$CoverImage {
  const factory CoverImage({
    required String extraLarge,
    required String large,
    required String medium,
    String? color,
  }) = _CoverImage;

  factory CoverImage.fromJson(Map<String, dynamic> json) =>
      _$CoverImageFromJson(json);
}
