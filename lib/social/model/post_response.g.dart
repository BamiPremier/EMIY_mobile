// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostResponseImpl _$$PostResponseImplFromJson(Map<String, dynamic> json) =>
    _$PostResponseImpl(
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      nextPage: (json['nextPage'] as num?)?.toInt() ?? 0,
      previousPage: (json['previousPage'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PostResponseImplToJson(_$PostResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'nextPage': instance.nextPage,
      'previousPage': instance.previousPage,
      'total': instance.total,
      'content': instance.content,
    };

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      isMeLiked: json['isMeLiked'] as bool? ?? false,
      nbComments: (json['nbComments'] as num?)?.toInt() ?? 0,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'image': instance.image,
      'isMeLiked': instance.isMeLiked,
      'nbComments': instance.nbComments,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      email: json['email'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      username: json['username'] as String,
      usertag: json['usertag'] as String,
      biography: json['biography'] as String,
      image: json['image'] as String?,
      imageFull: json['imageFull'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'type': instance.type,
      'status': instance.status,
      'username': instance.username,
      'usertag': instance.usertag,
      'biography': instance.biography,
      'image': instance.image,
      'imageFull': instance.imageFull,
    };
