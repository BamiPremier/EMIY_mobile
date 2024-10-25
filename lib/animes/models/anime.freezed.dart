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
  @JsonKey(name: 'anime_view_count')
  int get animeViewCount => throw _privateConstructorUsedError;
  int? get averageScore => throw _privateConstructorUsedError;
  int? get chapters => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  AnimeDate? get endDate => throw _privateConstructorUsedError;
  int? get episodes => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;
  bool get isAdult => throw _privateConstructorUsedError;
  AnimeEpisode? get nextAiringEpisode => throw _privateConstructorUsedError;
  int? get popularity => throw _privateConstructorUsedError;
  String? get season => throw _privateConstructorUsedError;
  int? get seasonYear => throw _privateConstructorUsedError;
  AnimeDate? get startDate => throw _privateConstructorUsedError;
  int? get volumes => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchlist_count')
  int get watchlistCount => throw _privateConstructorUsedError;

  /// Serializes this Anime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @JsonKey(name: 'is_in_watchlist') bool isInWatchlist,
      @JsonKey(name: 'anime_view_count') int animeViewCount,
      int? averageScore,
      int? chapters,
      int? duration,
      AnimeDate? endDate,
      int? episodes,
      String? format,
      List<String>? genres,
      bool isAdult,
      AnimeEpisode? nextAiringEpisode,
      int? popularity,
      String? season,
      int? seasonYear,
      AnimeDate? startDate,
      int? volumes,
      @JsonKey(name: 'watchlist_count') int watchlistCount});

  $AnimeTitleCopyWith<$Res> get title;
  $AnimeCoverImageCopyWith<$Res> get coverImage;
  $AnimeDateCopyWith<$Res>? get endDate;
  $AnimeEpisodeCopyWith<$Res>? get nextAiringEpisode;
  $AnimeDateCopyWith<$Res>? get startDate;
}

