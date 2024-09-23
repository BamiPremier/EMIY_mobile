// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowerResponse _$FollowerResponseFromJson(Map<String, dynamic> json) {
  return _FollowerResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowerResponse {
  List<User> get content => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowerResponseCopyWith<FollowerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerResponseCopyWith<$Res> {
  factory $FollowerResponseCopyWith(
          FollowerResponse value, $Res Function(FollowerResponse) then) =
      _$FollowerResponseCopyWithImpl<$Res, FollowerResponse>;
  @useResult
  $Res call({List<User> content, int page, int size, int total});
}

/// @nodoc
class _$FollowerResponseCopyWithImpl<$Res, $Val extends FollowerResponse>
    implements $FollowerResponseCopyWith<$Res> {
  _$FollowerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? page = null,
    Object? size = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<User>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowerResponseImplCopyWith<$Res>
    implements $FollowerResponseCopyWith<$Res> {
  factory _$$FollowerResponseImplCopyWith(_$FollowerResponseImpl value,
          $Res Function(_$FollowerResponseImpl) then) =
      __$$FollowerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User> content, int page, int size, int total});
}

/// @nodoc
class __$$FollowerResponseImplCopyWithImpl<$Res>
    extends _$FollowerResponseCopyWithImpl<$Res, _$FollowerResponseImpl>
    implements _$$FollowerResponseImplCopyWith<$Res> {
  __$$FollowerResponseImplCopyWithImpl(_$FollowerResponseImpl _value,
      $Res Function(_$FollowerResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? page = null,
    Object? size = null,
    Object? total = null,
  }) {
    return _then(_$FollowerResponseImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<User>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowerResponseImpl implements _FollowerResponse {
  const _$FollowerResponseImpl(
      {required final List<User> content,
      required this.page,
      required this.size,
      required this.total})
      : _content = content;

  factory _$FollowerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowerResponseImplFromJson(json);

  final List<User> _content;
  @override
  List<User> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final int page;
  @override
  final int size;
  @override
  final int total;

  @override
  String toString() {
    return 'FollowerResponse(content: $content, page: $page, size: $size, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowerResponseImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_content), page, size, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowerResponseImplCopyWith<_$FollowerResponseImpl> get copyWith =>
      __$$FollowerResponseImplCopyWithImpl<_$FollowerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowerResponseImplToJson(
      this,
    );
  }
}

abstract class _FollowerResponse implements FollowerResponse {
  const factory _FollowerResponse(
      {required final List<User> content,
      required final int page,
      required final int size,
      required final int total}) = _$FollowerResponseImpl;

  factory _FollowerResponse.fromJson(Map<String, dynamic> json) =
      _$FollowerResponseImpl.fromJson;

  @override
  List<User> get content;
  @override
  int get page;
  @override
  int get size;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$FollowerResponseImplCopyWith<_$FollowerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get usertag => throw _privateConstructorUsedError;
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
      String type,
      String status,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount,
      @JsonKey(name: 'animes_viewed_count') int animesViewedCount,
      @JsonKey(name: 'watchlist_count') int watchlistCount,
      bool followed,
      @JsonKey(name: 'is_following_me') bool isFollowingMe});
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
    Object? type = null,
    Object? status = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? animesViewedCount = null,
    Object? watchlistCount = null,
    Object? followed = null,
    Object? isFollowingMe = null,
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
      String type,
      String status,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount,
      @JsonKey(name: 'animes_viewed_count') int animesViewedCount,
      @JsonKey(name: 'watchlist_count') int watchlistCount,
      bool followed,
      @JsonKey(name: 'is_following_me') bool isFollowingMe});
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
    Object? type = null,
    Object? status = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? animesViewedCount = null,
    Object? watchlistCount = null,
    Object? followed = null,
    Object? isFollowingMe = null,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.username,
      required this.usertag,
      required this.type,
      required this.status,
      @JsonKey(name: 'followers_count') required this.followersCount,
      @JsonKey(name: 'following_count') required this.followingCount,
      @JsonKey(name: 'animes_viewed_count') required this.animesViewedCount,
      @JsonKey(name: 'watchlist_count') required this.watchlistCount,
      required this.followed,
      @JsonKey(name: 'is_following_me') required this.isFollowingMe});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String usertag;
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
  final bool followed;
  @override
  @JsonKey(name: 'is_following_me')
  final bool isFollowingMe;

  @override
  String toString() {
    return 'User(id: $id, username: $username, usertag: $usertag, type: $type, status: $status, followersCount: $followersCount, followingCount: $followingCount, animesViewedCount: $animesViewedCount, watchlistCount: $watchlistCount, followed: $followed, isFollowingMe: $isFollowingMe)';
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
                other.isFollowingMe == isFollowingMe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      usertag,
      type,
      status,
      followersCount,
      followingCount,
      animesViewedCount,
      watchlistCount,
      followed,
      isFollowingMe);

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
      required final String username,
      required final String usertag,
      required final String type,
      required final String status,
      @JsonKey(name: 'followers_count') required final int followersCount,
      @JsonKey(name: 'following_count') required final int followingCount,
      @JsonKey(name: 'animes_viewed_count')
      required final int animesViewedCount,
      @JsonKey(name: 'watchlist_count') required final int watchlistCount,
      required final bool followed,
      @JsonKey(name: 'is_following_me')
      required final bool isFollowingMe}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get usertag;
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
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
