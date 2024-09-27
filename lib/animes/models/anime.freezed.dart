// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return _Anime.fromJson(json);
}

/// @nodoc
mixin _$Anime {
  int get id => throw _privateConstructorUsedError;
  AnimeTitle get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  AnimeCoverImage get coverImage => throw _privateConstructorUsedError;
  String? get bannerImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_viewed')
  bool get isViewed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_in_watchlist')
  bool get isInWatchlist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeCopyWith<Anime> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeCopyWith<$Res> {
  factory $AnimeCopyWith(Anime value, $Res Function(Anime) then) =
      _$AnimeCopyWithImpl<$Res, Anime>;
  @useResult
  $Res call(
      {int id,
      AnimeTitle title,
      String description,
      AnimeCoverImage coverImage,
      String? bannerImage,
      @JsonKey(name: 'is_viewed') bool isViewed,
      @JsonKey(name: 'is_in_watchlist') bool isInWatchlist});

  $AnimeTitleCopyWith<$Res> get title;
  $AnimeCoverImageCopyWith<$Res> get coverImage;
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
    Object? coverImage = null,
    Object? bannerImage = freezed,
    Object? isViewed = null,
    Object? isInWatchlist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as AnimeCoverImage,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isViewed: null == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool,
      isInWatchlist: null == isInWatchlist
          ? _value.isInWatchlist
          : isInWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeTitleCopyWith<$Res> get title {
    return $AnimeTitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeCoverImageCopyWith<$Res> get coverImage {
    return $AnimeCoverImageCopyWith<$Res>(_value.coverImage, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
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
  $Res call(
      {int id,
      AnimeTitle title,
      String description,
      AnimeCoverImage coverImage,
      String? bannerImage,
      @JsonKey(name: 'is_viewed') bool isViewed,
      @JsonKey(name: 'is_in_watchlist') bool isInWatchlist});

  @override
  $AnimeTitleCopyWith<$Res> get title;
  @override
  $AnimeCoverImageCopyWith<$Res> get coverImage;
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
    Object? coverImage = null,
    Object? bannerImage = freezed,
    Object? isViewed = null,
    Object? isInWatchlist = null,
  }) {
    return _then(_$AnimeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as AnimeCoverImage,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isViewed: null == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool,
      isInWatchlist: null == isInWatchlist
          ? _value.isInWatchlist
          : isInWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeImpl implements _Anime {
  const _$AnimeImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.coverImage,
      required this.bannerImage,
      @JsonKey(name: 'is_viewed') this.isViewed = false,
      @JsonKey(name: 'is_in_watchlist') this.isInWatchlist = false});

  factory _$AnimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeImplFromJson(json);

  @override
  final int id;
  @override
  final AnimeTitle title;
  @override
  final String description;
  @override
  final AnimeCoverImage coverImage;
  @override
  final String? bannerImage;
  @override
  @JsonKey(name: 'is_viewed')
  final bool isViewed;
  @override
  @JsonKey(name: 'is_in_watchlist')
  final bool isInWatchlist;

  @override
  String toString() {
    return 'Anime(id: $id, title: $title, description: $description, coverImage: $coverImage, bannerImage: $bannerImage, isViewed: $isViewed, isInWatchlist: $isInWatchlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.isViewed, isViewed) ||
                other.isViewed == isViewed) &&
            (identical(other.isInWatchlist, isInWatchlist) ||
                other.isInWatchlist == isInWatchlist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      coverImage, bannerImage, isViewed, isInWatchlist);

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
          required final AnimeTitle title,
          required final String description,
          required final AnimeCoverImage coverImage,
          required final String? bannerImage,
          @JsonKey(name: 'is_viewed') final bool isViewed,
          @JsonKey(name: 'is_in_watchlist') final bool isInWatchlist}) =
      _$AnimeImpl;

  factory _Anime.fromJson(Map<String, dynamic> json) = _$AnimeImpl.fromJson;

  @override
  int get id;
  @override
  AnimeTitle get title;
  @override
  String get description;
  @override
  AnimeCoverImage get coverImage;
  @override
  String? get bannerImage;
  @override
  @JsonKey(name: 'is_viewed')
  bool get isViewed;
  @override
  @JsonKey(name: 'is_in_watchlist')
  bool get isInWatchlist;
  @override
  @JsonKey(ignore: true)
  _$$AnimeImplCopyWith<_$AnimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeTitle _$AnimeTitleFromJson(Map<String, dynamic> json) {
  return _AnimeTitle.fromJson(json);
}

/// @nodoc
mixin _$AnimeTitle {
  String get romaji => throw _privateConstructorUsedError;
  String? get english => throw _privateConstructorUsedError;
  String? get native => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeTitleCopyWith<AnimeTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeTitleCopyWith<$Res> {
  factory $AnimeTitleCopyWith(
          AnimeTitle value, $Res Function(AnimeTitle) then) =
      _$AnimeTitleCopyWithImpl<$Res, AnimeTitle>;
  @useResult
  $Res call({String romaji, String? english, String? native});
}

/// @nodoc
class _$AnimeTitleCopyWithImpl<$Res, $Val extends AnimeTitle>
    implements $AnimeTitleCopyWith<$Res> {
  _$AnimeTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = freezed,
    Object? native = freezed,
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
      native: freezed == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeTitleImplCopyWith<$Res>
    implements $AnimeTitleCopyWith<$Res> {
  factory _$$AnimeTitleImplCopyWith(
          _$AnimeTitleImpl value, $Res Function(_$AnimeTitleImpl) then) =
      __$$AnimeTitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String romaji, String? english, String? native});
}

/// @nodoc
class __$$AnimeTitleImplCopyWithImpl<$Res>
    extends _$AnimeTitleCopyWithImpl<$Res, _$AnimeTitleImpl>
    implements _$$AnimeTitleImplCopyWith<$Res> {
  __$$AnimeTitleImplCopyWithImpl(
      _$AnimeTitleImpl _value, $Res Function(_$AnimeTitleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = freezed,
    Object? native = freezed,
  }) {
    return _then(_$AnimeTitleImpl(
      romaji: null == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String,
      english: freezed == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
      native: freezed == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeTitleImpl implements _AnimeTitle {
  const _$AnimeTitleImpl({required this.romaji, this.english, this.native});

  factory _$AnimeTitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeTitleImplFromJson(json);

  @override
  final String romaji;
  @override
  final String? english;
  @override
  final String? native;

  @override
  String toString() {
    return 'AnimeTitle(romaji: $romaji, english: $english, native: $native)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeTitleImpl &&
            (identical(other.romaji, romaji) || other.romaji == romaji) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.native, native) || other.native == native));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, romaji, english, native);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeTitleImplCopyWith<_$AnimeTitleImpl> get copyWith =>
      __$$AnimeTitleImplCopyWithImpl<_$AnimeTitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeTitleImplToJson(
      this,
    );
  }
}

abstract class _AnimeTitle implements AnimeTitle {
  const factory _AnimeTitle(
      {required final String romaji,
      final String? english,
      final String? native}) = _$AnimeTitleImpl;

  factory _AnimeTitle.fromJson(Map<String, dynamic> json) =
      _$AnimeTitleImpl.fromJson;

  @override
  String get romaji;
  @override
  String? get english;
  @override
  String? get native;
  @override
  @JsonKey(ignore: true)
  _$$AnimeTitleImplCopyWith<_$AnimeTitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeCoverImage _$AnimeCoverImageFromJson(Map<String, dynamic> json) {
  return _AnimeCoverImage.fromJson(json);
}

/// @nodoc
mixin _$AnimeCoverImage {
  String get extraLarge => throw _privateConstructorUsedError;
  String get large => throw _privateConstructorUsedError;
  String get medium => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeCoverImageCopyWith<AnimeCoverImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeCoverImageCopyWith<$Res> {
  factory $AnimeCoverImageCopyWith(
          AnimeCoverImage value, $Res Function(AnimeCoverImage) then) =
      _$AnimeCoverImageCopyWithImpl<$Res, AnimeCoverImage>;
  @useResult
  $Res call({String extraLarge, String large, String medium, String? color});
}

/// @nodoc
class _$AnimeCoverImageCopyWithImpl<$Res, $Val extends AnimeCoverImage>
    implements $AnimeCoverImageCopyWith<$Res> {
  _$AnimeCoverImageCopyWithImpl(this._value, this._then);

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
abstract class _$$AnimeCoverImageImplCopyWith<$Res>
    implements $AnimeCoverImageCopyWith<$Res> {
  factory _$$AnimeCoverImageImplCopyWith(_$AnimeCoverImageImpl value,
          $Res Function(_$AnimeCoverImageImpl) then) =
      __$$AnimeCoverImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String extraLarge, String large, String medium, String? color});
}

/// @nodoc
class __$$AnimeCoverImageImplCopyWithImpl<$Res>
    extends _$AnimeCoverImageCopyWithImpl<$Res, _$AnimeCoverImageImpl>
    implements _$$AnimeCoverImageImplCopyWith<$Res> {
  __$$AnimeCoverImageImplCopyWithImpl(
      _$AnimeCoverImageImpl _value, $Res Function(_$AnimeCoverImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = null,
    Object? large = null,
    Object? medium = null,
    Object? color = freezed,
  }) {
    return _then(_$AnimeCoverImageImpl(
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
class _$AnimeCoverImageImpl implements _AnimeCoverImage {
  const _$AnimeCoverImageImpl(
      {required this.extraLarge,
      required this.large,
      required this.medium,
      this.color});

  factory _$AnimeCoverImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeCoverImageImplFromJson(json);

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
    return 'AnimeCoverImage(extraLarge: $extraLarge, large: $large, medium: $medium, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeCoverImageImpl &&
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
  _$$AnimeCoverImageImplCopyWith<_$AnimeCoverImageImpl> get copyWith =>
      __$$AnimeCoverImageImplCopyWithImpl<_$AnimeCoverImageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeCoverImageImplToJson(
      this,
    );
  }
}

abstract class _AnimeCoverImage implements AnimeCoverImage {
  const factory _AnimeCoverImage(
      {required final String extraLarge,
      required final String large,
      required final String medium,
      final String? color}) = _$AnimeCoverImageImpl;

  factory _AnimeCoverImage.fromJson(Map<String, dynamic> json) =
      _$AnimeCoverImageImpl.fromJson;

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
  _$$AnimeCoverImageImplCopyWith<_$AnimeCoverImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
