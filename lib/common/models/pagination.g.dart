// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      listEntity: (json['listEntity'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      nbElement: (json['nbElement'] as num).toInt(),
      perPage: (json['perPage'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      next: (json['next'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'listEntity': instance.listEntity,
      'nbElement': instance.nbElement,
      'perPage': instance.perPage,
      'currentPage': instance.currentPage,
      'next': instance.next,
    };
