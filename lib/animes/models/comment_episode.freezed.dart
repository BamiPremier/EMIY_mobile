// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentEpisode _$CommentEpisodeFromJson(Map<String, dynamic> json) {
  return _CommentEpisode.fromJson(json);
}

/// @nodoc
mixin _$CommentEpisode {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_liked')
  bool get hasLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_responses_count')
  int get commentResponsesCount => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CommentEpisode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentEpisode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentEpisodeCopyWith<CommentEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentEpisodeCopyWith<$Res> {
  factory $CommentEpisodeCopyWith(
          CommentEpisode value, $Res Function(CommentEpisode) then) =
      _$CommentEpisodeCopyWithImpl<$Res, CommentEpisode>;
  @useResult
  $Res call(
      {String id,
      String content,
      @JsonKey(name: 'has_liked') bool hasLiked,
      @JsonKey(name: 'comment_responses_count') int commentResponsesCount,
      User user,
      @JsonKey(name: 'created_at') @DateTimeConverter() DateTime createdAt});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$CommentEpisodeCopyWithImpl<$Res, $Val extends CommentEpisode>
    implements $CommentEpisodeCopyWith<$Res> {
  _$CommentEpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentEpisode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? hasLiked = null,
    Object? commentResponsesCount = null,
    Object? user = null,
    Object? createdAt = null,
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
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentResponsesCount: null == commentResponsesCount
          ? _value.commentResponsesCount
          : commentResponsesCount // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of CommentEpisode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentEpisodeImplCopyWith<$Res>
    implements $CommentEpisodeCopyWith<$Res> {
  factory _$$CommentEpisodeImplCopyWith(_$CommentEpisodeImpl value,
          $Res Function(_$CommentEpisodeImpl) then) =
      __$$CommentEpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      @JsonKey(name: 'has_liked') bool hasLiked,
      @JsonKey(name: 'comment_responses_count') int commentResponsesCount,
      User user,
      @JsonKey(name: 'created_at') @DateTimeConverter() DateTime createdAt});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$CommentEpisodeImplCopyWithImpl<$Res>
    extends _$CommentEpisodeCopyWithImpl<$Res, _$CommentEpisodeImpl>
    implements _$$CommentEpisodeImplCopyWith<$Res> {
  __$$CommentEpisodeImplCopyWithImpl(
      _$CommentEpisodeImpl _value, $Res Function(_$CommentEpisodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentEpisode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? hasLiked = null,
    Object? commentResponsesCount = null,
    Object? user = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommentEpisodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentResponsesCount: null == commentResponsesCount
          ? _value.commentResponsesCount
          : commentResponsesCount // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentEpisodeImpl implements _CommentEpisode {
  _$CommentEpisodeImpl(
      {required this.id,
      required this.content,
      @JsonKey(name: 'has_liked') required this.hasLiked,
      @JsonKey(name: 'comment_responses_count')
      required this.commentResponsesCount,
      required this.user,
      @JsonKey(name: 'created_at')
      @DateTimeConverter()
      required this.createdAt});

  factory _$CommentEpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentEpisodeImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  @JsonKey(name: 'has_liked')
  final bool hasLiked;
  @override
  @JsonKey(name: 'comment_responses_count')
  final int commentResponsesCount;
  @override
  final User user;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'CommentEpisode(id: $id, content: $content, hasLiked: $hasLiked, commentResponsesCount: $commentResponsesCount, user: $user, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentEpisodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.hasLiked, hasLiked) ||
                other.hasLiked == hasLiked) &&
            (identical(other.commentResponsesCount, commentResponsesCount) ||
                other.commentResponsesCount == commentResponsesCount) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, hasLiked,
      commentResponsesCount, user, createdAt);

  /// Create a copy of CommentEpisode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentEpisodeImplCopyWith<_$CommentEpisodeImpl> get copyWith =>
      __$$CommentEpisodeImplCopyWithImpl<_$CommentEpisodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentEpisodeImplToJson(
      this,
    );
  }
}

abstract class _CommentEpisode implements CommentEpisode {
  factory _CommentEpisode(
      {required final String id,
      required final String content,
      @JsonKey(name: 'has_liked') required final bool hasLiked,
      @JsonKey(name: 'comment_responses_count')
      required final int commentResponsesCount,
      required final User user,
      @JsonKey(name: 'created_at')
      @DateTimeConverter()
      required final DateTime createdAt}) = _$CommentEpisodeImpl;

  factory _CommentEpisode.fromJson(Map<String, dynamic> json) =
      _$CommentEpisodeImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  @JsonKey(name: 'has_liked')
  bool get hasLiked;
  @override
  @JsonKey(name: 'comment_responses_count')
  int get commentResponsesCount;
  @override
  User get user;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  DateTime get createdAt;

  /// Create a copy of CommentEpisode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentEpisodeImplCopyWith<_$CommentEpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
