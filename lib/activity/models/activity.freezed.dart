// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
mixin _$Activity {
  String get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool? get isPrivate => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_entity')
  String get targetEntity => throw _privateConstructorUsedError;
  dynamic get target => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_target')
  dynamic get subTarget => throw _privateConstructorUsedError;

  /// Serializes this Activity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call(
      {String id,
      User user,
      @JsonKey(name: 'created_at') @DateTimeConverter() DateTime createdAt,
      bool? isPrivate,
      @JsonKey(name: 'target_entity') String targetEntity,
      dynamic target,
      @JsonKey(name: 'sub_target') dynamic subTarget});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? createdAt = null,
    Object? isPrivate = freezed,
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
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
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

  /// Create a copy of Activity
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
abstract class _$$ActivityImplCopyWith<$Res>
    implements $ActivityCopyWith<$Res> {
  factory _$$ActivityImplCopyWith(
          _$ActivityImpl value, $Res Function(_$ActivityImpl) then) =
      __$$ActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      User user,
      @JsonKey(name: 'created_at') @DateTimeConverter() DateTime createdAt,
      bool? isPrivate,
      @JsonKey(name: 'target_entity') String targetEntity,
      dynamic target,
      @JsonKey(name: 'sub_target') dynamic subTarget});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ActivityImplCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$ActivityImpl>
    implements _$$ActivityImplCopyWith<$Res> {
  __$$ActivityImplCopyWithImpl(
      _$ActivityImpl _value, $Res Function(_$ActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? createdAt = null,
    Object? isPrivate = freezed,
    Object? targetEntity = null,
    Object? target = freezed,
    Object? subTarget = freezed,
  }) {
    return _then(_$ActivityImpl(
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
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$ActivityImpl extends _Activity {
  const _$ActivityImpl(
      {required this.id,
      required this.user,
      @JsonKey(name: 'created_at') @DateTimeConverter() required this.createdAt,
      this.isPrivate,
      @JsonKey(name: 'target_entity') required this.targetEntity,
      required this.target,
      @JsonKey(name: 'sub_target') this.subTarget})
      : super._();

  factory _$ActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityImplFromJson(json);

  @override
  final String id;
  @override
  final User user;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final bool? isPrivate;
  @override
  @JsonKey(name: 'target_entity')
  final String targetEntity;
  @override
  final dynamic target;
  @override
  @JsonKey(name: 'sub_target')
  final dynamic subTarget;

  @override
  String toString() {
    return 'Activity(id: $id, user: $user, createdAt: $createdAt, isPrivate: $isPrivate, targetEntity: $targetEntity, target: $target, subTarget: $subTarget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityImpl &&
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

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      __$$ActivityImplCopyWithImpl<_$ActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityImplToJson(
      this,
    );
  }
}

abstract class _Activity extends Activity {
  const factory _Activity(
      {required final String id,
      required final User user,
      @JsonKey(name: 'created_at')
      @DateTimeConverter()
      required final DateTime createdAt,
      final bool? isPrivate,
      @JsonKey(name: 'target_entity') required final String targetEntity,
      required final dynamic target,
      @JsonKey(name: 'sub_target') final dynamic subTarget}) = _$ActivityImpl;
  const _Activity._() : super._();

  factory _Activity.fromJson(Map<String, dynamic> json) =
      _$ActivityImpl.fromJson;

  @override
  String get id;
  @override
  User get user;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  bool? get isPrivate;
  @override
  @JsonKey(name: 'target_entity')
  String get targetEntity;
  @override
  dynamic get target;
  @override
  @JsonKey(name: 'sub_target')
  dynamic get subTarget;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
