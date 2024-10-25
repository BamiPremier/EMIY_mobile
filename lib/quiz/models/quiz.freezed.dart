// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  int get id => throw _privateConstructorUsedError;
  QuizTitle get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  QuizCoverImage get coverImage => throw _privateConstructorUsedError;
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
  QuizDate? get endDate => throw _privateConstructorUsedError;
  int? get episodes => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;
  bool get isAdult => throw _privateConstructorUsedError;
  QuizEpisode? get nextAiringEpisode => throw _privateConstructorUsedError;
  int? get popularity => throw _privateConstructorUsedError;
  String? get season => throw _privateConstructorUsedError;
  int? get seasonYear => throw _privateConstructorUsedError;
  QuizDate? get startDate => throw _privateConstructorUsedError;
  int? get volumes => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchlist_count')
  int get watchlistCount => throw _privateConstructorUsedError;

  /// Serializes this Quiz to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {int id,
      QuizTitle title,
      String description,
      QuizCoverImage coverImage,
      String? bannerImage,
      @JsonKey(name: 'is_viewed') bool isViewed,
      @JsonKey(name: 'is_in_watchlist') bool isInWatchlist,
      @JsonKey(name: 'anime_view_count') int animeViewCount,
      int? averageScore,
      int? chapters,
      int? duration,
      QuizDate? endDate,
      int? episodes,
      String? format,
      List<String>? genres,
      bool isAdult,
      QuizEpisode? nextAiringEpisode,
      int? popularity,
      String? season,
      int? seasonYear,
      QuizDate? startDate,
      int? volumes,
      @JsonKey(name: 'watchlist_count') int watchlistCount});

  $QuizTitleCopyWith<$Res> get title;
  $QuizCoverImageCopyWith<$Res> get coverImage;
  $QuizDateCopyWith<$Res>? get endDate;
  $QuizEpisodeCopyWith<$Res>? get nextAiringEpisode;
  $QuizDateCopyWith<$Res>? get startDate;
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Quiz
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
              as QuizTitle,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as QuizCoverImage,
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
              as QuizDate?,
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
              as QuizEpisode?,
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
              as QuizDate?,
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

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizTitleCopyWith<$Res> get title {
    return $QuizTitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizCoverImageCopyWith<$Res> get coverImage {
    return $QuizCoverImageCopyWith<$Res>(_value.coverImage, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizDateCopyWith<$Res>? get endDate {
    if (_value.endDate == null) {
      return null;
    }

    return $QuizDateCopyWith<$Res>(_value.endDate!, (value) {
      return _then(_value.copyWith(endDate: value) as $Val);
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizEpisodeCopyWith<$Res>? get nextAiringEpisode {
    if (_value.nextAiringEpisode == null) {
      return null;
    }

    return $QuizEpisodeCopyWith<$Res>(_value.nextAiringEpisode!, (value) {
      return _then(_value.copyWith(nextAiringEpisode: value) as $Val);
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizDateCopyWith<$Res>? get startDate {
    if (_value.startDate == null) {
      return null;
    }

    return $QuizDateCopyWith<$Res>(_value.startDate!, (value) {
      return _then(_value.copyWith(startDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      QuizTitle title,
      String description,
      QuizCoverImage coverImage,
      String? bannerImage,
      @JsonKey(name: 'is_viewed') bool isViewed,
      @JsonKey(name: 'is_in_watchlist') bool isInWatchlist,
      @JsonKey(name: 'anime_view_count') int animeViewCount,
      int? averageScore,
      int? chapters,
      int? duration,
      QuizDate? endDate,
      int? episodes,
      String? format,
      List<String>? genres,
      bool isAdult,
      QuizEpisode? nextAiringEpisode,
      int? popularity,
      String? season,
      int? seasonYear,
      QuizDate? startDate,
      int? volumes,
      @JsonKey(name: 'watchlist_count') int watchlistCount});

  @override
  $QuizTitleCopyWith<$Res> get title;
  @override
  $QuizCoverImageCopyWith<$Res> get coverImage;
  @override
  $QuizDateCopyWith<$Res>? get endDate;
  @override
  $QuizEpisodeCopyWith<$Res>? get nextAiringEpisode;
  @override
  $QuizDateCopyWith<$Res>? get startDate;
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  /// Create a copy of Quiz
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
    return _then(_$QuizImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as QuizTitle,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as QuizCoverImage,
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
              as QuizDate?,
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
              as QuizEpisode?,
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
              as QuizDate?,
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
class _$QuizImpl implements _Quiz {
  const _$QuizImpl(
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

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  final int id;
  @override
  final QuizTitle title;
  @override
  final String description;
  @override
  final QuizCoverImage coverImage;
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
  final QuizDate? endDate;
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
  final QuizEpisode? nextAiringEpisode;
  @override
  final int? popularity;
  @override
  final String? season;
  @override
  final int? seasonYear;
  @override
  final QuizDate? startDate;
  @override
  final int? volumes;
  @override
  @JsonKey(name: 'watchlist_count')
  final int watchlistCount;

  @override
  String toString() {
    return 'Quiz(id: $id, title: $title, description: $description, coverImage: $coverImage, bannerImage: $bannerImage, isViewed: $isViewed, isInWatchlist: $isInWatchlist, animeViewCount: $animeViewCount, averageScore: $averageScore, chapters: $chapters, duration: $duration, endDate: $endDate, episodes: $episodes, format: $format, genres: $genres, isAdult: $isAdult, nextAiringEpisode: $nextAiringEpisode, popularity: $popularity, season: $season, seasonYear: $seasonYear, startDate: $startDate, volumes: $volumes, watchlistCount: $watchlistCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
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

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizImplToJson(
      this,
    );
  }
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {required final int id,
      required final QuizTitle title,
      required final String description,
      required final QuizCoverImage coverImage,
      required final String? bannerImage,
      @JsonKey(name: 'is_viewed') final bool isViewed,
      @JsonKey(name: 'is_in_watchlist') final bool isInWatchlist,
      @JsonKey(name: 'anime_view_count') final int animeViewCount,
      final int? averageScore,
      final int? chapters,
      final int? duration,
      final QuizDate? endDate,
      final int? episodes,
      final String? format,
      final List<String>? genres,
      final bool isAdult,
      final QuizEpisode? nextAiringEpisode,
      final int? popularity,
      final String? season,
      final int? seasonYear,
      final QuizDate? startDate,
      final int? volumes,
      @JsonKey(name: 'watchlist_count') final int watchlistCount}) = _$QuizImpl;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  int get id;
  @override
  QuizTitle get title;
  @override
  String get description;
  @override
  QuizCoverImage get coverImage;
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
  QuizDate? get endDate;
  @override
  int? get episodes;
  @override
  String? get format;
  @override
  List<String>? get genres;
  @override
  bool get isAdult;
  @override
  QuizEpisode? get nextAiringEpisode;
  @override
  int? get popularity;
  @override
  String? get season;
  @override
  int? get seasonYear;
  @override
  QuizDate? get startDate;
  @override
  int? get volumes;
  @override
  @JsonKey(name: 'watchlist_count')
  int get watchlistCount;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizTitle _$QuizTitleFromJson(Map<String, dynamic> json) {
  return _QuizTitle.fromJson(json);
}

/// @nodoc
mixin _$QuizTitle {
  String get romaji => throw _privateConstructorUsedError;
  String? get english => throw _privateConstructorUsedError;
  String? get native => throw _privateConstructorUsedError;
  String? get userPreferred => throw _privateConstructorUsedError;

  /// Serializes this QuizTitle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizTitleCopyWith<QuizTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizTitleCopyWith<$Res> {
  factory $QuizTitleCopyWith(QuizTitle value, $Res Function(QuizTitle) then) =
      _$QuizTitleCopyWithImpl<$Res, QuizTitle>;
  @useResult
  $Res call(
      {String romaji, String? english, String? native, String? userPreferred});
}

/// @nodoc
class _$QuizTitleCopyWithImpl<$Res, $Val extends QuizTitle>
    implements $QuizTitleCopyWith<$Res> {
  _$QuizTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizTitle
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
abstract class _$$QuizTitleImplCopyWith<$Res>
    implements $QuizTitleCopyWith<$Res> {
  factory _$$QuizTitleImplCopyWith(
          _$QuizTitleImpl value, $Res Function(_$QuizTitleImpl) then) =
      __$$QuizTitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String romaji, String? english, String? native, String? userPreferred});
}

/// @nodoc
class __$$QuizTitleImplCopyWithImpl<$Res>
    extends _$QuizTitleCopyWithImpl<$Res, _$QuizTitleImpl>
    implements _$$QuizTitleImplCopyWith<$Res> {
  __$$QuizTitleImplCopyWithImpl(
      _$QuizTitleImpl _value, $Res Function(_$QuizTitleImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizTitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = freezed,
    Object? native = freezed,
    Object? userPreferred = freezed,
  }) {
    return _then(_$QuizTitleImpl(
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
class _$QuizTitleImpl implements _QuizTitle {
  const _$QuizTitleImpl(
      {required this.romaji, this.english, this.native, this.userPreferred});

  factory _$QuizTitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizTitleImplFromJson(json);

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
    return 'QuizTitle(romaji: $romaji, english: $english, native: $native, userPreferred: $userPreferred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizTitleImpl &&
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

  /// Create a copy of QuizTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizTitleImplCopyWith<_$QuizTitleImpl> get copyWith =>
      __$$QuizTitleImplCopyWithImpl<_$QuizTitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizTitleImplToJson(
      this,
    );
  }
}

abstract class _QuizTitle implements QuizTitle {
  const factory _QuizTitle(
      {required final String romaji,
      final String? english,
      final String? native,
      final String? userPreferred}) = _$QuizTitleImpl;

  factory _QuizTitle.fromJson(Map<String, dynamic> json) =
      _$QuizTitleImpl.fromJson;

  @override
  String get romaji;
  @override
  String? get english;
  @override
  String? get native;
  @override
  String? get userPreferred;

  /// Create a copy of QuizTitle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizTitleImplCopyWith<_$QuizTitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizCoverImage _$QuizCoverImageFromJson(Map<String, dynamic> json) {
  return _QuizCoverImage.fromJson(json);
}

/// @nodoc
mixin _$QuizCoverImage {
  String? get extraLarge => throw _privateConstructorUsedError;
  String? get large => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this QuizCoverImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizCoverImageCopyWith<QuizCoverImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCoverImageCopyWith<$Res> {
  factory $QuizCoverImageCopyWith(
          QuizCoverImage value, $Res Function(QuizCoverImage) then) =
      _$QuizCoverImageCopyWithImpl<$Res, QuizCoverImage>;
  @useResult
  $Res call({String? extraLarge, String? large, String? medium, String? color});
}

/// @nodoc
class _$QuizCoverImageCopyWithImpl<$Res, $Val extends QuizCoverImage>
    implements $QuizCoverImageCopyWith<$Res> {
  _$QuizCoverImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizCoverImage
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
abstract class _$$QuizCoverImageImplCopyWith<$Res>
    implements $QuizCoverImageCopyWith<$Res> {
  factory _$$QuizCoverImageImplCopyWith(_$QuizCoverImageImpl value,
          $Res Function(_$QuizCoverImageImpl) then) =
      __$$QuizCoverImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? extraLarge, String? large, String? medium, String? color});
}

/// @nodoc
class __$$QuizCoverImageImplCopyWithImpl<$Res>
    extends _$QuizCoverImageCopyWithImpl<$Res, _$QuizCoverImageImpl>
    implements _$$QuizCoverImageImplCopyWith<$Res> {
  __$$QuizCoverImageImplCopyWithImpl(
      _$QuizCoverImageImpl _value, $Res Function(_$QuizCoverImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? color = freezed,
  }) {
    return _then(_$QuizCoverImageImpl(
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
class _$QuizCoverImageImpl implements _QuizCoverImage {
  const _$QuizCoverImageImpl(
      {this.extraLarge, this.large, this.medium, this.color});

  factory _$QuizCoverImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizCoverImageImplFromJson(json);

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
    return 'QuizCoverImage(extraLarge: $extraLarge, large: $large, medium: $medium, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizCoverImageImpl &&
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

  /// Create a copy of QuizCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizCoverImageImplCopyWith<_$QuizCoverImageImpl> get copyWith =>
      __$$QuizCoverImageImplCopyWithImpl<_$QuizCoverImageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizCoverImageImplToJson(
      this,
    );
  }
}

abstract class _QuizCoverImage implements QuizCoverImage {
  const factory _QuizCoverImage(
      {final String? extraLarge,
      final String? large,
      final String? medium,
      final String? color}) = _$QuizCoverImageImpl;

  factory _QuizCoverImage.fromJson(Map<String, dynamic> json) =
      _$QuizCoverImageImpl.fromJson;

  @override
  String? get extraLarge;
  @override
  String? get large;
  @override
  String? get medium;
  @override
  String? get color;

  /// Create a copy of QuizCoverImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizCoverImageImplCopyWith<_$QuizCoverImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizDate _$QuizDateFromJson(Map<String, dynamic> json) {
  return _QuizDate.fromJson(json);
}

/// @nodoc
mixin _$QuizDate {
  int? get year => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;

  /// Serializes this QuizDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizDateCopyWith<QuizDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDateCopyWith<$Res> {
  factory $QuizDateCopyWith(QuizDate value, $Res Function(QuizDate) then) =
      _$QuizDateCopyWithImpl<$Res, QuizDate>;
  @useResult
  $Res call({int? year, int? month, int? day});
}

/// @nodoc
class _$QuizDateCopyWithImpl<$Res, $Val extends QuizDate>
    implements $QuizDateCopyWith<$Res> {
  _$QuizDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizDate
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
abstract class _$$QuizDateImplCopyWith<$Res>
    implements $QuizDateCopyWith<$Res> {
  factory _$$QuizDateImplCopyWith(
          _$QuizDateImpl value, $Res Function(_$QuizDateImpl) then) =
      __$$QuizDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? year, int? month, int? day});
}

/// @nodoc
class __$$QuizDateImplCopyWithImpl<$Res>
    extends _$QuizDateCopyWithImpl<$Res, _$QuizDateImpl>
    implements _$$QuizDateImplCopyWith<$Res> {
  __$$QuizDateImplCopyWithImpl(
      _$QuizDateImpl _value, $Res Function(_$QuizDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_$QuizDateImpl(
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
class _$QuizDateImpl implements _QuizDate {
  const _$QuizDateImpl({this.year, this.month, this.day});

  factory _$QuizDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizDateImplFromJson(json);

  @override
  final int? year;
  @override
  final int? month;
  @override
  final int? day;

  @override
  String toString() {
    return 'QuizDate(year: $year, month: $month, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizDateImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, day);

  /// Create a copy of QuizDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizDateImplCopyWith<_$QuizDateImpl> get copyWith =>
      __$$QuizDateImplCopyWithImpl<_$QuizDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizDateImplToJson(
      this,
    );
  }
}

abstract class _QuizDate implements QuizDate {
  const factory _QuizDate({final int? year, final int? month, final int? day}) =
      _$QuizDateImpl;

  factory _QuizDate.fromJson(Map<String, dynamic> json) =
      _$QuizDateImpl.fromJson;

  @override
  int? get year;
  @override
  int? get month;
  @override
  int? get day;

  /// Create a copy of QuizDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizDateImplCopyWith<_$QuizDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizEpisode _$QuizEpisodeFromJson(Map<String, dynamic> json) {
  return _QuizEpisode.fromJson(json);
}

/// @nodoc
mixin _$QuizEpisode {
  int? get airingAt => throw _privateConstructorUsedError;
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  int? get episode => throw _privateConstructorUsedError;

  /// Serializes this QuizEpisode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizEpisode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizEpisodeCopyWith<QuizEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizEpisodeCopyWith<$Res> {
  factory $QuizEpisodeCopyWith(
          QuizEpisode value, $Res Function(QuizEpisode) then) =
      _$QuizEpisodeCopyWithImpl<$Res, QuizEpisode>;
  @useResult
  $Res call({int? airingAt, int? timeUntilAiring, int? episode});
}

/// @nodoc
class _$QuizEpisodeCopyWithImpl<$Res, $Val extends QuizEpisode>
    implements $QuizEpisodeCopyWith<$Res> {
  _$QuizEpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizEpisode
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
abstract class _$$QuizEpisodeImplCopyWith<$Res>
    implements $QuizEpisodeCopyWith<$Res> {
  factory _$$QuizEpisodeImplCopyWith(
          _$QuizEpisodeImpl value, $Res Function(_$QuizEpisodeImpl) then) =
      __$$QuizEpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? airingAt, int? timeUntilAiring, int? episode});
}

/// @nodoc
class __$$QuizEpisodeImplCopyWithImpl<$Res>
    extends _$QuizEpisodeCopyWithImpl<$Res, _$QuizEpisodeImpl>
    implements _$$QuizEpisodeImplCopyWith<$Res> {
  __$$QuizEpisodeImplCopyWithImpl(
      _$QuizEpisodeImpl _value, $Res Function(_$QuizEpisodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizEpisode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_$QuizEpisodeImpl(
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
class _$QuizEpisodeImpl implements _QuizEpisode {
  const _$QuizEpisodeImpl({this.airingAt, this.timeUntilAiring, this.episode});

  factory _$QuizEpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizEpisodeImplFromJson(json);

  @override
  final int? airingAt;
  @override
  final int? timeUntilAiring;
  @override
  final int? episode;

  @override
  String toString() {
    return 'QuizEpisode(airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizEpisodeImpl &&
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

  /// Create a copy of QuizEpisode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizEpisodeImplCopyWith<_$QuizEpisodeImpl> get copyWith =>
      __$$QuizEpisodeImplCopyWithImpl<_$QuizEpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizEpisodeImplToJson(
      this,
    );
  }
}

abstract class _QuizEpisode implements QuizEpisode {
  const factory _QuizEpisode(
      {final int? airingAt,
      final int? timeUntilAiring,
      final int? episode}) = _$QuizEpisodeImpl;

  factory _QuizEpisode.fromJson(Map<String, dynamic> json) =
      _$QuizEpisodeImpl.fromJson;

  @override
  int? get airingAt;
  @override
  int? get timeUntilAiring;
  @override
  int? get episode;

  /// Create a copy of QuizEpisode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizEpisodeImplCopyWith<_$QuizEpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
