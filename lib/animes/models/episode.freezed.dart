// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return _Episode.fromJson(json);
}

/// @nodoc
mixin _$Episode {
  int get id => throw _privateConstructorUsedError;
  int get airingAt => throw _privateConstructorUsedError;
  int get timeUntilAiring => throw _privateConstructorUsedError;
  int get episode => throw _privateConstructorUsedError;
  Anime get anime => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_liked')
  bool get hasLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count')
  int get commentsCount => throw _privateConstructorUsedError;

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeCopyWith<Episode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) then) =
      _$EpisodeCopyWithImpl<$Res, Episode>;
  @useResult
  $Res call(
      {int id,
      int airingAt,
      int timeUntilAiring,
      int episode,
      Anime anime,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'has_liked') bool hasLiked,
      @JsonKey(name: 'comments_count') int commentsCount});

  $AnimeCopyWith<$Res> get anime;
}

/// @nodoc
class _$EpisodeCopyWithImpl<$Res, $Val extends Episode>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? airingAt = null,
    Object? timeUntilAiring = null,
    Object? episode = null,
    Object? anime = null,
    Object? likesCount = null,
    Object? hasLiked = null,
    Object? commentsCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      airingAt: null == airingAt
          ? _value.airingAt
          : airingAt // ignore: cast_nullable_to_non_nullable
              as int,
      timeUntilAiring: null == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as Anime,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeCopyWith<$Res> get anime {
    return $AnimeCopyWith<$Res>(_value.anime, (value) {
      return _then(_value.copyWith(anime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
          _$EpisodeImpl value, $Res Function(_$EpisodeImpl) then) =
      __$$EpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int airingAt,
      int timeUntilAiring,
      int episode,
      Anime anime,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'has_liked') bool hasLiked,
      @JsonKey(name: 'comments_count') int commentsCount});

  @override
  $AnimeCopyWith<$Res> get anime;
}

/// @nodoc
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$EpisodeCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
      _$EpisodeImpl _value, $Res Function(_$EpisodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? airingAt = null,
    Object? timeUntilAiring = null,
    Object? episode = null,
    Object? anime = null,
    Object? likesCount = null,
    Object? hasLiked = null,
    Object? commentsCount = null,
  }) {
    return _then(_$EpisodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      airingAt: null == airingAt
          ? _value.airingAt
          : airingAt // ignore: cast_nullable_to_non_nullable
              as int,
      timeUntilAiring: null == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as Anime,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeImpl extends _Episode {
  const _$EpisodeImpl(
      {required this.id,
      required this.airingAt,
      required this.timeUntilAiring,
      required this.episode,
      required this.anime,
      @JsonKey(name: 'likes_count') this.likesCount = 0,
      @JsonKey(name: 'has_liked') this.hasLiked = false,
      @JsonKey(name: 'comments_count') this.commentsCount = 0})
      : super._();

  factory _$EpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeImplFromJson(json);

  @override
  final int id;
  @override
  final int airingAt;
  @override
  final int timeUntilAiring;
  @override
  final int episode;
  @override
  final Anime anime;
  @override
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @override
  @JsonKey(name: 'has_liked')
  final bool hasLiked;
  @override
  @JsonKey(name: 'comments_count')
  final int commentsCount;

  @override
  String toString() {
    return 'Episode(id: $id, airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode, anime: $anime, likesCount: $likesCount, hasLiked: $hasLiked, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.airingAt, airingAt) ||
                other.airingAt == airingAt) &&
            (identical(other.timeUntilAiring, timeUntilAiring) ||
                other.timeUntilAiring == timeUntilAiring) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.hasLiked, hasLiked) ||
                other.hasLiked == hasLiked) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, airingAt, timeUntilAiring,
      episode, anime, likesCount, hasLiked, commentsCount);

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeImplToJson(
      this,
    );
  }
}

abstract class _Episode extends Episode {
  const factory _Episode(
          {required final int id,
          required final int airingAt,
          required final int timeUntilAiring,
          required final int episode,
          required final Anime anime,
          @JsonKey(name: 'likes_count') final int likesCount,
          @JsonKey(name: 'has_liked') final bool hasLiked,
          @JsonKey(name: 'comments_count') final int commentsCount}) =
      _$EpisodeImpl;
  const _Episode._() : super._();

  factory _Episode.fromJson(Map<String, dynamic> json) = _$EpisodeImpl.fromJson;

  @override
  int get id;
  @override
  int get airingAt;
  @override
  int get timeUntilAiring;
  @override
  int get episode;
  @override
  Anime get anime;
  @override
  @JsonKey(name: 'likes_count')
  int get likesCount;
  @override
  @JsonKey(name: 'has_liked')
  bool get hasLiked;
  @override
  @JsonKey(name: 'comments_count')
  int get commentsCount;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