/// @nodoc
class _$AnimeCopyWithImpl<$Res, $Val extends Anime>
    implements $AnimeCopyWith<$Res> {
  _$AnimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
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
    Object? animeViewCount = null,
    Object? averageScore = freezed,
    Object? chapters = freezed,
    Object? duration = freezed,
    Object? endDate = freezed,
    Object? episodes = freezed,
    Object? format = freezed,
    Object? genres = freezed,
    Object? isAdult = null,
    Object? nextAiringEpisode = freezed,
    Object? popularity = freezed,
    Object? season = freezed,
    Object? seasonYear = freezed,
    Object? startDate = freezed,
    Object? volumes = freezed,
    Object? watchlistCount = null,
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
      animeViewCount: null == animeViewCount
          ? _value.animeViewCount
          : animeViewCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as int?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as AnimeDate?,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAdult: null == isAdult
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as AnimeEpisode?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonYear: freezed == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as AnimeDate?,
      volumes: freezed == volumes
          ? _value.volumes
          : volumes // ignore: cast_nullable_to_non_nullable
              as int?,
      watchlistCount: null == watchlistCount
          ? _value.watchlistCount
          : watchlistCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeTitleCopyWith<$Res> get title {
    return $AnimeTitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeCoverImageCopyWith<$Res> get coverImage {
    return $AnimeCoverImageCopyWith<$Res>(_value.coverImage, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeDateCopyWith<$Res>? get endDate {
    if (_value.endDate == null) {
      return null;
    }

    return $AnimeDateCopyWith<$Res>(_value.endDate!, (value) {
      return _then(_value.copyWith(endDate: value) as $Val);
    });
  }

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeEpisodeCopyWith<$Res>? get nextAiringEpisode {
    if (_value.nextAiringEpisode == null) {
      return null;
    }

    return $AnimeEpisodeCopyWith<$Res>(_value.nextAiringEpisode!, (value) {
      return _then(_value.copyWith(nextAiringEpisode: value) as $Val);
    });
  }

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeDateCopyWith<$Res>? get startDate {
    if (_value.startDate == null) {
      return null;
    }

    return $AnimeDateCopyWith<$Res>(_value.startDate!, (value) {
      return _then(_value.copyWith(startDate: value) as $Val);
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
      @JsonKey(name: 'is_in_watchlist') bool isInWatchlist,
      @JsonKey(name: 'anime_view_count') int animeViewCount,
      int? averageScore,
      int? chapters,
      int? duration,
      AnimeDate? endDate,
      int? episodes,
      String? format,
      List<String>? genres,
      bool isAdult,
      AnimeEpisode? nextAiringEpisode,
      int? popularity,
      String? season,
      int? seasonYear,
      AnimeDate? startDate,
      int? volumes,
      @JsonKey(name: 'watchlist_count') int watchlistCount});

  @override
  $AnimeTitleCopyWith<$Res> get title;
  @override
  $AnimeCoverImageCopyWith<$Res> get coverImage;
  @override
  $AnimeDateCopyWith<$Res>? get endDate;
  @override
  $AnimeEpisodeCopyWith<$Res>? get nextAiringEpisode;
  @override
  $AnimeDateCopyWith<$Res>? get startDate;
}

/// @nodoc
class __$$AnimeImplCopyWithImpl<$Res>
    extends _$AnimeCopyWithImpl<$Res, _$AnimeImpl>
    implements _$$AnimeImplCopyWith<$Res> {
  __$$AnimeImplCopyWithImpl(
      _$AnimeImpl _value, $Res Function(_$AnimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
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
    Object? animeViewCount = null,
    Object? averageScore = freezed,
    Object? chapters = freezed,
    Object? duration = freezed,
    Object? endDate = freezed,
    Object? episodes = freezed,
    Object? format = freezed,
    Object? genres = freezed,
    Object? isAdult = null,
    Object? nextAiringEpisode = freezed,
    Object? popularity = freezed,
    Object? season = freezed,
    Object? seasonYear = freezed,
    Object? startDate = freezed,
    Object? volumes = freezed,
    Object? watchlistCount = null,
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
      animeViewCount: null == animeViewCount
          ? _value.animeViewCount
          : animeViewCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as int?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as AnimeDate?,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAdult: null == isAdult
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as AnimeEpisode?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonYear: freezed == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as AnimeDate?,
      volumes: freezed == volumes
          ? _value.volumes
          : volumes // ignore: cast_nullable_to_non_nullable
              as int?,
      watchlistCount: null == watchlistCount
          ? _value.watchlistCount
          : watchlistCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      @JsonKey(name: 'is_in_watchlist') this.isInWatchlist = false,
      @JsonKey(name: 'anime_view_count') this.animeViewCount = 0,
      this.averageScore,
      this.chapters,
      this.duration,
      this.endDate,
      this.episodes,
      this.format,
      final List<String>? genres,
      this.isAdult = false,
      this.nextAiringEpisode,
      this.popularity,
      this.season,
      this.seasonYear,
      this.startDate,
      this.volumes,
      @JsonKey(name: 'watchlist_count') this.watchlistCount = 0})
      : _genres = genres;

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
  @JsonKey(name: 'anime_view_count')
  final int animeViewCount;
  @override
  final int? averageScore;
  @override
  final int? chapters;
  @override
  final int? duration;
  @override
  final AnimeDate? endDate;
  @override
  final int? episodes;
  @override
  final String? format;
  final List<String>? _genres;
  @override
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isAdult;
  @override
  final AnimeEpisode? nextAiringEpisode;
  @override
  final int? popularity;
  @override
  final String? season;
  @override
  final int? seasonYear;
  @override
  final AnimeDate? startDate;
  @override
  final int? volumes;
  @override
  @JsonKey(name: 'watchlist_count')
  final int watchlistCount;

  @override
  String toString() {
    return 'Anime(id: $id, title: $title, description: $description, coverImage: $coverImage, bannerImage: $bannerImage, isViewed: $isViewed, isInWatchlist: $isInWatchlist, animeViewCount: $animeViewCount, averageScore: $averageScore, chapters: $chapters, duration: $duration, endDate: $endDate, episodes: $episodes, format: $format, genres: $genres, isAdult: $isAdult, nextAiringEpisode: $nextAiringEpisode, popularity: $popularity, season: $season, seasonYear: $seasonYear, startDate: $startDate, volumes: $volumes, watchlistCount: $watchlistCount)';
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
                other.isInWatchlist == isInWatchlist) &&
            (identical(other.animeViewCount, animeViewCount) ||
                other.animeViewCount == animeViewCount) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.chapters, chapters) ||
                other.chapters == chapters) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.episodes, episodes) ||
                other.episodes == episodes) &&
            (identical(other.format, format) || other.format == format) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.isAdult, isAdult) || other.isAdult == isAdult) &&
            (identical(other.nextAiringEpisode, nextAiringEpisode) ||
                other.nextAiringEpisode == nextAiringEpisode) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.seasonYear, seasonYear) ||
                other.seasonYear == seasonYear) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.volumes, volumes) || other.volumes == volumes) &&
            (identical(other.watchlistCount, watchlistCount) ||
                other.watchlistCount == watchlistCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        coverImage,
        bannerImage,
        isViewed,
        isInWatchlist,
        animeViewCount,
        averageScore,
        chapters,
        duration,
        endDate,
        episodes,
        format,
        const DeepCollectionEquality().hash(_genres),
        isAdult,
        nextAiringEpisode,
        popularity,
        season,
        seasonYear,
        startDate,
        volumes,
        watchlistCount
      ]);

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
          @JsonKey(name: 'is_in_watchlist') final bool isInWatchlist,
          @JsonKey(name: 'anime_view_count') final int animeViewCount,
          final int? averageScore,
          final int? chapters,
          final int? duration,
          final AnimeDate? endDate,
          final int? episodes,
          final String? format,
          final List<String>? genres,
          final bool isAdult,
          final AnimeEpisode? nextAiringEpisode,
          final int? popularity,
          final String? season,
          final int? seasonYear,
          final AnimeDate? startDate,
          final int? volumes,
          @JsonKey(name: 'watchlist_count') final int watchlistCount}) =
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
  @JsonKey(name: 'anime_view_count')
  int get animeViewCount;
  @override
  int? get averageScore;
  @override
  int? get chapters;
  @override
  int? get duration;
  @override
  AnimeDate? get endDate;
  @override
  int? get episodes;
  @override
  String? get format;
  @override
  List<String>? get genres;
  @override
  bool get isAdult;
  @override
  AnimeEpisode? get nextAiringEpisode;
  @override
  int? get popularity;
  @override
  String? get season;
  @override
  int? get seasonYear;
  @override
  AnimeDate? get startDate;
  @override
  int? get volumes;
  @override
  @JsonKey(name: 'watchlist_count')
  int get watchlistCount;

  /// Create a copy of Anime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  String? get userPreferred => throw _privateConstructorUsedError;

  /// Serializes this AnimeTitle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeTitleCopyWith<AnimeTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeTitleCopyWith<$Res> {
  factory $AnimeTitleCopyWith(
          AnimeTitle value, $Res Function(AnimeTitle) then) =
      _$AnimeTitleCopyWithImpl<$Res, AnimeTitle>;
  @useResult
  $Res call(
      {String romaji, String? english, String? native, String? userPreferred});
}

