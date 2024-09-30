// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_liked')
  bool get hasLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count')
  int get commentsCount => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String id,
      String content,
      String? image,
      @JsonKey(name: 'has_liked') bool hasLiked,
      @JsonKey(name: 'comments_count') int commentsCount,
      User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

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
    Object? hasLiked = null,
    Object? commentsCount = null,
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
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String? image,
      @JsonKey(name: 'has_liked') bool hasLiked,
      @JsonKey(name: 'comments_count') int commentsCount,
      User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? image = freezed,
    Object? hasLiked = null,
    Object? commentsCount = null,
    Object? user = null,
  }) {
    return _then(_$CommentImpl(
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
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
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
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {required this.id,
      required this.content,
      this.image,
      @JsonKey(name: 'has_liked') this.hasLiked = false,
      @JsonKey(name: 'comments_count') this.commentsCount = 0,
      required this.user});

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String? image;
  @override
  @JsonKey(name: 'has_liked')
  final bool hasLiked;
  @override
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  @override
  final User user;

  @override
  String toString() {
    return 'Comment(id: $id, content: $content, image: $image, hasLiked: $hasLiked, commentsCount: $commentsCount, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.hasLiked, hasLiked) ||
                other.hasLiked == hasLiked) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, content, image, hasLiked, commentsCount, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final String id,
      required final String content,
      final String? image,
      @JsonKey(name: 'has_liked') final bool hasLiked,
      @JsonKey(name: 'comments_count') final int commentsCount,
      required final User user}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String? get image;
  @override
  @JsonKey(name: 'has_liked')
  bool get hasLiked;
  @override
  @JsonKey(name: 'comments_count')
  int get commentsCount;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
