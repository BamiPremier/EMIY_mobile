// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      anime: QuizAnime.fromJson(json['anime'] as Map<String, dynamic>),
      user: QuizUser.fromJson(json['user'] as Map<String, dynamic>),
      reported: json['reported'] as bool,
      createdAt: (json['created_at'] as num).toInt(),
      status: json['status'] as String,
      participation: json['participation'] == null
          ? null
          : QuizParticipation.fromJson(
              json['participation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'anime': instance.anime,
      'user': instance.user,
      'reported': instance.reported,
      'created_at': instance.createdAt,
      'status': instance.status,
      'participation': instance.participation,
    };

_$QuizAnimeImpl _$$QuizAnimeImplFromJson(Map<String, dynamic> json) =>
    _$QuizAnimeImpl(
      id: (json['id'] as num).toInt(),
      title: QuizTitle.fromJson(json['title'] as Map<String, dynamic>),
      description: json['description'] as String,
      coverImage:
          QuizCoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      bannerImage: json['bannerImage'] as String?,
      startDate: json['startDate'] == null
          ? null
          : QuizDate.fromJson(json['startDate'] as Map<String, dynamic>),
      endDate: json['endDate'] == null
          ? null
          : QuizDate.fromJson(json['endDate'] as Map<String, dynamic>),
      nextAiringEpisode: json['nextAiringEpisode'] == null
          ? null
          : QuizEpisode.fromJson(
              json['nextAiringEpisode'] as Map<String, dynamic>),
      season: json['season'] as String?,
      seasonYear: (json['seasonYear'] as num?)?.toInt(),
      type: json['type'] as String?,
      format: json['format'] as String?,
      episodes: (json['episodes'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      chapters: (json['chapters'] as num?)?.toInt(),
      volumes: (json['volumes'] as num?)?.toInt(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isAdult: json['isAdult'] as bool? ?? false,
      averageScore: (json['averageScore'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QuizAnimeImplToJson(_$QuizAnimeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'bannerImage': instance.bannerImage,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'nextAiringEpisode': instance.nextAiringEpisode,
      'season': instance.season,
      'seasonYear': instance.seasonYear,
      'type': instance.type,
      'format': instance.format,
      'episodes': instance.episodes,
      'duration': instance.duration,
      'chapters': instance.chapters,
      'volumes': instance.volumes,
      'genres': instance.genres,
      'isAdult': instance.isAdult,
      'averageScore': instance.averageScore,
      'popularity': instance.popularity,
    };

_$QuizUserImpl _$$QuizUserImplFromJson(Map<String, dynamic> json) =>
    _$QuizUserImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      usertag: json['usertag'] as String,
      image: json['image'] as String,
      imageFull: json['image_full'] as String,
      biography: json['biography'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      followersCount: (json['followers_count'] as num).toInt(),
      followingCount: (json['following_count'] as num).toInt(),
      animesViewedCount: (json['animes_viewed_count'] as num).toInt(),
      watchlistCount: (json['watchlist_count'] as num).toInt(),
      followed: json['followed'] as bool,
      isFollowingMe: json['is_following_me'] as bool,
      hasBlocked: json['hasBlocked'] as bool,
    );

Map<String, dynamic> _$$QuizUserImplToJson(_$QuizUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'usertag': instance.usertag,
      'image': instance.image,
      'image_full': instance.imageFull,
      'biography': instance.biography,
      'type': instance.type,
      'status': instance.status,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'animes_viewed_count': instance.animesViewedCount,
      'watchlist_count': instance.watchlistCount,
      'followed': instance.followed,
      'is_following_me': instance.isFollowingMe,
      'hasBlocked': instance.hasBlocked,
    };

_$QuizParticipationImpl _$$QuizParticipationImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizParticipationImpl(
      id: json['id'] as String,
      score: (json['score'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      user: QuizUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuizParticipationImplToJson(
        _$QuizParticipationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'rank': instance.rank,
      'user': instance.user,
    };

_$QuizTitleImpl _$$QuizTitleImplFromJson(Map<String, dynamic> json) =>
    _$QuizTitleImpl(
      english: json['english'] as String?,
      native: json['native'] as String?,
      romaji: json['romaji'] as String?,
      userPreferred: json['userPreferred'] as String?,
    );

Map<String, dynamic> _$$QuizTitleImplToJson(_$QuizTitleImpl instance) =>
    <String, dynamic>{
      'english': instance.english,
      'native': instance.native,
      'romaji': instance.romaji,
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
