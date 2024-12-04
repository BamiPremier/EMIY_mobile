// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      id: (json['id'] as num).toInt(),
      airingAt: (json['airingAt'] as num).toInt(),
      timeUntilAiring: (json['timeUntilAiring'] as num).toInt(),
      episode: (json['episode'] as num).toInt(),
      anime: Anime.fromJson(json['anime'] as Map<String, dynamic>),
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      hasLiked: json['has_liked'] as bool? ?? false,
      commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'airingAt': instance.airingAt,
      'timeUntilAiring': instance.timeUntilAiring,
      'episode': instance.episode,
      'anime': instance.anime,
      'likes_count': instance.likesCount,
      'has_liked': instance.hasLiked,
      'comments_count': instance.commentsCount,
    };
