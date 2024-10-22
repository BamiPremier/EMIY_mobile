// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      username: json['username'] as String? ?? '',
      usertag: json['usertag'] as String? ?? '',
      image: json['image'] as String?,
      imageFull: json['image_full'] as String?,
      biography: json['biography'] as String?,
      type: json['type'] as String,
      status: json['status'] as String,
      followersCount: (json['followers_count'] as num?)?.toInt() ?? 0,
      followingCount: (json['following_count'] as num?)?.toInt() ?? 0,
      animesViewedCount: (json['animes_viewed_count'] as num?)?.toInt() ?? 0,
      watchlistCount: (json['watchlist_count'] as num?)?.toInt() ?? 0,
      followed: json['followed'] as bool? ?? false,
      isFollowingMe: json['is_following_me'] as bool? ?? false,
      hasBlocked: json['hasBlocked'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'usertag': instance.usertag,
      'image': instance.image,
      'image_full': instance.imageFull,
      'biography': instance.biography,
      'type': instance.type,
      'status': instance.status,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'animes_viewed_count': instance.animesViewedCount,
      'watchlist_count': instance.watchlistCount,
      'followed': instance.followed,
      'is_following_me': instance.isFollowingMe,
      'hasBlocked': instance.hasBlocked,
    };
