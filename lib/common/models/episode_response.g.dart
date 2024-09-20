// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeResponseImpl _$$EpisodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EpisodeResponseImpl(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      content: (json['content'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$EpisodeResponseImplToJson(
        _$EpisodeResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'content': instance.content,
      'total': instance.total,
    };

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      id: (json['id'] as num).toInt(),
      title: Title.fromJson(json['title'] as Map<String, dynamic>),
      description: json['description'] as String,
      coverImage:
          CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      bannerImage: json['bannerImage'] as String?,
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'bannerImage': instance.bannerImage,
    };

_$TitleImpl _$$TitleImplFromJson(Map<String, dynamic> json) => _$TitleImpl(
      romaji: json['romaji'] as String,
      english: json['english'] as String?,
    );

Map<String, dynamic> _$$TitleImplToJson(_$TitleImpl instance) =>
    <String, dynamic>{
      'romaji': instance.romaji,
      'english': instance.english,
    };

_$CoverImageImpl _$$CoverImageImplFromJson(Map<String, dynamic> json) =>
    _$CoverImageImpl(
      extraLarge: json['extraLarge'] as String,
      large: json['large'] as String,
      medium: json['medium'] as String,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$CoverImageImplToJson(_$CoverImageImpl instance) =>
    <String, dynamic>{
      'extraLarge': instance.extraLarge,
      'large': instance.large,
      'medium': instance.medium,
      'color': instance.color,
    };