/// @nodoc
class _$AnimeTitleCopyWithImpl<$Res, $Val extends AnimeTitle>
    implements $AnimeTitleCopyWith<$Res> {
  _$AnimeTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeTitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = freezed,
    Object? native = freezed,
    Object? userPreferred = freezed,
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
      userPreferred: freezed == userPreferred
          ? _value.userPreferred
          : userPreferred // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {String romaji, String? english, String? native, String? userPreferred});
}

/// @nodoc
class __$$AnimeTitleImplCopyWithImpl<$Res>
    extends _$AnimeTitleCopyWithImpl<$Res, _$AnimeTitleImpl>
    implements _$$AnimeTitleImplCopyWith<$Res> {
  __$$AnimeTitleImplCopyWithImpl(
      _$AnimeTitleImpl _value, $Res Function(_$AnimeTitleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnimeTitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = freezed,
    Object? native = freezed,
    Object? userPreferred = freezed,
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
      userPreferred: freezed == userPreferred
          ? _value.userPreferred
          : userPreferred // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeTitleImpl implements _AnimeTitle {
  const _$AnimeTitleImpl(
      {required this.romaji, this.english, this.native, this.userPreferred});

  factory _$AnimeTitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeTitleImplFromJson(json);

  @override
  final String romaji;
  @override
  final String? english;
  @override
  final String? native;
  @override
  final String? userPreferred;

  @override
  String toString() {
    return 'AnimeTitle(romaji: $romaji, english: $english, native: $native, userPreferred: $userPreferred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeTitleImpl &&
            (identical(other.romaji, romaji) || other.romaji == romaji) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.native, native) || other.native == native) &&
            (identical(other.userPreferred, userPreferred) ||
                other.userPreferred == userPreferred));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, romaji, english, native, userPreferred);

  /// Create a copy of AnimeTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      final String? native,
      final String? userPreferred}) = _$AnimeTitleImpl;

  factory _AnimeTitle.fromJson(Map<String, dynamic> json) =
      _$AnimeTitleImpl.fromJson;

  @override
  String get romaji;
  @override
  String? get english;
  @override
  String? get native;
  @override
  String? get userPreferred;

  /// Create a copy of AnimeTitle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeTitleImplCopyWith<_$AnimeTitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeCoverImage _$AnimeCoverImageFromJson(Map<String, dynamic> json) {
  return _AnimeCoverImage.fromJson(json);
}

