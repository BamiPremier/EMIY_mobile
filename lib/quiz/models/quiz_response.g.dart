// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizQuestionResponseImpl _$$QuizQuestionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizQuestionResponseImpl(
      id: json['_id'] as String,
      label: json['label'] as String,
      image: json['image'] as String?,
      quizId: json['quiz_id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      updatedAt: (json['updated_at'] as num).toInt(),
      responses: (json['responses'] as List<dynamic>)
          .map((e) => QuizResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizQuestionResponseImplToJson(
        _$QuizQuestionResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'label': instance.label,
      'image': instance.image,
      'quiz_id': instance.quizId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'responses': instance.responses,
    };

_$QuizResponseImpl _$$QuizResponseImplFromJson(Map<String, dynamic> json) =>
    _$QuizResponseImpl(
      label: json['label'] as String,
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$$QuizResponseImplToJson(_$QuizResponseImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'isCorrect': instance.isCorrect,
    };
