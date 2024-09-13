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
  User get followes => throw _privateConstructorUsedError;
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
  $Res call({User followes, int total});

  $UserCopyWith<$Res> get followes;
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
    Object? followes = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      followes: null == followes
          ? _value.followes
          : followes // ignore: cast_nullable_to_non_nullable
              as User,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get followes {
    return $UserCopyWith<$Res>(_value.followes, (value) {
      return _then(_value.copyWith(followes: value) as $Val);
    });
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
  $Res call({User followes, int total});

  @override
  $UserCopyWith<$Res> get followes;
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
    Object? followes = null,
    Object? total = null,
  }) {
    return _then(_$FollowerResponseImpl(
      followes: null == followes
          ? _value.followes
          : followes // ignore: cast_nullable_to_non_nullable
              as User,
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
  const _$FollowerResponseImpl({required this.followes, required this.total});

  factory _$FollowerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowerResponseImplFromJson(json);

  @override
  final User followes;
  @override
  final int total;

  @override
  String toString() {
    return 'FollowerResponse(followes: $followes, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowerResponseImpl &&
            (identical(other.followes, followes) ||
                other.followes == followes) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, followes, total);

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
      {required final User followes,
      required final int total}) = _$FollowerResponseImpl;

  factory _FollowerResponse.fromJson(Map<String, dynamic> json) =
      _$FollowerResponseImpl.fromJson;

  @override
  User get followes;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$FollowerResponseImplCopyWith<_$FollowerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