/// @nodoc
mixin _$AnimeCoverImage {
  String? get extraLarge => throw _privateConstructorUsedError;
  String? get large => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this AnimeCoverImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeCoverImageCopyWith<AnimeCoverImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeCoverImageCopyWith<$Res> {
  factory $AnimeCoverImageCopyWith(
          AnimeCoverImage value, $Res Function(AnimeCoverImage) then) =
      _$AnimeCoverImageCopyWithImpl<$Res, AnimeCoverImage>;
  @useResult
  $Res call({String? extraLarge, String? large, String? medium, String? color});
}

/// @nodoc
class _$AnimeCoverImageCopyWithImpl<$Res, $Val extends AnimeCoverImage>
    implements $AnimeCoverImageCopyWith<$Res> {
  _$AnimeCoverImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      extraLarge: freezed == extraLarge
          ? _value.extraLarge
          : extraLarge // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? extraLarge, String? large, String? medium, String? color});
}

/// @nodoc
class __$$AnimeCoverImageImplCopyWithImpl<$Res>
    extends _$AnimeCoverImageCopyWithImpl<$Res, _$AnimeCoverImageImpl>
    implements _$$AnimeCoverImageImplCopyWith<$Res> {
  __$$AnimeCoverImageImplCopyWithImpl(
      _$AnimeCoverImageImpl _value, $Res Function(_$AnimeCoverImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnimeCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? color = freezed,
  }) {
    return _then(_$AnimeCoverImageImpl(
      extraLarge: freezed == extraLarge
          ? _value.extraLarge
          : extraLarge // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {this.extraLarge, this.large, this.medium, this.color});

  factory _$AnimeCoverImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeCoverImageImplFromJson(json);

  @override
  final String? extraLarge;
  @override
  final String? large;
  @override
  final String? medium;
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, extraLarge, large, medium, color);

  /// Create a copy of AnimeCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {final String? extraLarge,
      final String? large,
      final String? medium,
      final String? color}) = _$AnimeCoverImageImpl;

  factory _AnimeCoverImage.fromJson(Map<String, dynamic> json) =
      _$AnimeCoverImageImpl.fromJson;

  @override
  String? get extraLarge;
  @override
  String? get large;
  @override
  String? get medium;
  @override
  String? get color;

  /// Create a copy of AnimeCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeCoverImageImplCopyWith<_$AnimeCoverImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeDate _$AnimeDateFromJson(Map<String, dynamic> json) {
  return _AnimeDate.fromJson(json);
}

/// @nodoc
mixin _$AnimeDate {
  int? get year => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;

  /// Serializes this AnimeDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeDateCopyWith<AnimeDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeDateCopyWith<$Res> {
  factory $AnimeDateCopyWith(AnimeDate value, $Res Function(AnimeDate) then) =
      _$AnimeDateCopyWithImpl<$Res, AnimeDate>;
  @useResult
  $Res call({int? year, int? month, int? day});
}

/// @nodoc
class _$AnimeDateCopyWithImpl<$Res, $Val extends AnimeDate>
    implements $AnimeDateCopyWith<$Res> {
  _$AnimeDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_value.copyWith(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeDateImplCopyWith<$Res>
    implements $AnimeDateCopyWith<$Res> {
  factory _$$AnimeDateImplCopyWith(
          _$AnimeDateImpl value, $Res Function(_$AnimeDateImpl) then) =
      __$$AnimeDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? year, int? month, int? day});
}

/// @nodoc
class __$$AnimeDateImplCopyWithImpl<$Res>
    extends _$AnimeDateCopyWithImpl<$Res, _$AnimeDateImpl>
    implements _$$AnimeDateImplCopyWith<$Res> {
  __$$AnimeDateImplCopyWithImpl(
      _$AnimeDateImpl _value, $Res Function(_$AnimeDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnimeDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_$AnimeDateImpl(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeDateImpl implements _AnimeDate {
  const _$AnimeDateImpl({this.year, this.month, this.day});

  factory _$AnimeDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeDateImplFromJson(json);

  @override
  final int? year;
  @override
  final int? month;
  @override
  final int? day;

  @override
  String toString() {
    return 'AnimeDate(year: $year, month: $month, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeDateImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, day);

  /// Create a copy of AnimeDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeDateImplCopyWith<_$AnimeDateImpl> get copyWith =>
      __$$AnimeDateImplCopyWithImpl<_$AnimeDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeDateImplToJson(
      this,
    );
  }
}

abstract class _AnimeDate implements AnimeDate {
  const factory _AnimeDate(
      {final int? year, final int? month, final int? day}) = _$AnimeDateImpl;

  factory _AnimeDate.fromJson(Map<String, dynamic> json) =
      _$AnimeDateImpl.fromJson;

  @override
  int? get year;
  @override
  int? get month;
  @override
  int? get day;

  /// Create a copy of AnimeDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeDateImplCopyWith<_$AnimeDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeEpisode _$AnimeEpisodeFromJson(Map<String, dynamic> json) {
  return _AnimeEpisode.fromJson(json);
}

/// @nodoc
mixin _$AnimeEpisode {
  int? get airingAt => throw _privateConstructorUsedError;
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  int? get episode => throw _privateConstructorUsedError;

  /// Serializes this AnimeEpisode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeEpisode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeEpisodeCopyWith<AnimeEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeEpisodeCopyWith<$Res> {
  factory $AnimeEpisodeCopyWith(
          AnimeEpisode value, $Res Function(AnimeEpisode) then) =
      _$AnimeEpisodeCopyWithImpl<$Res, AnimeEpisode>;
  @useResult
  $Res call({int? airingAt, int? timeUntilAiring, int? episode});
}

/// @nodoc
class _$AnimeEpisodeCopyWithImpl<$Res, $Val extends AnimeEpisode>
    implements $AnimeEpisodeCopyWith<$Res> {
  _$AnimeEpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeEpisode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_value.copyWith(
      airingAt: freezed == airingAt
          ? _value.airingAt
          : airingAt // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUntilAiring: freezed == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeEpisodeImplCopyWith<$Res>
    implements $AnimeEpisodeCopyWith<$Res> {
  factory _$$AnimeEpisodeImplCopyWith(
          _$AnimeEpisodeImpl value, $Res Function(_$AnimeEpisodeImpl) then) =
      __$$AnimeEpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? airingAt, int? timeUntilAiring, int? episode});
}

/// @nodoc
class __$$AnimeEpisodeImplCopyWithImpl<$Res>
    extends _$AnimeEpisodeCopyWithImpl<$Res, _$AnimeEpisodeImpl>
    implements _$$AnimeEpisodeImplCopyWith<$Res> {
  __$$AnimeEpisodeImplCopyWithImpl(
      _$AnimeEpisodeImpl _value, $Res Function(_$AnimeEpisodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnimeEpisode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_$AnimeEpisodeImpl(
      airingAt: freezed == airingAt
          ? _value.airingAt
          : airingAt // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUntilAiring: freezed == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeEpisodeImpl implements _AnimeEpisode {
  const _$AnimeEpisodeImpl({this.airingAt, this.timeUntilAiring, this.episode});

  factory _$AnimeEpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeEpisodeImplFromJson(json);

  @override
  final int? airingAt;
  @override
  final int? timeUntilAiring;
  @override
  final int? episode;

  @override
  String toString() {
    return 'AnimeEpisode(airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeEpisodeImpl &&
            (identical(other.airingAt, airingAt) ||
                other.airingAt == airingAt) &&
            (identical(other.timeUntilAiring, timeUntilAiring) ||
                other.timeUntilAiring == timeUntilAiring) &&
            (identical(other.episode, episode) || other.episode == episode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, airingAt, timeUntilAiring, episode);

  /// Create a copy of AnimeEpisode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeEpisodeImplCopyWith<_$AnimeEpisodeImpl> get copyWith =>
      __$$AnimeEpisodeImplCopyWithImpl<_$AnimeEpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeEpisodeImplToJson(
      this,
    );
  }
}

abstract class _AnimeEpisode implements AnimeEpisode {
  const factory _AnimeEpisode(
      {final int? airingAt,
      final int? timeUntilAiring,
      final int? episode}) = _$AnimeEpisodeImpl;

  factory _AnimeEpisode.fromJson(Map<String, dynamic> json) =
      _$AnimeEpisodeImpl.fromJson;

  @override
  int? get airingAt;
  @override
  int? get timeUntilAiring;
  @override
  int? get episode;

  /// Create a copy of AnimeEpisode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeEpisodeImplCopyWith<_$AnimeEpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
