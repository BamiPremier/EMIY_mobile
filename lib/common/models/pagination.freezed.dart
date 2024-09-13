// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  @JsonKey(name: 'listEntity')
  List<Map<String, dynamic>> get listEntity =>
      throw _privateConstructorUsedError;
  int get nbElement => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call(
      {@JsonKey(name: 'listEntity') List<Map<String, dynamic>> listEntity,
      int nbElement,
      int perPage,
      int currentPage,
      int next});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listEntity = null,
    Object? nbElement = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? next = null,
  }) {
    return _then(_value.copyWith(
      listEntity: null == listEntity
          ? _value.listEntity
          : listEntity // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      nbElement: null == nbElement
          ? _value.nbElement
          : nbElement // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'listEntity') List<Map<String, dynamic>> listEntity,
      int nbElement,
      int perPage,
      int currentPage,
      int next});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$PaginationImpl>
    implements _$$PaginationImplCopyWith<$Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl _value, $Res Function(_$PaginationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listEntity = null,
    Object? nbElement = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? next = null,
  }) {
    return _then(_$PaginationImpl(
      listEntity: null == listEntity
          ? _value._listEntity
          : listEntity // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      nbElement: null == nbElement
          ? _value.nbElement
          : nbElement // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationImpl extends _Pagination {
  const _$PaginationImpl(
      {@JsonKey(name: 'listEntity')
      required final List<Map<String, dynamic>> listEntity,
      required this.nbElement,
      required this.perPage,
      required this.currentPage,
      required this.next})
      : _listEntity = listEntity,
        super._();

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

  final List<Map<String, dynamic>> _listEntity;
  @override
  @JsonKey(name: 'listEntity')
  List<Map<String, dynamic>> get listEntity {
    if (_listEntity is EqualUnmodifiableListView) return _listEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listEntity);
  }

  @override
  final int nbElement;
  @override
  final int perPage;
  @override
  final int currentPage;
  @override
  final int next;

  @override
  String toString() {
    return 'Pagination(listEntity: $listEntity, nbElement: $nbElement, perPage: $perPage, currentPage: $currentPage, next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
            const DeepCollectionEquality()
                .equals(other._listEntity, _listEntity) &&
            (identical(other.nbElement, nbElement) ||
                other.nbElement == nbElement) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listEntity),
      nbElement,
      perPage,
      currentPage,
      next);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      __$$PaginationImplCopyWithImpl<_$PaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationImplToJson(
      this,
    );
  }
}

abstract class _Pagination extends Pagination {
  const factory _Pagination(
      {@JsonKey(name: 'listEntity')
      required final List<Map<String, dynamic>> listEntity,
      required final int nbElement,
      required final int perPage,
      required final int currentPage,
      required final int next}) = _$PaginationImpl;
  const _Pagination._() : super._();

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  @override
  @JsonKey(name: 'listEntity')
  List<Map<String, dynamic>> get listEntity;
  @override
  int get nbElement;
  @override
  int get perPage;
  @override
  int get currentPage;
  @override
  int get next;
  @override
  @JsonKey(ignore: true)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
