// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_anime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenreAnime _$GenreAnimeFromJson(Map<String, dynamic> json) {
  return _GenreAnime.fromJson(json);
}

/// @nodoc
mixin _$GenreAnime {
  List<String> get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreAnimeCopyWith<GenreAnime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreAnimeCopyWith<$Res> {
  factory $GenreAnimeCopyWith(
          GenreAnime value, $Res Function(GenreAnime) then) =
      _$GenreAnimeCopyWithImpl<$Res, GenreAnime>;
  @useResult
  $Res call({List<String> response});
}

/// @nodoc
class _$GenreAnimeCopyWithImpl<$Res, $Val extends GenreAnime>
    implements $GenreAnimeCopyWith<$Res> {
  _$GenreAnimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenreAnimeImplCopyWith<$Res>
    implements $GenreAnimeCopyWith<$Res> {
  factory _$$GenreAnimeImplCopyWith(
          _$GenreAnimeImpl value, $Res Function(_$GenreAnimeImpl) then) =
      __$$GenreAnimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> response});
}

/// @nodoc
class __$$GenreAnimeImplCopyWithImpl<$Res>
    extends _$GenreAnimeCopyWithImpl<$Res, _$GenreAnimeImpl>
    implements _$$GenreAnimeImplCopyWith<$Res> {
  __$$GenreAnimeImplCopyWithImpl(
      _$GenreAnimeImpl _value, $Res Function(_$GenreAnimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$GenreAnimeImpl(
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreAnimeImpl implements _GenreAnime {
  const _$GenreAnimeImpl({required final List<String> response})
      : _response = response;

  factory _$GenreAnimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreAnimeImplFromJson(json);

  final List<String> _response;
  @override
  List<String> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  String toString() {
    return 'GenreAnime(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreAnimeImpl &&
            const DeepCollectionEquality().equals(other._response, _response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_response));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreAnimeImplCopyWith<_$GenreAnimeImpl> get copyWith =>
      __$$GenreAnimeImplCopyWithImpl<_$GenreAnimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreAnimeImplToJson(
      this,
    );
  }
}

abstract class _GenreAnime implements GenreAnime {
  const factory _GenreAnime({required final List<String> response}) =
      _$GenreAnimeImpl;

  factory _GenreAnime.fromJson(Map<String, dynamic> json) =
      _$GenreAnimeImpl.fromJson;

  @override
  List<String> get response;
  @override
  @JsonKey(ignore: true)
  _$$GenreAnimeImplCopyWith<_$GenreAnimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
