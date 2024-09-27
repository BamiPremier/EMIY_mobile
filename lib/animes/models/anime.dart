import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime.freezed.dart';
part 'anime.g.dart';

@freezed
class Anime with _$Anime {
  const factory Anime({
    required int id,
    required AnimeTitle title,
    required String description,
    required AnimeCoverImage coverImage,
    required String? bannerImage,
    @JsonKey(name: 'is_viewed')
    @Default(false)
    bool isViewed,
    @JsonKey(name: 'is_in_watchlist')
    @Default(false)
    bool isInWatchlist,
  }) = _Anime;

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
}

@freezed
class AnimeTitle with _$AnimeTitle {
  const factory AnimeTitle({
    required String romaji,
    String? english,
    String? native,
  }) = _AnimeTitle;

  factory AnimeTitle.fromJson(Map<String, dynamic> json) =>
      _$AnimeTitleFromJson(json);
}

@freezed
class AnimeCoverImage with _$AnimeCoverImage {
  const factory AnimeCoverImage({
    required String extraLarge,
    required String large,
    required String medium,
    String? color,
  }) = _AnimeCoverImage;

  factory AnimeCoverImage.fromJson(Map<String, dynamic> json) =>
      _$AnimeCoverImageFromJson(json);
}
