// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      displayMessages: (json['display_messages'] as List<dynamic>?)
          ?.map((e) => IDisplayText.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: json['details'] as Map<String, dynamic>?,
      statusCode: (json['status_code'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'display_messages': instance.displayMessages,
      'details': instance.details,
      'status_code': instance.statusCode,
      'url': instance.url,
    };

_$IDisplayTextImpl _$$IDisplayTextImplFromJson(Map<String, dynamic> json) =>
    _$IDisplayTextImpl(
      lang: json['lang'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$IDisplayTextImplToJson(_$IDisplayTextImpl instance) =>
    <String, dynamic>{
      'lang': instance.lang,
      'value': instance.value,
    };
