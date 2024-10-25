// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      id: (json['id'] as num).toInt(),
      title: QuizTitle.fromJson(json['title'] as Map<String, dynamic>),
      description: json['description'] as String,
      coverImage:
          QuizCoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      bannerImage: json['bannerImage'] as String?,
      isViewed: json['is_viewed'] as bool? ?? false,
      isInWatchlist: json['is_in_watchlist'] as bool? ?? false,
      animeViewCount: (json['anime_view_count'] as num?)?.toInt() ?? 0,
      averageScore: (json['averageScore'] as num?)?.toInt(),
      chapters: (json['chapters'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      endDate: json['endDate'] == null
          ? null
          : QuizDate.fromJson(json['endDate'] as Map<String, dynamic>),
      episodes: (json['episodes'] as num?)?.toInt(),
      format: json['format'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isAdult: json['isAdult'] as bool? ?? false,
      nextAiringEpisode: json['nextAiringEpisode'] == null
          ? null
          : QuizEpisode.fromJson(
              json['nextAiringEpisode'] as Map<String, dynamic>),
      popularity: (json['popularity'] as num?)?.toInt(),
      season: json['season'] as String?,
      seasonYear: (json['seasonYear'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : QuizDate.fromJson(json['startDate'] as Map<String, dynamic>),
      volumes: (json['volumes'] as num?)?.toInt(),
      watchlistCount: (json['watchlist_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
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

_$QuizTitleImpl _$$QuizTitleImplFromJson(Map<String, dynamic> json) =>
    _$QuizTitleImpl(
      romaji: json['romaji'] as String,
      english: json['english'] as String?,
      native: json['native'] as String?,
      userPreferred: json['userPreferred'] as String?,
    );

Map<String, dynamic> _$$QuizTitleImplToJson(_$QuizTitleImpl instance) =>
    <String, dynamic>{
      'romaji': instance.romaji,
      'english': instance.english,
      'native': instance.native,
      'userPreferred': instance.userPreferred,
    };

_$QuizCoverImageImpl _$$QuizCoverImageImplFromJson(Map<String, dynamic> json) =>
    _$QuizCoverImageImpl(
      extraLarge: json['extraLarge'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$QuizCoverImageImplToJson(
        _$QuizCoverImageImpl instance) =>
    <String, dynamic>{
      'extraLarge': instance.extraLarge,
      'large': instance.large,
      'medium': instance.medium,
      'color': instance.color,
    };

_$QuizDateImpl _$$QuizDateImplFromJson(Map<String, dynamic> json) =>
    _$QuizDateImpl(
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QuizDateImplToJson(_$QuizDateImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };

_$QuizEpisodeImpl _$$QuizEpisodeImplFromJson(Map<String, dynamic> json) =>
    _$QuizEpisodeImpl(
      airingAt: (json['airingAt'] as num?)?.toInt(),
      timeUntilAiring: (json['timeUntilAiring'] as num?)?.toInt(),
      episode: (json['episode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QuizEpisodeImplToJson(_$QuizEpisodeImpl instance) =>
    <String, dynamic>{
      'airingAt': instance.airingAt,
      'timeUntilAiring': instance.timeUntilAiring,
      'episode': instance.episode,
    };
