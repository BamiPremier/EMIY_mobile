// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeResponseImpl _$$AnimeResponseImplFromJson(Map<String, dynamic> json) =>
    _$AnimeResponseImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$$AnimeResponseImplToJson(_$AnimeResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
    };
