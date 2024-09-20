import 'package:freezed_annotation/freezed_annotation.dart';
  
part 'episode_response.freezed.dart';
part 'episode_response.g.dart';

@freezed
class EpisodeResponse with _$EpisodeResponse {
  const factory EpisodeResponse({
    required int page,
    required int size,
    required List<Episode> content,
    required int total,
  }) = _EpisodeResponse;

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseFromJson(json);
}

@freezed
class Episode with _$Episode {
  const factory Episode({
    required int id,
    required Title title,
    required String description,
    required CoverImage coverImage,
    String? bannerImage,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
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
