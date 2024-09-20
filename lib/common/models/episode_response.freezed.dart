// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpisodeResponse _$EpisodeResponseFromJson(Map<String, dynamic> json) {
  return _EpisodeResponse.fromJson(json);
}

/// @nodoc
mixin _$EpisodeResponse {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  List<Episode> get content => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeResponseCopyWith<EpisodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeResponseCopyWith<$Res> {
  factory $EpisodeResponseCopyWith(
          EpisodeResponse value, $Res Function(EpisodeResponse) then) =
      _$EpisodeResponseCopyWithImpl<$Res, EpisodeResponse>;
  @useResult
  $Res call({int page, int size, List<Episode> content, int total});
}

/// @nodoc
class _$EpisodeResponseCopyWithImpl<$Res, $Val extends EpisodeResponse>
    implements $EpisodeResponseCopyWith<$Res> {
  _$EpisodeResponseCopyWithImpl(this._value, this._then);

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
              as List<Episode>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpisodeResponseImplCopyWith<$Res>
    implements $EpisodeResponseCopyWith<$Res> {
  factory _$$EpisodeResponseImplCopyWith(_$EpisodeResponseImpl value,
          $Res Function(_$EpisodeResponseImpl) then) =
      __$$EpisodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size, List<Episode> content, int total});
}

/// @nodoc
class __$$EpisodeResponseImplCopyWithImpl<$Res>
    extends _$EpisodeResponseCopyWithImpl<$Res, _$EpisodeResponseImpl>
    implements _$$EpisodeResponseImplCopyWith<$Res> {
  __$$EpisodeResponseImplCopyWithImpl(
      _$EpisodeResponseImpl _value, $Res Function(_$EpisodeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? content = null,
    Object? total = null,
  }) {
    return _then(_$EpisodeResponseImpl(
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
              as List<Episode>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeResponseImpl implements _EpisodeResponse {
  const _$EpisodeResponseImpl(
      {required this.page,
      required this.size,
      required final List<Episode> content,
      required this.total})
      : _content = content;

  factory _$EpisodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeResponseImplFromJson(json);

  @override
  final int page;
  @override
  final int size;
  final List<Episode> _content;
  @override
  List<Episode> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final int total;

  @override
  String toString() {
    return 'EpisodeResponse(page: $page, size: $size, content: $content, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeResponseImpl &&
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
  _$$EpisodeResponseImplCopyWith<_$EpisodeResponseImpl> get copyWith =>
      __$$EpisodeResponseImplCopyWithImpl<_$EpisodeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeResponseImplToJson(
      this,
    );
  }
}

abstract class _EpisodeResponse implements EpisodeResponse {
  const factory _EpisodeResponse(
      {required final int page,
      required final int size,
      required final List<Episode> content,
      required final int total}) = _$EpisodeResponseImpl;

  factory _EpisodeResponse.fromJson(Map<String, dynamic> json) =
      _$EpisodeResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get size;
  @override
  List<Episode> get content;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$EpisodeResponseImplCopyWith<_$EpisodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return _Episode.fromJson(json);
}

/// @nodoc
mixin _$Episode {
  int get id => throw _privateConstructorUsedError;
  Title get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  CoverImage get coverImage => throw _privateConstructorUsedError;
  String? get bannerImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeCopyWith<Episode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) then) =
      _$EpisodeCopyWithImpl<$Res, Episode>;
  @useResult
  $Res call(
      {int id,
      Title title,
      String description,
      CoverImage coverImage,
      String? bannerImage});

  $TitleCopyWith<$Res> get title;
  $CoverImageCopyWith<$Res> get coverImage;
}

/// @nodoc
class _$EpisodeCopyWithImpl<$Res, $Val extends Episode>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._value, this._then);

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
    Object? coverImage = null,
    Object? bannerImage = freezed,
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
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as CoverImage,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res> get title {
    return $TitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CoverImageCopyWith<$Res> get coverImage {
    return $CoverImageCopyWith<$Res>(_value.coverImage, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
          _$EpisodeImpl value, $Res Function(_$EpisodeImpl) then) =
      __$$EpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Title title,
      String description,
      CoverImage coverImage,
      String? bannerImage});

  @override
  $TitleCopyWith<$Res> get title;
  @override
  $CoverImageCopyWith<$Res> get coverImage;
}

