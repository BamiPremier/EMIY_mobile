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
  Pagination get pagination => throw _privateConstructorUsedError;
  List<Anime> get animes => throw _privateConstructorUsedError;

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
  $Res call({Pagination pagination, List<Anime> animes});

  $PaginationCopyWith<$Res> get pagination;
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
    Object? pagination = null,
    Object? animes = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      animes: null == animes
          ? _value.animes
          : animes // ignore: cast_nullable_to_non_nullable
              as List<Anime>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
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
  $Res call({Pagination pagination, List<Anime> animes});

  @override
  $PaginationCopyWith<$Res> get pagination;
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
    Object? pagination = null,
    Object? animes = null,
  }) {
    return _then(_$AnimeResponseImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      animes: null == animes
          ? _value._animes
          : animes // ignore: cast_nullable_to_non_nullable
              as List<Anime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeResponseImpl implements _AnimeResponse {
  const _$AnimeResponseImpl(
      {required this.pagination, required final List<Anime> animes})
      : _animes = animes;

  factory _$AnimeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeResponseImplFromJson(json);

  @override
  final Pagination pagination;
  final List<Anime> _animes;
  @override
  List<Anime> get animes {
    if (_animes is EqualUnmodifiableListView) return _animes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animes);
  }

  @override
  String toString() {
    return 'AnimeResponse(pagination: $pagination, animes: $animes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeResponseImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality().equals(other._animes, _animes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pagination, const DeepCollectionEquality().hash(_animes));

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
      {required final Pagination pagination,
      required final List<Anime> animes}) = _$AnimeResponseImpl;

  factory _AnimeResponse.fromJson(Map<String, dynamic> json) =
      _$AnimeResponseImpl.fromJson;

  @override
  Pagination get pagination;
  @override
  List<Anime> get animes;
  @override
  @JsonKey(ignore: true)
  _$$AnimeResponseImplCopyWith<_$AnimeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  int get page => throw _privateConstructorUsedError;
  int get take => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_page')
  int? get nextPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

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
      {int page,
      int take,
      @JsonKey(name: 'next_page') int? nextPage,
      int total});
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
    Object? page = null,
    Object? take = null,
    Object? nextPage = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      take: null == take
          ? _value.take
          : take // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
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
      {int page,
      int take,
      @JsonKey(name: 'next_page') int? nextPage,
      int total});
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
    Object? page = null,
    Object? take = null,
    Object? nextPage = freezed,
    Object? total = null,
  }) {
    return _then(_$PaginationImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      take: null == take
          ? _value.take
          : take // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl(
      {required this.page,
      required this.take,
      @JsonKey(name: 'next_page') required this.nextPage,
      required this.total});

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

  @override
  final int page;
  @override
  final int take;
  @override
  @JsonKey(name: 'next_page')
  final int? nextPage;
  @override
  final int total;

  @override
  String toString() {
    return 'Pagination(page: $page, take: $take, nextPage: $nextPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.take, take) || other.take == take) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, take, nextPage, total);

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

abstract class _Pagination implements Pagination {
  const factory _Pagination(
      {required final int page,
      required final int take,
      @JsonKey(name: 'next_page') required final int? nextPage,
      required final int total}) = _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  @override
  int get page;
  @override
  int get take;
  @override
  @JsonKey(name: 'next_page')
  int? get nextPage;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return _Anime.fromJson(json);
}

/// @nodoc
mixin _$Anime {
  int get id => throw _privateConstructorUsedError;
  Title get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeCopyWith<Anime> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeCopyWith<$Res> {
  factory $AnimeCopyWith(Anime value, $Res Function(Anime) then) =
      _$AnimeCopyWithImpl<$Res, Anime>;
  @useResult
  $Res call({int id, Title title, String description});

  $TitleCopyWith<$Res> get title;
}

/// @nodoc
class _$AnimeCopyWithImpl<$Res, $Val extends Anime>
    implements $AnimeCopyWith<$Res> {
  _$AnimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res> get title {
    return $TitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimeImplCopyWith<$Res> implements $AnimeCopyWith<$Res> {
  factory _$$AnimeImplCopyWith(
          _$AnimeImpl value, $Res Function(_$AnimeImpl) then) =
      __$$AnimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Title title, String description});

  @override
  $TitleCopyWith<$Res> get title;
}

/// @nodoc
class __$$AnimeImplCopyWithImpl<$Res>
    extends _$AnimeCopyWithImpl<$Res, _$AnimeImpl>
    implements _$$AnimeImplCopyWith<$Res> {
  __$$AnimeImplCopyWithImpl(
      _$AnimeImpl _value, $Res Function(_$AnimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$AnimeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeImpl implements _Anime {
  const _$AnimeImpl(
      {required this.id, required this.title, required this.description});

  factory _$AnimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeImplFromJson(json);

  @override
  final int id;
  @override
  final Title title;
  @override
  final String description;

  @override
  String toString() {
    return 'Anime(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeImplCopyWith<_$AnimeImpl> get copyWith =>
      __$$AnimeImplCopyWithImpl<_$AnimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeImplToJson(
      this,
    );
  }
}

abstract class _Anime implements Anime {
  const factory _Anime(
      {required final int id,
      required final Title title,
      required final String description}) = _$AnimeImpl;

  factory _Anime.fromJson(Map<String, dynamic> json) = _$AnimeImpl.fromJson;

  @override
  int get id;
  @override
  Title get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$AnimeImplCopyWith<_$AnimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Title _$TitleFromJson(Map<String, dynamic> json) {
  return _Title.fromJson(json);
}

/// @nodoc
mixin _$Title {
  String get romaji => throw _privateConstructorUsedError;
  String? get english => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TitleCopyWith<Title> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleCopyWith<$Res> {
  factory $TitleCopyWith(Title value, $Res Function(Title) then) =
      _$TitleCopyWithImpl<$Res, Title>;
  @useResult
  $Res call({String romaji, String? english});
}

/// @nodoc
class _$TitleCopyWithImpl<$Res, $Val extends Title>
    implements $TitleCopyWith<$Res> {
  _$TitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = freezed,
  }) {
    return _then(_value.copyWith(
      romaji: null == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String,
      english: freezed == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TitleImplCopyWith<$Res> implements $TitleCopyWith<$Res> {
  factory _$$TitleImplCopyWith(
          _$TitleImpl value, $Res Function(_$TitleImpl) then) =
      __$$TitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String romaji, String? english});
}

/// @nodoc
class __$$TitleImplCopyWithImpl<$Res>
    extends _$TitleCopyWithImpl<$Res, _$TitleImpl>
    implements _$$TitleImplCopyWith<$Res> {
  __$$TitleImplCopyWithImpl(
      _$TitleImpl _value, $Res Function(_$TitleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = freezed,
  }) {
    return _then(_$TitleImpl(
      romaji: null == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String,
      english: freezed == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TitleImpl implements _Title {
  const _$TitleImpl({required this.romaji, this.english});

  factory _$TitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$TitleImplFromJson(json);

  @override
  final String romaji;
  @override
  final String? english;

  @override
  String toString() {
    return 'Title(romaji: $romaji, english: $english)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleImpl &&
            (identical(other.romaji, romaji) || other.romaji == romaji) &&
            (identical(other.english, english) || other.english == english));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, romaji, english);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TitleImplCopyWith<_$TitleImpl> get copyWith =>
      __$$TitleImplCopyWithImpl<_$TitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TitleImplToJson(
      this,
    );
  }
}

abstract class _Title implements Title {
  const factory _Title({required final String romaji, final String? english}) =
      _$TitleImpl;

  factory _Title.fromJson(Map<String, dynamic> json) = _$TitleImpl.fromJson;

  @override
  String get romaji;
  @override
  String? get english;
  @override
  @JsonKey(ignore: true)
  _$$TitleImplCopyWith<_$TitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
