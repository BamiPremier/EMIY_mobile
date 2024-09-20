// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryAnimeResponseImpl _$$CategoryAnimeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryAnimeResponseImpl(
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CategoryAnimeResponseImplToJson(
        _$CategoryAnimeResponseImpl instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