/// @nodoc
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$EpisodeCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
      _$EpisodeImpl _value, $Res Function(_$EpisodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? coverImage = null,
    Object? bannerImage = freezed,
  }) {
    return _then(_$EpisodeImpl(
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
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as CoverImage,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeImpl implements _Episode {
  const _$EpisodeImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.coverImage,
      this.bannerImage});

  factory _$EpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeImplFromJson(json);

  @override
  final int id;
  @override
  final Title title;
  @override
  final String description;
  @override
  final CoverImage coverImage;
  @override
  final String? bannerImage;

  @override
  String toString() {
    return 'Episode(id: $id, title: $title, description: $description, coverImage: $coverImage, bannerImage: $bannerImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, coverImage, bannerImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeImplToJson(
      this,
    );
  }
}

abstract class _Episode implements Episode {
  const factory _Episode(
      {required final int id,
      required final Title title,
      required final String description,
      required final CoverImage coverImage,
      final String? bannerImage}) = _$EpisodeImpl;

  factory _Episode.fromJson(Map<String, dynamic> json) = _$EpisodeImpl.fromJson;

  @override
  int get id;
  @override
  Title get title;
  @override
  String get description;
  @override
  CoverImage get coverImage;
  @override
  String? get bannerImage;
  @override
  @JsonKey(ignore: true)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
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

CoverImage _$CoverImageFromJson(Map<String, dynamic> json) {
  return _CoverImage.fromJson(json);
}

/// @nodoc
mixin _$CoverImage {
  String get extraLarge => throw _privateConstructorUsedError;
  String get large => throw _privateConstructorUsedError;
  String get medium => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoverImageCopyWith<CoverImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoverImageCopyWith<$Res> {
  factory $CoverImageCopyWith(
          CoverImage value, $Res Function(CoverImage) then) =
      _$CoverImageCopyWithImpl<$Res, CoverImage>;
  @useResult
  $Res call({String extraLarge, String large, String medium, String? color});
}

/// @nodoc
class _$CoverImageCopyWithImpl<$Res, $Val extends CoverImage>
    implements $CoverImageCopyWith<$Res> {
  _$CoverImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = null,
    Object? large = null,
    Object? medium = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      extraLarge: null == extraLarge
          ? _value.extraLarge
          : extraLarge // ignore: cast_nullable_to_non_nullable
              as String,
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoverImageImplCopyWith<$Res>
    implements $CoverImageCopyWith<$Res> {
  factory _$$CoverImageImplCopyWith(
          _$CoverImageImpl value, $Res Function(_$CoverImageImpl) then) =
      __$$CoverImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String extraLarge, String large, String medium, String? color});
}

/// @nodoc
class __$$CoverImageImplCopyWithImpl<$Res>
    extends _$CoverImageCopyWithImpl<$Res, _$CoverImageImpl>
    implements _$$CoverImageImplCopyWith<$Res> {
  __$$CoverImageImplCopyWithImpl(
      _$CoverImageImpl _value, $Res Function(_$CoverImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = null,
    Object? large = null,
    Object? medium = null,
    Object? color = freezed,
  }) {
    return _then(_$CoverImageImpl(
      extraLarge: null == extraLarge
          ? _value.extraLarge
          : extraLarge // ignore: cast_nullable_to_non_nullable
              as String,
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoverImageImpl implements _CoverImage {
  const _$CoverImageImpl(
      {required this.extraLarge,
      required this.large,
      required this.medium,
      this.color});

  factory _$CoverImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoverImageImplFromJson(json);

  @override
  final String extraLarge;
  @override
  final String large;
  @override
  final String medium;
  @override
  final String? color;

  @override
  String toString() {
    return 'CoverImage(extraLarge: $extraLarge, large: $large, medium: $medium, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoverImageImpl &&
            (identical(other.extraLarge, extraLarge) ||
                other.extraLarge == extraLarge) &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, extraLarge, large, medium, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoverImageImplCopyWith<_$CoverImageImpl> get copyWith =>
      __$$CoverImageImplCopyWithImpl<_$CoverImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoverImageImplToJson(
      this,
    );
  }
}

abstract class _CoverImage implements CoverImage {
  const factory _CoverImage(
      {required final String extraLarge,
      required final String large,
      required final String medium,
      final String? color}) = _$CoverImageImpl;

  factory _CoverImage.fromJson(Map<String, dynamic> json) =
      _$CoverImageImpl.fromJson;

  @override
  String get extraLarge;
  @override
  String get large;
  @override
  String get medium;
  @override
  String? get color;
  @override
  @JsonKey(ignore: true)
  _$$CoverImageImplCopyWith<_$CoverImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
