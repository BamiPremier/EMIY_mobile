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
    @JsonKey(name: 'is_viewed') @Default(false) bool isViewed,
    @JsonKey(name: 'is_in_watchlist') @Default(false) bool isInWatchlist,
    @JsonKey(name: 'anime_view_count') @Default(0) int animeViewCount,
    int? averageScore,
    int? chapters,
    int? duration,
    AnimeDate? endDate,
    int? episodes,
    String? format,
    List<String>? genres,
    @Default(false) bool isAdult,
    AnimeEpisode? nextAiringEpisode,
    int? popularity,
    String? season,
    int? seasonYear,
    AnimeDate? startDate,
    int? volumes,
    @JsonKey(name: 'watchlist_count') @Default(0) int watchlistCount,
  }) = _Anime;

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
}

@freezed
class AnimeTitle with _$AnimeTitle {
  const factory AnimeTitle({
    required String romaji,
    String? english,
    String? native,
    String? userPreferred,
  }) = _AnimeTitle;

  factory AnimeTitle.fromJson(Map<String, dynamic> json) =>
      _$AnimeTitleFromJson(json);
}

@freezed
class AnimeCoverImage with _$AnimeCoverImage {
  const factory AnimeCoverImage({
    String? extraLarge,
    String? large,
    String? medium,
    String? color,
  }) = _AnimeCoverImage;

  factory AnimeCoverImage.fromJson(Map<String, dynamic> json) =>
      _$AnimeCoverImageFromJson(json);
}

@freezed
class AnimeDate with _$AnimeDate {
  const factory AnimeDate({
    int? year,
    int? month,
    int? day,
  }) = _AnimeDate;

  factory AnimeDate.fromJson(Map<String, dynamic> json) =>
      _$AnimeDateFromJson(json);
}

@freezed
class AnimeEpisode with _$AnimeEpisode {
  const factory AnimeEpisode({
    int? airingAt,
    int? timeUntilAiring,
    int? episode,
  }) = _AnimeEpisode;

  factory AnimeEpisode.fromJson(Map<String, dynamic> json) =>
      _$AnimeEpisodeFromJson(json);
}
