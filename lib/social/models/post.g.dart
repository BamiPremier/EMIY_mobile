// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
      hasLiked: json['has_liked'] as bool? ?? false,
      commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      reported: json['reported'] as bool? ?? false,
      createdAt: const DateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'image': instance.image,
      'has_liked': instance.hasLiked,
      'comments_count': instance.commentsCount,
      'user': instance.user,
      'reported': instance.reported,
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
    };
