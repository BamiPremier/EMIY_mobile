// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      anime: json['anime'] == null
          ? null
          : Anime.fromJson(json['anime'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      reported: json['reported'] as bool,
      createdAt: (json['created_at'] as num).toInt(),
      status: json['status'] as String,
      participation: json['participation'] == null
          ? null
          : QuizParticipation.fromJson(
              json['participation'] as Map<String, dynamic>),
      questionCount: (json['question_count'] as num).toInt(),
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'anime': instance.anime,
      'user': instance.user,
      'reported': instance.reported,
      'created_at': instance.createdAt,
      'status': instance.status,
      'participation': instance.participation,
      'question_count': instance.questionCount,
    };

_$QuizParticipationImpl _$$QuizParticipationImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizParticipationImpl(
      id: json['id'] as String,
      score: (json['score'] as num).toInt(),
      rank: (json['rank'] as num?)?.toInt() ?? 0,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuizParticipationImplToJson(
        _$QuizParticipationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'rank': instance.rank,
      'user': instance.user,
    };
