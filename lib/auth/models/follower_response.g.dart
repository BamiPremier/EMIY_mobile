// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowerResponseImpl _$$FollowerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowerResponseImpl(
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowerResponseImplToJson(
        _$FollowerResponseImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
      'pagination': instance.pagination,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      email: json['email'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      updatedAt: (json['updated_at'] as num).toInt(),
      username: json['username'] as String?,
      usertag: json['usertag'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'created_at': instance.createdAt,
      'email': instance.email,
      'type': instance.type,
      'status': instance.status,
      'updated_at': instance.updatedAt,
      'username': instance.username,
      'usertag': instance.usertag,
      'image': instance.image,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      page: (json['page'] as num).toInt(),
      take: (json['take'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'take': instance.take,
      'total': instance.total,
    };
