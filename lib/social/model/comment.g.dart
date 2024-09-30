// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
      hasLiked: json['has_liked'] as bool? ?? false,
      commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'image': instance.image,
      'has_liked': instance.hasLiked,
      'comments_count': instance.commentsCount,
      'user': instance.user,
    };
