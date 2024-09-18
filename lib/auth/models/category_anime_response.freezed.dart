// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_anime_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryAnimeResponse _$CategoryAnimeResponseFromJson(
    Map<String, dynamic> json) {
  return _CategoryAnimeResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryAnimeResponse {
  List<String> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryAnimeResponseCopyWith<CategoryAnimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryAnimeResponseCopyWith<$Res> {
  factory $CategoryAnimeResponseCopyWith(CategoryAnimeResponse value,
          $Res Function(CategoryAnimeResponse) then) =
      _$CategoryAnimeResponseCopyWithImpl<$Res, CategoryAnimeResponse>;
  @useResult
  $Res call({List<String> genres});
}

/// @nodoc
class _$CategoryAnimeResponseCopyWithImpl<$Res,
        $Val extends CategoryAnimeResponse>
    implements $CategoryAnimeResponseCopyWith<$Res> {
  _$CategoryAnimeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryAnimeResponseImplCopyWith<$Res>
    implements $CategoryAnimeResponseCopyWith<$Res> {
  factory _$$CategoryAnimeResponseImplCopyWith(
          _$CategoryAnimeResponseImpl value,
          $Res Function(_$CategoryAnimeResponseImpl) then) =
      __$$CategoryAnimeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> genres});
}

/// @nodoc
class __$$CategoryAnimeResponseImplCopyWithImpl<$Res>
    extends _$CategoryAnimeResponseCopyWithImpl<$Res,
        _$CategoryAnimeResponseImpl>
    implements _$$CategoryAnimeResponseImplCopyWith<$Res> {
  __$$CategoryAnimeResponseImplCopyWithImpl(_$CategoryAnimeResponseImpl _value,
      $Res Function(_$CategoryAnimeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_$CategoryAnimeResponseImpl(
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryAnimeResponseImpl implements _CategoryAnimeResponse {
  const _$CategoryAnimeResponseImpl({required final List<String> genres})
      : _genres = genres;

  factory _$CategoryAnimeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryAnimeResponseImplFromJson(json);

  final List<String> _genres;
  @override
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'CategoryAnimeResponse(genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryAnimeResponseImpl &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryAnimeResponseImplCopyWith<_$CategoryAnimeResponseImpl>
      get copyWith => __$$CategoryAnimeResponseImplCopyWithImpl<
          _$CategoryAnimeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryAnimeResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryAnimeResponse implements CategoryAnimeResponse {
  const factory _CategoryAnimeResponse({required final List<String> genres}) =
      _$CategoryAnimeResponseImpl;

  factory _CategoryAnimeResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryAnimeResponseImpl.fromJson;

  @override
  List<String> get genres;
  @override
  @JsonKey(ignore: true)
  _$$CategoryAnimeResponseImplCopyWith<_$CategoryAnimeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
