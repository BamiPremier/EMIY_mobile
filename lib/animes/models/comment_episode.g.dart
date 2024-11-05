// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentEpisodeImpl _$$CommentEpisodeImplFromJson(Map<String, dynamic> json) =>
    _$CommentEpisodeImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      hasLiked: json['has_liked'] as bool,
      commentResponsesCount: (json['comment_responses_count'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: const DateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
    );

Map<String, dynamic> _$$CommentEpisodeImplToJson(
        _$CommentEpisodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'has_liked': instance.hasLiked,
      'comment_responses_count': instance.commentResponsesCount,
      'user': instance.user,
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
    };
