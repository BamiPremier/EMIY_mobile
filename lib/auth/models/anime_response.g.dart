// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeResponseImpl _$$AnimeResponseImplFromJson(Map<String, dynamic> json) =>
    _$AnimeResponseImpl(
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      animes: (json['animes'] as List<dynamic>)
          .map((e) => Anime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnimeResponseImplToJson(_$AnimeResponseImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'animes': instance.animes,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      page: (json['page'] as num).toInt(),
      take: (json['take'] as num).toInt(),
      nextPage: (json['next_page'] as num?)?.toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'take': instance.take,
      'next_page': instance.nextPage,
      'total': instance.total,
    };

_$AnimeImpl _$$AnimeImplFromJson(Map<String, dynamic> json) => _$AnimeImpl(
      id: (json['id'] as num).toInt(),
      title: Title.fromJson(json['title'] as Map<String, dynamic>),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$AnimeImplToJson(_$AnimeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
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
