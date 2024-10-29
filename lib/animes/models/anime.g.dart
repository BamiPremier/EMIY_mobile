// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeImpl _$$AnimeImplFromJson(Map<String, dynamic> json) => _$AnimeImpl(
      id: (json['id'] as num).toInt(),
      title: AnimeTitle.fromJson(json['title'] as Map<String, dynamic>),
      description: json['description'] as String?,
      coverImage:
          AnimeCoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      bannerImage: json['bannerImage'] as String?,
      isViewed: json['is_viewed'] as bool? ?? false,
      isInWatchlist: json['is_in_watchlist'] as bool? ?? false,
      animeViewCount: (json['anime_view_count'] as num?)?.toInt() ?? 0,
      averageScore: (json['averageScore'] as num?)?.toInt(),
      chapters: (json['chapters'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      endDate: json['endDate'] == null
          ? null
          : AnimeDate.fromJson(json['endDate'] as Map<String, dynamic>),
      episodes: (json['episodes'] as num?)?.toInt(),
      format: json['format'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isAdult: json['isAdult'] as bool? ?? false,
      nextAiringEpisode: json['nextAiringEpisode'] == null
          ? null
          : AnimeEpisode.fromJson(
              json['nextAiringEpisode'] as Map<String, dynamic>),
      popularity: (json['popularity'] as num?)?.toInt(),
      season: json['season'] as String?,
      seasonYear: (json['seasonYear'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : AnimeDate.fromJson(json['startDate'] as Map<String, dynamic>),
      volumes: (json['volumes'] as num?)?.toInt(),
      watchlistCount: (json['watchlist_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AnimeImplToJson(_$AnimeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'bannerImage': instance.bannerImage,
      'is_viewed': instance.isViewed,
      'is_in_watchlist': instance.isInWatchlist,
      'anime_view_count': instance.animeViewCount,
      'averageScore': instance.averageScore,
      'chapters': instance.chapters,
      'duration': instance.duration,
      'endDate': instance.endDate,
      'episodes': instance.episodes,
      'format': instance.format,
      'genres': instance.genres,
      'isAdult': instance.isAdult,
      'nextAiringEpisode': instance.nextAiringEpisode,
      'popularity': instance.popularity,
      'season': instance.season,
      'seasonYear': instance.seasonYear,
      'startDate': instance.startDate,
      'volumes': instance.volumes,
      'watchlist_count': instance.watchlistCount,
    };

_$AnimeTitleImpl _$$AnimeTitleImplFromJson(Map<String, dynamic> json) =>
    _$AnimeTitleImpl(
      romaji: json['romaji'] as String,
      english: json['english'] as String?,
      native: json['native'] as String?,
      userPreferred: json['userPreferred'] as String?,
    );

Map<String, dynamic> _$$AnimeTitleImplToJson(_$AnimeTitleImpl instance) =>
    <String, dynamic>{
      'romaji': instance.romaji,
      'english': instance.english,
      'native': instance.native,
      'userPreferred': instance.userPreferred,
    };

_$AnimeCoverImageImpl _$$AnimeCoverImageImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimeCoverImageImpl(
      extraLarge: json['extraLarge'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$AnimeCoverImageImplToJson(
        _$AnimeCoverImageImpl instance) =>
    <String, dynamic>{
      'extraLarge': instance.extraLarge,
      'large': instance.large,
      'medium': instance.medium,
      'color': instance.color,
    };

_$AnimeDateImpl _$$AnimeDateImplFromJson(Map<String, dynamic> json) =>
    _$AnimeDateImpl(
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AnimeDateImplToJson(_$AnimeDateImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };

_$AnimeEpisodeImpl _$$AnimeEpisodeImplFromJson(Map<String, dynamic> json) =>
    _$AnimeEpisodeImpl(
      airingAt: (json['airingAt'] as num?)?.toInt(),
      timeUntilAiring: (json['timeUntilAiring'] as num?)?.toInt(),
      episode: (json['episode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AnimeEpisodeImplToJson(_$AnimeEpisodeImpl instance) =>
    <String, dynamic>{
      'airingAt': instance.airingAt,
      'timeUntilAiring': instance.timeUntilAiring,
      'episode': instance.episode,
    };
