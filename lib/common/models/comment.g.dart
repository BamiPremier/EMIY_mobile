// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      hasLiked: json['has_liked'] as bool,
      commentResponsesCount: (json['comment_responses_count'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: const DateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'has_liked': instance.hasLiked,
      'comment_responses_count': instance.commentResponsesCount,
      'user': instance.user,
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
    };
