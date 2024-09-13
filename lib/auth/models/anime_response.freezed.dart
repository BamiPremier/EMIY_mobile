// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnimeResponse _$AnimeResponseFromJson(Map<String, dynamic> json) {
  return _AnimeResponse.fromJson(json);
}

/// @nodoc
mixin _$AnimeResponse {
  User get user => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeResponseCopyWith<AnimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeResponseCopyWith<$Res> {
  factory $AnimeResponseCopyWith(
          AnimeResponse value, $Res Function(AnimeResponse) then) =
      _$AnimeResponseCopyWithImpl<$Res, AnimeResponse>;
  @useResult
  $Res call({User user, bool status});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AnimeResponseCopyWithImpl<$Res, $Val extends AnimeResponse>
    implements $AnimeResponseCopyWith<$Res> {
  _$AnimeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$AnimeResponseImplCopyWith<$Res>
    implements $AnimeResponseCopyWith<$Res> {
  factory _$$AnimeResponseImplCopyWith(
          _$AnimeResponseImpl value, $Res Function(_$AnimeResponseImpl) then) =
      __$$AnimeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, bool status});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AnimeResponseImplCopyWithImpl<$Res>
    extends _$AnimeResponseCopyWithImpl<$Res, _$AnimeResponseImpl>
    implements _$$AnimeResponseImplCopyWith<$Res> {
  __$$AnimeResponseImplCopyWithImpl(
      _$AnimeResponseImpl _value, $Res Function(_$AnimeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? status = null,
  }) {
    return _then(_$AnimeResponseImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeResponseImpl implements _AnimeResponse {
  const _$AnimeResponseImpl({required this.user, required this.status});

  factory _$AnimeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeResponseImplFromJson(json);

  @override
  final User user;
  @override
  final bool status;

  @override
  String toString() {
    return 'AnimeResponse(user: $user, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeResponseImplCopyWith<_$AnimeResponseImpl> get copyWith =>
      __$$AnimeResponseImplCopyWithImpl<_$AnimeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeResponseImplToJson(
      this,
    );
  }
}

abstract class _AnimeResponse implements AnimeResponse {
  const factory _AnimeResponse(
      {required final User user,
      required final bool status}) = _$AnimeResponseImpl;

  factory _AnimeResponse.fromJson(Map<String, dynamic> json) =
      _$AnimeResponseImpl.fromJson;

  @override
  User get user;
  @override
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$AnimeResponseImplCopyWith<_$AnimeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
