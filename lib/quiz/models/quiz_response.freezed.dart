// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizQuestionResponse _$QuizQuestionResponseFromJson(Map<String, dynamic> json) {
  return _QuizQuestionResponse.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestionResponse {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_id')
  String get quizId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  int get updatedAt => throw _privateConstructorUsedError;
  List<QuizResponse> get responses => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get version => throw _privateConstructorUsedError;

  /// Serializes this QuizQuestionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizQuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizQuestionResponseCopyWith<QuizQuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionResponseCopyWith<$Res> {
  factory $QuizQuestionResponseCopyWith(QuizQuestionResponse value,
          $Res Function(QuizQuestionResponse) then) =
      _$QuizQuestionResponseCopyWithImpl<$Res, QuizQuestionResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String label,
      String? image,
      @JsonKey(name: 'quiz_id') String quizId,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'updated_at') int updatedAt,
      List<QuizResponse> responses,
      @JsonKey(name: '__v') int version});
}

/// @nodoc
class _$QuizQuestionResponseCopyWithImpl<$Res,
        $Val extends QuizQuestionResponse>
    implements $QuizQuestionResponseCopyWith<$Res> {
  _$QuizQuestionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizQuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? image = freezed,
    Object? quizId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? responses = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      responses: null == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<QuizResponse>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizQuestionResponseImplCopyWith<$Res>
    implements $QuizQuestionResponseCopyWith<$Res> {
  factory _$$QuizQuestionResponseImplCopyWith(_$QuizQuestionResponseImpl value,
          $Res Function(_$QuizQuestionResponseImpl) then) =
      __$$QuizQuestionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String label,
      String? image,
      @JsonKey(name: 'quiz_id') String quizId,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'updated_at') int updatedAt,
      List<QuizResponse> responses,
      @JsonKey(name: '__v') int version});
}

/// @nodoc
class __$$QuizQuestionResponseImplCopyWithImpl<$Res>
    extends _$QuizQuestionResponseCopyWithImpl<$Res, _$QuizQuestionResponseImpl>
    implements _$$QuizQuestionResponseImplCopyWith<$Res> {
  __$$QuizQuestionResponseImplCopyWithImpl(_$QuizQuestionResponseImpl _value,
      $Res Function(_$QuizQuestionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizQuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? image = freezed,
    Object? quizId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? responses = null,
    Object? version = null,
  }) {
    return _then(_$QuizQuestionResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      responses: null == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<QuizResponse>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQuestionResponseImpl extends _QuizQuestionResponse {
  const _$QuizQuestionResponseImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.label,
      this.image,
      @JsonKey(name: 'quiz_id') required this.quizId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required final List<QuizResponse> responses,
      @JsonKey(name: '__v') this.version = 0})
      : _responses = responses,
        super._();

  factory _$QuizQuestionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQuestionResponseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String label;
  @override
  final String? image;
  @override
  @JsonKey(name: 'quiz_id')
  final String quizId;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  final List<QuizResponse> _responses;
  @override
  List<QuizResponse> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  @override
  @JsonKey(name: '__v')
  final int version;

  @override
  String toString() {
    return 'QuizQuestionResponse(id: $id, label: $label, image: $image, quizId: $quizId, createdAt: $createdAt, updatedAt: $updatedAt, responses: $responses, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQuestionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      image,
      quizId,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_responses),
      version);

  /// Create a copy of QuizQuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQuestionResponseImplCopyWith<_$QuizQuestionResponseImpl>
      get copyWith =>
          __$$QuizQuestionResponseImplCopyWithImpl<_$QuizQuestionResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQuestionResponseImplToJson(
      this,
    );
  }
}

abstract class _QuizQuestionResponse extends QuizQuestionResponse {
  const factory _QuizQuestionResponse(
      {@JsonKey(name: '_id') required final String id,
      required final String label,
      final String? image,
      @JsonKey(name: 'quiz_id') required final String quizId,
      @JsonKey(name: 'created_at') required final int createdAt,
      @JsonKey(name: 'updated_at') required final int updatedAt,
      required final List<QuizResponse> responses,
      @JsonKey(name: '__v') final int version}) = _$QuizQuestionResponseImpl;
  const _QuizQuestionResponse._() : super._();

  factory _QuizQuestionResponse.fromJson(Map<String, dynamic> json) =
      _$QuizQuestionResponseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get label;
  @override
  String? get image;
  @override
  @JsonKey(name: 'quiz_id')
  String get quizId;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  int get updatedAt;
  @override
  List<QuizResponse> get responses;
  @override
  @JsonKey(name: '__v')
  int get version;

  /// Create a copy of QuizQuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizQuestionResponseImplCopyWith<_$QuizQuestionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) {
  return _QuizResponse.fromJson(json);
}

/// @nodoc
mixin _$QuizResponse {
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCorrect')
  bool get isCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this QuizResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResponseCopyWith<QuizResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResponseCopyWith<$Res> {
  factory $QuizResponseCopyWith(
          QuizResponse value, $Res Function(QuizResponse) then) =
      _$QuizResponseCopyWithImpl<$Res, QuizResponse>;
  @useResult
  $Res call(
      {String label,
      @JsonKey(name: 'isCorrect') bool isCorrect,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$QuizResponseCopyWithImpl<$Res, $Val extends QuizResponse>
    implements $QuizResponseCopyWith<$Res> {
  _$QuizResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? isCorrect = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResponseImplCopyWith<$Res>
    implements $QuizResponseCopyWith<$Res> {
  factory _$$QuizResponseImplCopyWith(
          _$QuizResponseImpl value, $Res Function(_$QuizResponseImpl) then) =
      __$$QuizResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      @JsonKey(name: 'isCorrect') bool isCorrect,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$QuizResponseImplCopyWithImpl<$Res>
    extends _$QuizResponseCopyWithImpl<$Res, _$QuizResponseImpl>
    implements _$$QuizResponseImplCopyWith<$Res> {
  __$$QuizResponseImplCopyWithImpl(
      _$QuizResponseImpl _value, $Res Function(_$QuizResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? isCorrect = null,
    Object? id = freezed,
  }) {
    return _then(_$QuizResponseImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResponseImpl implements _QuizResponse {
  const _$QuizResponseImpl(
      {required this.label,
      @JsonKey(name: 'isCorrect') required this.isCorrect,
      @JsonKey(name: '_id') this.id});

  factory _$QuizResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResponseImplFromJson(json);

  @override
  final String label;
  @override
  @JsonKey(name: 'isCorrect')
  final bool isCorrect;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'QuizResponse(label: $label, isCorrect: $isCorrect, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResponseImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, isCorrect, id);

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResponseImplCopyWith<_$QuizResponseImpl> get copyWith =>
      __$$QuizResponseImplCopyWithImpl<_$QuizResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResponseImplToJson(
      this,
    );
  }
}

abstract class _QuizResponse implements QuizResponse {
  const factory _QuizResponse(
      {required final String label,
      @JsonKey(name: 'isCorrect') required final bool isCorrect,
      @JsonKey(name: '_id') final String? id}) = _$QuizResponseImpl;

  factory _QuizResponse.fromJson(Map<String, dynamic> json) =
      _$QuizResponseImpl.fromJson;

  @override
  String get label;
  @override
  @JsonKey(name: 'isCorrect')
  bool get isCorrect;
  @override
  @JsonKey(name: '_id')
  String? get id;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResponseImplCopyWith<_$QuizResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
