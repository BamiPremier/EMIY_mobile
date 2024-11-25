// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activitie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Activitie _$ActivitieFromJson(Map<String, dynamic> json) {
  return _Activitie.fromJson(json);
}

/// @nodoc
mixin _$Activitie {
  String get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_entity')
  String get targetEntity => throw _privateConstructorUsedError;
  dynamic get target => throw _privateConstructorUsedError;
  dynamic get subTarget => throw _privateConstructorUsedError;

  /// Serializes this Activitie to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Activitie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivitieCopyWith<Activitie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivitieCopyWith<$Res> {
  factory $ActivitieCopyWith(Activitie value, $Res Function(Activitie) then) =
      _$ActivitieCopyWithImpl<$Res, Activitie>;
  @useResult
  $Res call(
      {String id,
      User user,
      @JsonKey(name: 'created_at') @DateTimeConverter() DateTime createdAt,
      bool isPrivate,
      @JsonKey(name: 'target_entity') String targetEntity,
      dynamic target,
      dynamic subTarget});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ActivitieCopyWithImpl<$Res, $Val extends Activitie>
    implements $ActivitieCopyWith<$Res> {
  _$ActivitieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Activitie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? createdAt = null,
    Object? isPrivate = null,
    Object? targetEntity = null,
    Object? target = freezed,
    Object? subTarget = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      targetEntity: null == targetEntity
          ? _value.targetEntity
          : targetEntity // ignore: cast_nullable_to_non_nullable
              as String,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subTarget: freezed == subTarget
          ? _value.subTarget
          : subTarget // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of Activitie
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
abstract class _$$ActivitieImplCopyWith<$Res>
    implements $ActivitieCopyWith<$Res> {
  factory _$$ActivitieImplCopyWith(
          _$ActivitieImpl value, $Res Function(_$ActivitieImpl) then) =
      __$$ActivitieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      User user,
      @JsonKey(name: 'created_at') @DateTimeConverter() DateTime createdAt,
      bool isPrivate,
      @JsonKey(name: 'target_entity') String targetEntity,
      dynamic target,
      dynamic subTarget});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ActivitieImplCopyWithImpl<$Res>
    extends _$ActivitieCopyWithImpl<$Res, _$ActivitieImpl>
    implements _$$ActivitieImplCopyWith<$Res> {
  __$$ActivitieImplCopyWithImpl(
      _$ActivitieImpl _value, $Res Function(_$ActivitieImpl) _then)
      : super(_value, _then);

  /// Create a copy of Activitie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? createdAt = null,
    Object? isPrivate = null,
    Object? targetEntity = null,
    Object? target = freezed,
    Object? subTarget = freezed,
  }) {
    return _then(_$ActivitieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      targetEntity: null == targetEntity
          ? _value.targetEntity
          : targetEntity // ignore: cast_nullable_to_non_nullable
              as String,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subTarget: freezed == subTarget
          ? _value.subTarget
          : subTarget // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivitieImpl extends _Activitie {
  const _$ActivitieImpl(
      {required this.id,
      required this.user,
      @JsonKey(name: 'created_at') @DateTimeConverter() required this.createdAt,
      required this.isPrivate,
      @JsonKey(name: 'target_entity') required this.targetEntity,
      required this.target,
      this.subTarget})
      : super._();

  factory _$ActivitieImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivitieImplFromJson(json);

  @override
  final String id;
  @override
  final User user;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final bool isPrivate;
  @override
  @JsonKey(name: 'target_entity')
  final String targetEntity;
  @override
  final dynamic target;
  @override
  final dynamic subTarget;

  @override
  String toString() {
    return 'Activitie(id: $id, user: $user, createdAt: $createdAt, isPrivate: $isPrivate, targetEntity: $targetEntity, target: $target, subTarget: $subTarget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivitieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.targetEntity, targetEntity) ||
                other.targetEntity == targetEntity) &&
            const DeepCollectionEquality().equals(other.target, target) &&
            const DeepCollectionEquality().equals(other.subTarget, subTarget));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      createdAt,
      isPrivate,
      targetEntity,
      const DeepCollectionEquality().hash(target),
      const DeepCollectionEquality().hash(subTarget));

  /// Create a copy of Activitie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivitieImplCopyWith<_$ActivitieImpl> get copyWith =>
      __$$ActivitieImplCopyWithImpl<_$ActivitieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivitieImplToJson(
      this,
    );
  }
}

abstract class _Activitie extends Activitie {
  const factory _Activitie(
      {required final String id,
      required final User user,
      @JsonKey(name: 'created_at')
      @DateTimeConverter()
      required final DateTime createdAt,
      required final bool isPrivate,
      @JsonKey(name: 'target_entity') required final String targetEntity,
      required final dynamic target,
      final dynamic subTarget}) = _$ActivitieImpl;
  const _Activitie._() : super._();

  factory _Activitie.fromJson(Map<String, dynamic> json) =
      _$ActivitieImpl.fromJson;

  @override
  String get id;
  @override
  User get user;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  bool get isPrivate;
  @override
  @JsonKey(name: 'target_entity')
  String get targetEntity;
  @override
  dynamic get target;
  @override
  dynamic get subTarget;

  /// Create a copy of Activitie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivitieImplCopyWith<_$ActivitieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
