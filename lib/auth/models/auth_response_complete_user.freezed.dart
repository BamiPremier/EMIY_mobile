// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_complete_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResponseCompleteUser _$AuthResponseCompleteUserFromJson(
    Map<String, dynamic> json) {
  return _AuthResponseCompleteUser.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseCompleteUser {
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResponseCompleteUserCopyWith<AuthResponseCompleteUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCompleteUserCopyWith<$Res> {
  factory $AuthResponseCompleteUserCopyWith(AuthResponseCompleteUser value,
          $Res Function(AuthResponseCompleteUser) then) =
      _$AuthResponseCompleteUserCopyWithImpl<$Res, AuthResponseCompleteUser>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthResponseCompleteUserCopyWithImpl<$Res,
        $Val extends AuthResponseCompleteUser>
    implements $AuthResponseCompleteUserCopyWith<$Res> {
  _$AuthResponseCompleteUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$AuthResponseCompleteUserImplCopyWith<$Res>
    implements $AuthResponseCompleteUserCopyWith<$Res> {
  factory _$$AuthResponseCompleteUserImplCopyWith(
          _$AuthResponseCompleteUserImpl value,
          $Res Function(_$AuthResponseCompleteUserImpl) then) =
      __$$AuthResponseCompleteUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthResponseCompleteUserImplCopyWithImpl<$Res>
    extends _$AuthResponseCompleteUserCopyWithImpl<$Res,
        _$AuthResponseCompleteUserImpl>
    implements _$$AuthResponseCompleteUserImplCopyWith<$Res> {
  __$$AuthResponseCompleteUserImplCopyWithImpl(
      _$AuthResponseCompleteUserImpl _value,
      $Res Function(_$AuthResponseCompleteUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthResponseCompleteUserImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseCompleteUserImpl implements _AuthResponseCompleteUser {
  const _$AuthResponseCompleteUserImpl({required this.user});

  factory _$AuthResponseCompleteUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseCompleteUserImplFromJson(json);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthResponseCompleteUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseCompleteUserImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseCompleteUserImplCopyWith<_$AuthResponseCompleteUserImpl>
      get copyWith => __$$AuthResponseCompleteUserImplCopyWithImpl<
          _$AuthResponseCompleteUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseCompleteUserImplToJson(
      this,
    );
  }
}

abstract class _AuthResponseCompleteUser implements AuthResponseCompleteUser {
  const factory _AuthResponseCompleteUser({required final User user}) =
      _$AuthResponseCompleteUserImpl;

  factory _AuthResponseCompleteUser.fromJson(Map<String, dynamic> json) =
      _$AuthResponseCompleteUserImpl.fromJson;

  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthResponseCompleteUserImplCopyWith<_$AuthResponseCompleteUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
