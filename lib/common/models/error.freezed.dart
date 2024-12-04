// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return _Error.fromJson(json);
}

/// @nodoc
mixin _$Error {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_messages')
  List<IDisplayText>? get displayMessages => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_code')
  int get statusCode => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Error to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res, Error>;
  @useResult
  $Res call(
      {String code,
      String message,
      @JsonKey(name: 'display_messages') List<IDisplayText>? displayMessages,
      Map<String, dynamic>? details,
      @JsonKey(name: 'status_code') int statusCode,
      String url});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res, $Val extends Error>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? displayMessages = freezed,
    Object? details = freezed,
    Object? statusCode = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      displayMessages: freezed == displayMessages
          ? _value.displayMessages
          : displayMessages // ignore: cast_nullable_to_non_nullable
              as List<IDisplayText>?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $ErrorCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String message,
      @JsonKey(name: 'display_messages') List<IDisplayText>? displayMessages,
      Map<String, dynamic>? details,
      @JsonKey(name: 'status_code') int statusCode,
      String url});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ErrorCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? displayMessages = freezed,
    Object? details = freezed,
    Object? statusCode = null,
    Object? url = null,
  }) {
    return _then(_$ErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      displayMessages: freezed == displayMessages
          ? _value._displayMessages
          : displayMessages // ignore: cast_nullable_to_non_nullable
              as List<IDisplayText>?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorImpl extends _Error {
  _$ErrorImpl(
      {required this.code,
      required this.message,
      @JsonKey(name: 'display_messages')
      final List<IDisplayText>? displayMessages,
      final Map<String, dynamic>? details,
      @JsonKey(name: 'status_code') required this.statusCode,
      required this.url})
      : _displayMessages = displayMessages,
        _details = details,
        super._();

  factory _$ErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  final List<IDisplayText>? _displayMessages;
  @override
  @JsonKey(name: 'display_messages')
  List<IDisplayText>? get displayMessages {
    final value = _displayMessages;
    if (value == null) return null;
    if (_displayMessages is EqualUnmodifiableListView) return _displayMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'status_code')
  final int statusCode;
  @override
  final String url;

  @override
  String toString() {
    return 'Error(code: $code, message: $message, displayMessages: $displayMessages, details: $details, statusCode: $statusCode, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._displayMessages, _displayMessages) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      message,
      const DeepCollectionEquality().hash(_displayMessages),
      const DeepCollectionEquality().hash(_details),
      statusCode,
      url);

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorImplToJson(
      this,
    );
  }
}

abstract class _Error extends Error {
  factory _Error(
      {required final String code,
      required final String message,
      @JsonKey(name: 'display_messages')
      final List<IDisplayText>? displayMessages,
      final Map<String, dynamic>? details,
      @JsonKey(name: 'status_code') required final int statusCode,
      required final String url}) = _$ErrorImpl;
  _Error._() : super._();

  factory _Error.fromJson(Map<String, dynamic> json) = _$ErrorImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  @JsonKey(name: 'display_messages')
  List<IDisplayText>? get displayMessages;
  @override
  Map<String, dynamic>? get details;
  @override
  @JsonKey(name: 'status_code')
  int get statusCode;
  @override
  String get url;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IDisplayText _$IDisplayTextFromJson(Map<String, dynamic> json) {
  return _IDisplayText.fromJson(json);
}

/// @nodoc
mixin _$IDisplayText {
  String get lang => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this IDisplayText to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IDisplayText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IDisplayTextCopyWith<IDisplayText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IDisplayTextCopyWith<$Res> {
  factory $IDisplayTextCopyWith(
          IDisplayText value, $Res Function(IDisplayText) then) =
      _$IDisplayTextCopyWithImpl<$Res, IDisplayText>;
  @useResult
  $Res call({String lang, String value});
}

/// @nodoc
class _$IDisplayTextCopyWithImpl<$Res, $Val extends IDisplayText>
    implements $IDisplayTextCopyWith<$Res> {
  _$IDisplayTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IDisplayText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IDisplayTextImplCopyWith<$Res>
    implements $IDisplayTextCopyWith<$Res> {
  factory _$$IDisplayTextImplCopyWith(
          _$IDisplayTextImpl value, $Res Function(_$IDisplayTextImpl) then) =
      __$$IDisplayTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lang, String value});
}

/// @nodoc
class __$$IDisplayTextImplCopyWithImpl<$Res>
    extends _$IDisplayTextCopyWithImpl<$Res, _$IDisplayTextImpl>
    implements _$$IDisplayTextImplCopyWith<$Res> {
  __$$IDisplayTextImplCopyWithImpl(
      _$IDisplayTextImpl _value, $Res Function(_$IDisplayTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of IDisplayText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? value = null,
  }) {
    return _then(_$IDisplayTextImpl(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IDisplayTextImpl extends _IDisplayText {
  _$IDisplayTextImpl({required this.lang, required this.value}) : super._();

  factory _$IDisplayTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$IDisplayTextImplFromJson(json);

  @override
  final String lang;
  @override
  final String value;

  @override
  String toString() {
    return 'IDisplayText(lang: $lang, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IDisplayTextImpl &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lang, value);

  /// Create a copy of IDisplayText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IDisplayTextImplCopyWith<_$IDisplayTextImpl> get copyWith =>
      __$$IDisplayTextImplCopyWithImpl<_$IDisplayTextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IDisplayTextImplToJson(
      this,
    );
  }
}

abstract class _IDisplayText extends IDisplayText {
  factory _IDisplayText(
      {required final String lang,
      required final String value}) = _$IDisplayTextImpl;
  _IDisplayText._() : super._();

  factory _IDisplayText.fromJson(Map<String, dynamic> json) =
      _$IDisplayTextImpl.fromJson;

  @override
  String get lang;
  @override
  String get value;

  /// Create a copy of IDisplayText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IDisplayTextImplCopyWith<_$IDisplayTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
