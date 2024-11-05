import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime.freezed.dart';
part 'anime.g.dart';

@freezed
class Anime with _$Anime {
  const Anime._();

  const factory Anime({
    required int id,
    required AnimeTitle title,
    required String? description,
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
    String? status,
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

  AnimeStatus? get animeStatus {
    switch (status) {
      case 'NOT_YET_RELEASED': return AnimeStatus.notYetReleased;
      case 'RELEASING': return AnimeStatus.releasing;
      case 'FINISHED': return AnimeStatus.finished;
      case 'CANCELLED': return AnimeStatus.cancelled;
      case 'HIATUS': return AnimeStatus.hiatus;
      default: return null;
    }
  }
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

enum AnimeStatus {
  notYetReleased,
  releasing,
  finished,
  cancelled,
  hiatus
}

extension AnimeStatusExtension on AnimeStatus {
  String get codeValue {
    switch (this) {
      case AnimeStatus.notYetReleased: return 'NOT_YET_RELEASED';
      case AnimeStatus.releasing: return 'RELEASING';
      case AnimeStatus.finished: return 'FINISHED';
      case AnimeStatus.cancelled: return 'CANCELLED';
      case AnimeStatus.hiatus: return 'HIATUS';
    }
  }

  String get displayValue {
    switch (this) {
      case AnimeStatus.notYetReleased: return 'À venir';
      case AnimeStatus.releasing: return 'En cours';
      case AnimeStatus.finished: return 'Terminé';
      case AnimeStatus.cancelled: return 'Annulé';
      case AnimeStatus.hiatus: return 'Suspendu';
    }
  }
}
