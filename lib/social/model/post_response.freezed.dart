// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) {
  return _PostResponse.fromJson(json);
}

/// @nodoc
mixin _$PostResponse {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<Post> get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostResponseCopyWith<PostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostResponseCopyWith<$Res> {
  factory $PostResponseCopyWith(
          PostResponse value, $Res Function(PostResponse) then) =
      _$PostResponseCopyWithImpl<$Res, PostResponse>;
  @useResult
  $Res call({int page, int size, int total, List<Post> content});
}

/// @nodoc
class _$PostResponseCopyWithImpl<$Res, $Val extends PostResponse>
    implements $PostResponseCopyWith<$Res> {
  _$PostResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? total = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostResponseImplCopyWith<$Res>
    implements $PostResponseCopyWith<$Res> {
  factory _$$PostResponseImplCopyWith(
          _$PostResponseImpl value, $Res Function(_$PostResponseImpl) then) =
      __$$PostResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size, int total, List<Post> content});
}

/// @nodoc
class __$$PostResponseImplCopyWithImpl<$Res>
    extends _$PostResponseCopyWithImpl<$Res, _$PostResponseImpl>
    implements _$$PostResponseImplCopyWith<$Res> {
  __$$PostResponseImplCopyWithImpl(
      _$PostResponseImpl _value, $Res Function(_$PostResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? total = null,
    Object? content = null,
  }) {
    return _then(_$PostResponseImpl(
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
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostResponseImpl implements _PostResponse {
  const _$PostResponseImpl(
      {this.page = 0,
      this.size = 0,
      this.total = 0,
      final List<Post> content = const []})
      : _content = content;

  factory _$PostResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostResponseImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int total;
  final List<Post> _content;
  @override
  @JsonKey()
  List<Post> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  String toString() {
    return 'PostResponse(page: $page, size: $size, total: $total, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, total,
      const DeepCollectionEquality().hash(_content));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostResponseImplCopyWith<_$PostResponseImpl> get copyWith =>
      __$$PostResponseImplCopyWithImpl<_$PostResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostResponseImplToJson(
      this,
    );
  }
}

abstract class _PostResponse implements PostResponse {
  const factory _PostResponse(
      {final int page,
      final int size,
      final int total,
      final List<Post> content}) = _$PostResponseImpl;

  factory _PostResponse.fromJson(Map<String, dynamic> json) =
      _$PostResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get size;
  @override
  int get total;
  @override
  List<Post> get content;
  @override
  @JsonKey(ignore: true)
  _$$PostResponseImplCopyWith<_$PostResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_me_liked')
  bool get isMeLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'nb_comments')
  int get nbComments => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String content,
      String? image,
      @JsonKey(name: 'is_me_liked') bool isMeLiked,
      @JsonKey(name: 'nb_comments') int nbComments,
      User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? image = freezed,
    Object? isMeLiked = null,
    Object? nbComments = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isMeLiked: null == isMeLiked
          ? _value.isMeLiked
          : isMeLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      nbComments: null == nbComments
          ? _value.nbComments
          : nbComments // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String? image,
      @JsonKey(name: 'is_me_liked') bool isMeLiked,
      @JsonKey(name: 'nb_comments') int nbComments,
      User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? image = freezed,
    Object? isMeLiked = null,
    Object? nbComments = null,
    Object? user = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isMeLiked: null == isMeLiked
          ? _value.isMeLiked
          : isMeLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      nbComments: null == nbComments
          ? _value.nbComments
          : nbComments // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.id,
      required this.content,
      this.image,
      @JsonKey(name: 'is_me_liked') this.isMeLiked = false,
      @JsonKey(name: 'nb_comments') this.nbComments = 0,
      required this.user});

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String? image;
  @override
  @JsonKey(name: 'is_me_liked')
  final bool isMeLiked;
  @override
  @JsonKey(name: 'nb_comments')
  final int nbComments;
  @override
  final User user;

  @override
  String toString() {
    return 'Post(id: $id, content: $content, image: $image, isMeLiked: $isMeLiked, nbComments: $nbComments, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isMeLiked, isMeLiked) ||
                other.isMeLiked == isMeLiked) &&
            (identical(other.nbComments, nbComments) ||
                other.nbComments == nbComments) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, image, isMeLiked, nbComments, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String id,
      required final String content,
      final String? image,
      @JsonKey(name: 'is_me_liked') final bool isMeLiked,
      @JsonKey(name: 'nb_comments') final int nbComments,
      required final User user}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String? get image;
  @override
  @JsonKey(name: 'is_me_liked')
  bool get isMeLiked;
  @override
  @JsonKey(name: 'nb_comments')
  int get nbComments;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get usertag => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get biography => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_full')
  String? get imageFull => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'id') String id,
      String username,
      String? usertag,
      String type,
      String status,
      String? biography,
      String? image,
      @JsonKey(name: 'image_full') String? imageFull,
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
    Object? usertag = freezed,
    Object? type = null,
    Object? status = null,
    Object? biography = freezed,
    Object? image = freezed,
    Object? imageFull = freezed,
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
      usertag: freezed == usertag
          ? _value.usertag
          : usertag // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFull: freezed == imageFull
          ? _value.imageFull
          : imageFull // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') String id,
      String username,
      String? usertag,
      String type,
      String status,
      String? biography,
      String? image,
      @JsonKey(name: 'image_full') String? imageFull,
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
    Object? usertag = freezed,
    Object? type = null,
    Object? status = null,
    Object? biography = freezed,
    Object? image = freezed,
    Object? imageFull = freezed,
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
      usertag: freezed == usertag
          ? _value.usertag
          : usertag // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFull: freezed == imageFull
          ? _value.imageFull
          : imageFull // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') required this.id,
      required this.username,
      this.usertag,
      required this.type,
      required this.status,
      this.biography,
      this.image,
      @JsonKey(name: 'image_full') this.imageFull,
      @JsonKey(name: 'followers_count') this.followersCount = 0,
      @JsonKey(name: 'following_count') this.followingCount = 0,
      @JsonKey(name: 'animes_viewed_count') this.animesViewedCount = 0,
      @JsonKey(name: 'watchlist_count') this.watchlistCount = 0,
      this.followed = false,
      @JsonKey(name: 'is_following_me') this.isFollowingMe = false});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  final String username;
  @override
  final String? usertag;
  @override
  final String type;
  @override
  final String status;
  @override
  final String? biography;
  @override
  final String? image;
  @override
  @JsonKey(name: 'image_full')
  final String? imageFull;
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
  String toString() {
    return 'User(id: $id, username: $username, usertag: $usertag, type: $type, status: $status, biography: $biography, image: $image, imageFull: $imageFull, followersCount: $followersCount, followingCount: $followingCount, animesViewedCount: $animesViewedCount, watchlistCount: $watchlistCount, followed: $followed, isFollowingMe: $isFollowingMe)';
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
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageFull, imageFull) ||
                other.imageFull == imageFull) &&
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
      biography,
      image,
      imageFull,
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
      {@JsonKey(name: 'id') required final String id,
      required final String username,
      final String? usertag,
      required final String type,
      required final String status,
      final String? biography,
      final String? image,
      @JsonKey(name: 'image_full') final String? imageFull,
      @JsonKey(name: 'followers_count') final int followersCount,
      @JsonKey(name: 'following_count') final int followingCount,
      @JsonKey(name: 'animes_viewed_count') final int animesViewedCount,
      @JsonKey(name: 'watchlist_count') final int watchlistCount,
      final bool followed,
      @JsonKey(name: 'is_following_me') final bool isFollowingMe}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  String get username;
  @override
  String? get usertag;
  @override
  String get type;
  @override
  String get status;
  @override
  String? get biography;
  @override
  String? get image;
  @override
  @JsonKey(name: 'image_full')
  String? get imageFull;
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
