// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryAnimeResponseImpl _$$CategoryAnimeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryAnimeResponseImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$$CategoryAnimeResponseImplToJson(
        _$CategoryAnimeResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
    };
