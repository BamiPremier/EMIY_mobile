// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      email: json['email'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      updatedAt: (json['updated_at'] as num).toInt(),
      version: (json['__v'] as num).toInt(),
      authToken: json['auth_token'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'created_at': instance.createdAt,
      'email': instance.email,
      'type': instance.type,
      'status': instance.status,
      'updated_at': instance.updatedAt,
      '__v': instance.version,
      'auth_token': instance.authToken,
    };
