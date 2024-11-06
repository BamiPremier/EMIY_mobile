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
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'airingAt': instance.airingAt,
      'timeUntilAiring': instance.timeUntilAiring,
      'episode': instance.episode,
      'anime': instance.anime,
    };
