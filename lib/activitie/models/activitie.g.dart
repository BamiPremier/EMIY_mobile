// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activitie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivitieImpl _$$ActivitieImplFromJson(Map<String, dynamic> json) =>
    _$ActivitieImpl(
      id: json['id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: const DateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      isPrivate: json['isPrivate'] as bool,
      targetEntity: json['target_entity'] as String,
      target: json['target'],
      subTarget: json['subTarget'],
    );

Map<String, dynamic> _$$ActivitieImplToJson(_$ActivitieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
      'isPrivate': instance.isPrivate,
      'target_entity': instance.targetEntity,
      'target': instance.target,
      'subTarget': instance.subTarget,
    };
