// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get usertag => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_full')
  String? get imageFull => throw _privateConstructorUsedError;
  String? get biography => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_count')
  int get followingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'animes_viewed_count')
  int get animesViewedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchlist_count')
  int get watchlistCount => throw _privateConstructorUsedError;
  bool get followed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following_me')
  bool get isFollowingMe => throw _privateConstructorUsedError;
  bool get hasBlocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String username,
      String usertag,
      String? image,
      @JsonKey(name: 'image_full') String? imageFull,
      String? biography,
      String type,
      String status,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount,
      @JsonKey(name: 'animes_viewed_count') int animesViewedCount,
      @JsonKey(name: 'watchlist_count') int watchlistCount,
      bool followed,
      @JsonKey(name: 'is_following_me') bool isFollowingMe,
      bool hasBlocked});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? usertag = null,
    Object? image = freezed,
    Object? imageFull = freezed,
    Object? biography = freezed,
    Object? type = null,
    Object? status = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? animesViewedCount = null,
    Object? watchlistCount = null,
    Object? followed = null,
    Object? isFollowingMe = null,
    Object? hasBlocked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      usertag: null == usertag
          ? _value.usertag
          : usertag // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFull: freezed == imageFull
          ? _value.imageFull
          : imageFull // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      animesViewedCount: null == animesViewedCount
          ? _value.animesViewedCount
          : animesViewedCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchlistCount: null == watchlistCount
          ? _value.watchlistCount
          : watchlistCount // ignore: cast_nullable_to_non_nullable
              as int,
      followed: null == followed
          ? _value.followed
          : followed // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowingMe: null == isFollowingMe
          ? _value.isFollowingMe
          : isFollowingMe // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBlocked: null == hasBlocked
          ? _value.hasBlocked
          : hasBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String usertag,
      String? image,
      @JsonKey(name: 'image_full') String? imageFull,
      String? biography,
      String type,
      String status,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount,
      @JsonKey(name: 'animes_viewed_count') int animesViewedCount,
      @JsonKey(name: 'watchlist_count') int watchlistCount,
      bool followed,
      @JsonKey(name: 'is_following_me') bool isFollowingMe,
      bool hasBlocked});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? usertag = null,
    Object? image = freezed,
    Object? imageFull = freezed,
    Object? biography = freezed,
    Object? type = null,
    Object? status = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? animesViewedCount = null,
    Object? watchlistCount = null,
    Object? followed = null,
    Object? isFollowingMe = null,
    Object? hasBlocked = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      usertag: null == usertag
          ? _value.usertag
          : usertag // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFull: freezed == imageFull
          ? _value.imageFull
          : imageFull // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      animesViewedCount: null == animesViewedCount
          ? _value.animesViewedCount
          : animesViewedCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchlistCount: null == watchlistCount
          ? _value.watchlistCount
          : watchlistCount // ignore: cast_nullable_to_non_nullable
              as int,
      followed: null == followed
          ? _value.followed
          : followed // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowingMe: null == isFollowingMe
          ? _value.isFollowingMe
          : isFollowingMe // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBlocked: null == hasBlocked
          ? _value.hasBlocked
          : hasBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      this.username = '',
      this.usertag = '',
      this.image,
      @JsonKey(name: 'image_full') this.imageFull,
      this.biography,
      required this.type,
      required this.status,
      @JsonKey(name: 'followers_count') this.followersCount = 0,
      @JsonKey(name: 'following_count') this.followingCount = 0,
      @JsonKey(name: 'animes_viewed_count') this.animesViewedCount = 0,
      @JsonKey(name: 'watchlist_count') this.watchlistCount = 0,
      this.followed = false,
      @JsonKey(name: 'is_following_me') this.isFollowingMe = false,
      this.hasBlocked = false});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String usertag;
  @override
  final String? image;
  @override
  @JsonKey(name: 'image_full')
  final String? imageFull;
  @override
  final String? biography;
  @override
  final String type;
  @override
  final String status;
  @override
  @JsonKey(name: 'followers_count')
  final int followersCount;
  @override
  @JsonKey(name: 'following_count')
  final int followingCount;
  @override
  @JsonKey(name: 'animes_viewed_count')
  final int animesViewedCount;
  @override
  @JsonKey(name: 'watchlist_count')
  final int watchlistCount;
  @override
  @JsonKey()
  final bool followed;
  @override
  @JsonKey(name: 'is_following_me')
  final bool isFollowingMe;
  @override
  @JsonKey()
  final bool hasBlocked;

  @override
  String toString() {
    return 'User(id: $id, username: $username, usertag: $usertag, image: $image, imageFull: $imageFull, biography: $biography, type: $type, status: $status, followersCount: $followersCount, followingCount: $followingCount, animesViewedCount: $animesViewedCount, watchlistCount: $watchlistCount, followed: $followed, isFollowingMe: $isFollowingMe, hasBlocked: $hasBlocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.usertag, usertag) || other.usertag == usertag) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageFull, imageFull) ||
                other.imageFull == imageFull) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.animesViewedCount, animesViewedCount) ||
                other.animesViewedCount == animesViewedCount) &&
            (identical(other.watchlistCount, watchlistCount) ||
                other.watchlistCount == watchlistCount) &&
            (identical(other.followed, followed) ||
                other.followed == followed) &&
            (identical(other.isFollowingMe, isFollowingMe) ||
                other.isFollowingMe == isFollowingMe) &&
            (identical(other.hasBlocked, hasBlocked) ||
                other.hasBlocked == hasBlocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      usertag,
      image,
      imageFull,
      biography,
      type,
      status,
      followersCount,
      followingCount,
      animesViewedCount,
      watchlistCount,
      followed,
      isFollowingMe,
      hasBlocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      final String username,
      final String usertag,
      final String? image,
      @JsonKey(name: 'image_full') final String? imageFull,
      final String? biography,
      required final String type,
      required final String status,
      @JsonKey(name: 'followers_count') final int followersCount,
      @JsonKey(name: 'following_count') final int followingCount,
      @JsonKey(name: 'animes_viewed_count') final int animesViewedCount,
      @JsonKey(name: 'watchlist_count') final int watchlistCount,
      final bool followed,
      @JsonKey(name: 'is_following_me') final bool isFollowingMe,
      final bool hasBlocked}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get usertag;
  @override
  String? get image;
  @override
  @JsonKey(name: 'image_full')
  String? get imageFull;
  @override
  String? get biography;
  @override
  String get type;
  @override
  String get status;
  @override
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @override
  @JsonKey(name: 'following_count')
  int get followingCount;
  @override
  @JsonKey(name: 'animes_viewed_count')
  int get animesViewedCount;
  @override
  @JsonKey(name: 'watchlist_count')
  int get watchlistCount;
  @override
  bool get followed;
  @override
  @JsonKey(name: 'is_following_me')
  bool get isFollowingMe;
  @override
  bool get hasBlocked;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
