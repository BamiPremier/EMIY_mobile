// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeImpl _$$AnimeImplFromJson(Map<String, dynamic> json) => _$AnimeImpl(
      id: (json['id'] as num).toInt(),
      title: AnimeTitle.fromJson(json['title'] as Map<String, dynamic>),
      description: json['description'] as String,
      coverImage:
          AnimeCoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      bannerImage: json['bannerImage'] as String?,
      isViewed: json['is_viewed'] as bool? ?? false,
      isInWatchlist: json['is_in_watchlist'] as bool? ?? false,
    );

Map<String, dynamic> _$$AnimeImplToJson(_$AnimeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'bannerImage': instance.bannerImage,
      'is_viewed': instance.isViewed,
      'is_in_watchlist': instance.isInWatchlist,
    };

_$AnimeTitleImpl _$$AnimeTitleImplFromJson(Map<String, dynamic> json) =>
    _$AnimeTitleImpl(
      romaji: json['romaji'] as String,
      english: json['english'] as String?,
      native: json['native'] as String?,
    );

Map<String, dynamic> _$$AnimeTitleImplToJson(_$AnimeTitleImpl instance) =>
    <String, dynamic>{
      'romaji': instance.romaji,
      'english': instance.english,
      'native': instance.native,
    };

_$AnimeCoverImageImpl _$$AnimeCoverImageImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimeCoverImageImpl(
      extraLarge: json['extraLarge'] as String,
      large: json['large'] as String,
      medium: json['medium'] as String,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$AnimeCoverImageImplToJson(
        _$AnimeCoverImageImpl instance) =>
    <String, dynamic>{
      'extraLarge': instance.extraLarge,
      'large': instance.large,
      'medium': instance.medium,
      'color': instance.color,
    };
