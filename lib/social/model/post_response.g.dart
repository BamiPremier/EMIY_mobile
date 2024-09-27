// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostResponseImpl _$$PostResponseImplFromJson(Map<String, dynamic> json) =>
    _$PostResponseImpl(
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PostResponseImplToJson(_$PostResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'total': instance.total,
      'content': instance.content,
    };

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
      isMeLiked: json['is_me_liked'] as bool? ?? false,
      nbComments: (json['nb_comments'] as num?)?.toInt() ?? 0,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'image': instance.image,
      'is_me_liked': instance.isMeLiked,
      'nb_comments': instance.nbComments,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      usertag: json['usertag'] as String?,
      type: json['type'] as String,
      status: json['status'] as String,
      biography: json['biography'] as String?,
      image: json['image'] as String?,
      imageFull: json['image_full'] as String?,
      followersCount: (json['followers_count'] as num?)?.toInt() ?? 0,
      followingCount: (json['following_count'] as num?)?.toInt() ?? 0,
      animesViewedCount: (json['animes_viewed_count'] as num?)?.toInt() ?? 0,
      watchlistCount: (json['watchlist_count'] as num?)?.toInt() ?? 0,
      followed: json['followed'] as bool? ?? false,
      isFollowingMe: json['is_following_me'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'usertag': instance.usertag,
      'type': instance.type,
      'status': instance.status,
      'biography': instance.biography,
      'image': instance.image,
      'image_full': instance.imageFull,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'animes_viewed_count': instance.animesViewedCount,
      'watchlist_count': instance.watchlistCount,
      'followed': instance.followed,
      'is_following_me': instance.isFollowingMe,
    };
