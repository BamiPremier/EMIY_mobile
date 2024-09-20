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
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  List<User> get content => throw _privateConstructorUsedError;
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
  $Res call({int page, int size, List<User> content, int total});
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
    Object? page = null,
    Object? size = null,
    Object? content = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<User>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
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
  $Res call({int page, int size, List<User> content, int total});
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
    Object? page = null,
    Object? size = null,
    Object? content = null,
    Object? total = null,
  }) {
    return _then(_$FollowerResponseImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<User>,
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
  const _$FollowerResponseImpl(
      {required this.page,
      required this.size,
      required final List<User> content,
      required this.total})
      : _content = content;

  factory _$FollowerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowerResponseImplFromJson(json);

  @override
  final int page;
  @override
  final int size;
  final List<User> _content;
  @override
  List<User> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final int total;

  @override
  String toString() {
    return 'FollowerResponse(page: $page, size: $size, content: $content, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowerResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, size,
      const DeepCollectionEquality().hash(_content), total);

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
      {required final int page,
      required final int size,
      required final List<User> content,
      required final int total}) = _$FollowerResponseImpl;

  factory _FollowerResponse.fromJson(Map<String, dynamic> json) =
      _$FollowerResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get size;
  @override
  List<User> get content;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$FollowerResponseImplCopyWith<_$FollowerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  int get updatedAt => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get usertag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'created_at') int createdAt,
      String email,
      String type,
      String status,
      @JsonKey(name: 'updated_at') int updatedAt,
      String username,
      String usertag});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? email = null,
    Object? type = null,
    Object? status = null,
    Object? updatedAt = null,
    Object? username = null,
    Object? usertag = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      usertag: null == usertag
          ? _value.usertag
          : usertag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'created_at') int createdAt,
      String email,
      String type,
      String status,
      @JsonKey(name: 'updated_at') int updatedAt,
      String username,
      String usertag});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? email = null,
    Object? type = null,
    Object? status = null,
    Object? updatedAt = null,
    Object? username = null,
    Object? usertag = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      usertag: null == usertag
          ? _value.usertag
          : usertag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.email,
      required this.type,
      required this.status,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.username,
      required this.usertag});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  final String email;
  @override
  final String type;
  @override
  final String status;
  @override
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  @override
  final String username;
  @override
  final String usertag;

  @override
  String toString() {
    return 'User(id: $id, createdAt: $createdAt, email: $email, type: $type, status: $status, updatedAt: $updatedAt, username: $username, usertag: $usertag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.usertag, usertag) || other.usertag == usertag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, email, type,
      status, updatedAt, username, usertag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'created_at') required final int createdAt,
      required final String email,
      required final String type,
      required final String status,
      @JsonKey(name: 'updated_at') required final int updatedAt,
      required final String username,
      required final String usertag}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  String get email;
  @override
  String get type;
  @override
  String get status;
  @override
  @JsonKey(name: 'updated_at')
  int get updatedAt;
  @override
  String get username;
  @override
  String get usertag;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
