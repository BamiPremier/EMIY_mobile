// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      usertag: json['usertag'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      followersCount: (json['followers_count'] as num).toInt(),
      followingCount: (json['following_count'] as num).toInt(),
      animesViewedCount: (json['animes_viewed_count'] as num).toInt(),
      watchlistCount: (json['watchlist_count'] as num).toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'usertag': instance.usertag,
      'type': instance.type,
      'status': instance.status,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'animes_viewed_count': instance.animesViewedCount,
      'watchlist_count': instance.watchlistCount,
    };
