// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowerResponseImpl _$$FollowerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowerResponseImpl(
      followes: User.fromJson(json['followes'] as Map<String, dynamic>),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$FollowerResponseImplToJson(
        _$FollowerResponseImpl instance) =>
    <String, dynamic>{
      'followes': instance.followes,
      'total': instance.total,
    };
