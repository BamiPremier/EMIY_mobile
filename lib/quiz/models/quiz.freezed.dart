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
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  QuizAnime get anime => throw _privateConstructorUsedError;
  QuizUser get user => throw _privateConstructorUsedError;
  bool get reported => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  QuizParticipation? get participation => throw _privateConstructorUsedError;

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
      {String id,
      String title,
      String description,
      QuizAnime anime,
      QuizUser user,
      bool reported,
      @JsonKey(name: 'created_at') int createdAt,
      String status,
      QuizParticipation? participation});

  $QuizAnimeCopyWith<$Res> get anime;
  $QuizUserCopyWith<$Res> get user;
  $QuizParticipationCopyWith<$Res>? get participation;
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
    Object? anime = null,
    Object? user = null,
    Object? reported = null,
    Object? createdAt = null,
    Object? status = null,
    Object? participation = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as QuizAnime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QuizUser,
      reported: null == reported
          ? _value.reported
          : reported // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      participation: freezed == participation
          ? _value.participation
          : participation // ignore: cast_nullable_to_non_nullable
              as QuizParticipation?,
    ) as $Val);
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizAnimeCopyWith<$Res> get anime {
    return $QuizAnimeCopyWith<$Res>(_value.anime, (value) {
      return _then(_value.copyWith(anime: value) as $Val);
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizUserCopyWith<$Res> get user {
    return $QuizUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizParticipationCopyWith<$Res>? get participation {
    if (_value.participation == null) {
      return null;
    }

    return $QuizParticipationCopyWith<$Res>(_value.participation!, (value) {
      return _then(_value.copyWith(participation: value) as $Val);
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
      {String id,
      String title,
      String description,
      QuizAnime anime,
      QuizUser user,
      bool reported,
      @JsonKey(name: 'created_at') int createdAt,
      String status,
      QuizParticipation? participation});

  @override
  $QuizAnimeCopyWith<$Res> get anime;
  @override
  $QuizUserCopyWith<$Res> get user;
  @override
  $QuizParticipationCopyWith<$Res>? get participation;
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
    Object? anime = null,
    Object? user = null,
    Object? reported = null,
    Object? createdAt = null,
    Object? status = null,
    Object? participation = freezed,
  }) {
    return _then(_$QuizImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as QuizAnime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QuizUser,
      reported: null == reported
          ? _value.reported
          : reported // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      participation: freezed == participation
          ? _value.participation
          : participation // ignore: cast_nullable_to_non_nullable
              as QuizParticipation?,
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
      required this.anime,
      required this.user,
      required this.reported,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.status,
      this.participation});

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final QuizAnime anime;
  @override
  final QuizUser user;
  @override
  final bool reported;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  final String status;
  @override
  final QuizParticipation? participation;

  @override
  String toString() {
    return 'Quiz(id: $id, title: $title, description: $description, anime: $anime, user: $user, reported: $reported, createdAt: $createdAt, status: $status, participation: $participation)';
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
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.reported, reported) ||
                other.reported == reported) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.participation, participation) ||
                other.participation == participation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, anime,
      user, reported, createdAt, status, participation);

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
      {required final String id,
      required final String title,
      required final String description,
      required final QuizAnime anime,
      required final QuizUser user,
      required final bool reported,
      @JsonKey(name: 'created_at') required final int createdAt,
      required final String status,
      final QuizParticipation? participation}) = _$QuizImpl;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  QuizAnime get anime;
  @override
  QuizUser get user;
  @override
  bool get reported;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  String get status;
  @override
  QuizParticipation? get participation;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizAnime _$QuizAnimeFromJson(Map<String, dynamic> json) {
  return _QuizAnime.fromJson(json);
}

/// @nodoc
mixin _$QuizAnime {
  int get id => throw _privateConstructorUsedError;
  QuizTitle get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  QuizCoverImage get coverImage => throw _privateConstructorUsedError;
  String? get bannerImage => throw _privateConstructorUsedError;
  QuizDate? get startDate => throw _privateConstructorUsedError;
  QuizDate? get endDate => throw _privateConstructorUsedError;
  QuizEpisode? get nextAiringEpisode => throw _privateConstructorUsedError;
  String? get season => throw _privateConstructorUsedError;
  int? get seasonYear => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  int? get episodes => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get chapters => throw _privateConstructorUsedError;
  int? get volumes => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;
  bool get isAdult => throw _privateConstructorUsedError;
  int? get averageScore => throw _privateConstructorUsedError;
  int? get popularity => throw _privateConstructorUsedError;

  /// Serializes this QuizAnime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizAnime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizAnimeCopyWith<QuizAnime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnimeCopyWith<$Res> {
  factory $QuizAnimeCopyWith(QuizAnime value, $Res Function(QuizAnime) then) =
      _$QuizAnimeCopyWithImpl<$Res, QuizAnime>;
  @useResult
  $Res call(
      {int id,
      QuizTitle title,
      String description,
      QuizCoverImage coverImage,
      String? bannerImage,
      QuizDate? startDate,
      QuizDate? endDate,
      QuizEpisode? nextAiringEpisode,
      String? season,
      int? seasonYear,
      String? type,
      String? format,
      int? episodes,
      int? duration,
      int? chapters,
      int? volumes,
      List<String>? genres,
      bool isAdult,
      int? averageScore,
      int? popularity});

  $QuizTitleCopyWith<$Res> get title;
  $QuizCoverImageCopyWith<$Res> get coverImage;
  $QuizDateCopyWith<$Res>? get startDate;
  $QuizDateCopyWith<$Res>? get endDate;
  $QuizEpisodeCopyWith<$Res>? get nextAiringEpisode;
}

/// @nodoc
class _$QuizAnimeCopyWithImpl<$Res, $Val extends QuizAnime>
    implements $QuizAnimeCopyWith<$Res> {
  _$QuizAnimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizAnime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? coverImage = null,
    Object? bannerImage = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? nextAiringEpisode = freezed,
    Object? season = freezed,
    Object? seasonYear = freezed,
    Object? type = freezed,
    Object? format = freezed,
    Object? episodes = freezed,
    Object? duration = freezed,
    Object? chapters = freezed,
    Object? volumes = freezed,
    Object? genres = freezed,
    Object? isAdult = null,
    Object? averageScore = freezed,
    Object? popularity = freezed,
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as QuizDate?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as QuizDate?,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as QuizEpisode?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonYear: freezed == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int?,
      volumes: freezed == volumes
          ? _value.volumes
          : volumes // ignore: cast_nullable_to_non_nullable
              as int?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAdult: null == isAdult
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as int?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of QuizAnime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizTitleCopyWith<$Res> get title {
    return $QuizTitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  /// Create a copy of QuizAnime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizCoverImageCopyWith<$Res> get coverImage {
    return $QuizCoverImageCopyWith<$Res>(_value.coverImage, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }

  /// Create a copy of QuizAnime
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

  /// Create a copy of QuizAnime
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

  /// Create a copy of QuizAnime
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
}

/// @nodoc
abstract class _$$QuizAnimeImplCopyWith<$Res>
    implements $QuizAnimeCopyWith<$Res> {
  factory _$$QuizAnimeImplCopyWith(
          _$QuizAnimeImpl value, $Res Function(_$QuizAnimeImpl) then) =
      __$$QuizAnimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      QuizTitle title,
      String description,
      QuizCoverImage coverImage,
      String? bannerImage,
      QuizDate? startDate,
      QuizDate? endDate,
      QuizEpisode? nextAiringEpisode,
      String? season,
      int? seasonYear,
      String? type,
      String? format,
      int? episodes,
      int? duration,
      int? chapters,
      int? volumes,
      List<String>? genres,
      bool isAdult,
      int? averageScore,
      int? popularity});

  @override
  $QuizTitleCopyWith<$Res> get title;
  @override
  $QuizCoverImageCopyWith<$Res> get coverImage;
  @override
  $QuizDateCopyWith<$Res>? get startDate;
  @override
  $QuizDateCopyWith<$Res>? get endDate;
  @override
  $QuizEpisodeCopyWith<$Res>? get nextAiringEpisode;
}

/// @nodoc
class __$$QuizAnimeImplCopyWithImpl<$Res>
    extends _$QuizAnimeCopyWithImpl<$Res, _$QuizAnimeImpl>
    implements _$$QuizAnimeImplCopyWith<$Res> {
  __$$QuizAnimeImplCopyWithImpl(
      _$QuizAnimeImpl _value, $Res Function(_$QuizAnimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizAnime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? coverImage = null,
    Object? bannerImage = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? nextAiringEpisode = freezed,
    Object? season = freezed,
    Object? seasonYear = freezed,
    Object? type = freezed,
    Object? format = freezed,
    Object? episodes = freezed,
    Object? duration = freezed,
    Object? chapters = freezed,
    Object? volumes = freezed,
    Object? genres = freezed,
    Object? isAdult = null,
    Object? averageScore = freezed,
    Object? popularity = freezed,
  }) {
    return _then(_$QuizAnimeImpl(
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as QuizDate?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as QuizDate?,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as QuizEpisode?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonYear: freezed == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int?,
      volumes: freezed == volumes
          ? _value.volumes
          : volumes // ignore: cast_nullable_to_non_nullable
              as int?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAdult: null == isAdult
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as int?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizAnimeImpl implements _QuizAnime {
  const _$QuizAnimeImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.coverImage,
      this.bannerImage,
      this.startDate,
      this.endDate,
      this.nextAiringEpisode,
      this.season,
      this.seasonYear,
      this.type,
      this.format,
      this.episodes,
      this.duration,
      this.chapters,
      this.volumes,
      final List<String>? genres,
      this.isAdult = false,
      this.averageScore,
      this.popularity})
      : _genres = genres;

  factory _$QuizAnimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizAnimeImplFromJson(json);

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
  final QuizDate? startDate;
  @override
  final QuizDate? endDate;
  @override
  final QuizEpisode? nextAiringEpisode;
  @override
  final String? season;
  @override
  final int? seasonYear;
  @override
  final String? type;
  @override
  final String? format;
  @override
  final int? episodes;
  @override
  final int? duration;
  @override
  final int? chapters;
  @override
  final int? volumes;
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
  final int? averageScore;
  @override
  final int? popularity;

  @override
  String toString() {
    return 'QuizAnime(id: $id, title: $title, description: $description, coverImage: $coverImage, bannerImage: $bannerImage, startDate: $startDate, endDate: $endDate, nextAiringEpisode: $nextAiringEpisode, season: $season, seasonYear: $seasonYear, type: $type, format: $format, episodes: $episodes, duration: $duration, chapters: $chapters, volumes: $volumes, genres: $genres, isAdult: $isAdult, averageScore: $averageScore, popularity: $popularity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizAnimeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.nextAiringEpisode, nextAiringEpisode) ||
                other.nextAiringEpisode == nextAiringEpisode) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.seasonYear, seasonYear) ||
                other.seasonYear == seasonYear) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.episodes, episodes) ||
                other.episodes == episodes) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.chapters, chapters) ||
                other.chapters == chapters) &&
            (identical(other.volumes, volumes) || other.volumes == volumes) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.isAdult, isAdult) || other.isAdult == isAdult) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity));
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
        startDate,
        endDate,
        nextAiringEpisode,
        season,
        seasonYear,
        type,
        format,
        episodes,
        duration,
        chapters,
        volumes,
        const DeepCollectionEquality().hash(_genres),
        isAdult,
        averageScore,
        popularity
      ]);

  /// Create a copy of QuizAnime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizAnimeImplCopyWith<_$QuizAnimeImpl> get copyWith =>
      __$$QuizAnimeImplCopyWithImpl<_$QuizAnimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizAnimeImplToJson(
      this,
    );
  }
}

abstract class _QuizAnime implements QuizAnime {
  const factory _QuizAnime(
      {required final int id,
      required final QuizTitle title,
      required final String description,
      required final QuizCoverImage coverImage,
      final String? bannerImage,
      final QuizDate? startDate,
      final QuizDate? endDate,
      final QuizEpisode? nextAiringEpisode,
      final String? season,
      final int? seasonYear,
      final String? type,
      final String? format,
      final int? episodes,
      final int? duration,
      final int? chapters,
      final int? volumes,
      final List<String>? genres,
      final bool isAdult,
      final int? averageScore,
      final int? popularity}) = _$QuizAnimeImpl;

  factory _QuizAnime.fromJson(Map<String, dynamic> json) =
      _$QuizAnimeImpl.fromJson;

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
  QuizDate? get startDate;
  @override
  QuizDate? get endDate;
  @override
  QuizEpisode? get nextAiringEpisode;
  @override
  String? get season;
  @override
  int? get seasonYear;
  @override
  String? get type;
  @override
  String? get format;
  @override
  int? get episodes;
  @override
  int? get duration;
  @override
  int? get chapters;
  @override
  int? get volumes;
  @override
  List<String>? get genres;
  @override
  bool get isAdult;
  @override
  int? get averageScore;
  @override
  int? get popularity;

  /// Create a copy of QuizAnime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizAnimeImplCopyWith<_$QuizAnimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizUser _$QuizUserFromJson(Map<String, dynamic> json) {
  return _QuizUser.fromJson(json);
}

/// @nodoc
mixin _$QuizUser {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get usertag => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_full')
  String get imageFull => throw _privateConstructorUsedError;
  String get biography => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_count')
  int get followingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'animes_viewed_count')
  int get animesViewedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchlist_count')
  int get watchlistCount => throw _privateConstructorUsedError;
  bool get followed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following_me')
  bool get isFollowingMe => throw _privateConstructorUsedError;
  bool get hasBlocked => throw _privateConstructorUsedError;

  /// Serializes this QuizUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizUserCopyWith<QuizUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizUserCopyWith<$Res> {
  factory $QuizUserCopyWith(QuizUser value, $Res Function(QuizUser) then) =
      _$QuizUserCopyWithImpl<$Res, QuizUser>;
  @useResult
  $Res call(
      {String id,
      String username,
      String usertag,
      String image,
      @JsonKey(name: 'image_full') String imageFull,
      String biography,
      String type,
      String status,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount,
      @JsonKey(name: 'animes_viewed_count') int animesViewedCount,
      @JsonKey(name: 'watchlist_count') int watchlistCount,
      bool followed,
      @JsonKey(name: 'is_following_me') bool isFollowingMe,
      bool hasBlocked});
}

/// @nodoc
class _$QuizUserCopyWithImpl<$Res, $Val extends QuizUser>
    implements $QuizUserCopyWith<$Res> {
  _$QuizUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? usertag = null,
    Object? image = null,
    Object? imageFull = null,
    Object? biography = null,
    Object? type = null,
    Object? status = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? animesViewedCount = null,
    Object? watchlistCount = null,
    Object? followed = null,
    Object? isFollowingMe = null,
    Object? hasBlocked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      usertag: null == usertag
          ? _value.usertag
          : usertag // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      imageFull: null == imageFull
          ? _value.imageFull
          : imageFull // ignore: cast_nullable_to_non_nullable
              as String,
      biography: null == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      animesViewedCount: null == animesViewedCount
          ? _value.animesViewedCount
          : animesViewedCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchlistCount: null == watchlistCount
          ? _value.watchlistCount
          : watchlistCount // ignore: cast_nullable_to_non_nullable
              as int,
      followed: null == followed
          ? _value.followed
          : followed // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowingMe: null == isFollowingMe
          ? _value.isFollowingMe
          : isFollowingMe // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBlocked: null == hasBlocked
          ? _value.hasBlocked
          : hasBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizUserImplCopyWith<$Res>
    implements $QuizUserCopyWith<$Res> {
  factory _$$QuizUserImplCopyWith(
          _$QuizUserImpl value, $Res Function(_$QuizUserImpl) then) =
      __$$QuizUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String usertag,
      String image,
      @JsonKey(name: 'image_full') String imageFull,
      String biography,
      String type,
      String status,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'following_count') int followingCount,
      @JsonKey(name: 'animes_viewed_count') int animesViewedCount,
      @JsonKey(name: 'watchlist_count') int watchlistCount,
      bool followed,
      @JsonKey(name: 'is_following_me') bool isFollowingMe,
      bool hasBlocked});
}

/// @nodoc
class __$$QuizUserImplCopyWithImpl<$Res>
    extends _$QuizUserCopyWithImpl<$Res, _$QuizUserImpl>
    implements _$$QuizUserImplCopyWith<$Res> {
  __$$QuizUserImplCopyWithImpl(
      _$QuizUserImpl _value, $Res Function(_$QuizUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? usertag = null,
    Object? image = null,
    Object? imageFull = null,
    Object? biography = null,
    Object? type = null,
    Object? status = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? animesViewedCount = null,
    Object? watchlistCount = null,
    Object? followed = null,
    Object? isFollowingMe = null,
    Object? hasBlocked = null,
  }) {
    return _then(_$QuizUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      usertag: null == usertag
          ? _value.usertag
          : usertag // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      imageFull: null == imageFull
          ? _value.imageFull
          : imageFull // ignore: cast_nullable_to_non_nullable
              as String,
      biography: null == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      animesViewedCount: null == animesViewedCount
          ? _value.animesViewedCount
          : animesViewedCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchlistCount: null == watchlistCount
          ? _value.watchlistCount
          : watchlistCount // ignore: cast_nullable_to_non_nullable
              as int,
      followed: null == followed
          ? _value.followed
          : followed // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowingMe: null == isFollowingMe
          ? _value.isFollowingMe
          : isFollowingMe // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBlocked: null == hasBlocked
          ? _value.hasBlocked
          : hasBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizUserImpl implements _QuizUser {
  const _$QuizUserImpl(
      {required this.id,
      required this.username,
      required this.usertag,
      required this.image,
      @JsonKey(name: 'image_full') required this.imageFull,
      required this.biography,
      required this.type,
      required this.status,
      @JsonKey(name: 'followers_count') required this.followersCount,
      @JsonKey(name: 'following_count') required this.followingCount,
      @JsonKey(name: 'animes_viewed_count') required this.animesViewedCount,
      @JsonKey(name: 'watchlist_count') required this.watchlistCount,
      required this.followed,
      @JsonKey(name: 'is_following_me') required this.isFollowingMe,
      required this.hasBlocked});

  factory _$QuizUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizUserImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String usertag;
  @override
  final String image;
  @override
  @JsonKey(name: 'image_full')
  final String imageFull;
  @override
  final String biography;
  @override
  final String type;
  @override
  final String status;
  @override
  @JsonKey(name: 'followers_count')
  final int followersCount;
  @override
  @JsonKey(name: 'following_count')
  final int followingCount;
  @override
  @JsonKey(name: 'animes_viewed_count')
  final int animesViewedCount;
  @override
  @JsonKey(name: 'watchlist_count')
  final int watchlistCount;
  @override
  final bool followed;
  @override
  @JsonKey(name: 'is_following_me')
  final bool isFollowingMe;
  @override
  final bool hasBlocked;

  @override
  String toString() {
    return 'QuizUser(id: $id, username: $username, usertag: $usertag, image: $image, imageFull: $imageFull, biography: $biography, type: $type, status: $status, followersCount: $followersCount, followingCount: $followingCount, animesViewedCount: $animesViewedCount, watchlistCount: $watchlistCount, followed: $followed, isFollowingMe: $isFollowingMe, hasBlocked: $hasBlocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.usertag, usertag) || other.usertag == usertag) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageFull, imageFull) ||
                other.imageFull == imageFull) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.animesViewedCount, animesViewedCount) ||
                other.animesViewedCount == animesViewedCount) &&
            (identical(other.watchlistCount, watchlistCount) ||
                other.watchlistCount == watchlistCount) &&
            (identical(other.followed, followed) ||
                other.followed == followed) &&
            (identical(other.isFollowingMe, isFollowingMe) ||
                other.isFollowingMe == isFollowingMe) &&
            (identical(other.hasBlocked, hasBlocked) ||
                other.hasBlocked == hasBlocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      usertag,
      image,
      imageFull,
      biography,
      type,
      status,
      followersCount,
      followingCount,
      animesViewedCount,
      watchlistCount,
      followed,
      isFollowingMe,
      hasBlocked);

  /// Create a copy of QuizUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizUserImplCopyWith<_$QuizUserImpl> get copyWith =>
      __$$QuizUserImplCopyWithImpl<_$QuizUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizUserImplToJson(
      this,
    );
  }
}

abstract class _QuizUser implements QuizUser {
  const factory _QuizUser(
      {required final String id,
      required final String username,
      required final String usertag,
      required final String image,
      @JsonKey(name: 'image_full') required final String imageFull,
      required final String biography,
      required final String type,
      required final String status,
      @JsonKey(name: 'followers_count') required final int followersCount,
      @JsonKey(name: 'following_count') required final int followingCount,
      @JsonKey(name: 'animes_viewed_count')
      required final int animesViewedCount,
      @JsonKey(name: 'watchlist_count') required final int watchlistCount,
      required final bool followed,
      @JsonKey(name: 'is_following_me') required final bool isFollowingMe,
      required final bool hasBlocked}) = _$QuizUserImpl;

  factory _QuizUser.fromJson(Map<String, dynamic> json) =
      _$QuizUserImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get usertag;
  @override
  String get image;
  @override
  @JsonKey(name: 'image_full')
  String get imageFull;
  @override
  String get biography;
  @override
  String get type;
  @override
  String get status;
  @override
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @override
  @JsonKey(name: 'following_count')
  int get followingCount;
  @override
  @JsonKey(name: 'animes_viewed_count')
  int get animesViewedCount;
  @override
  @JsonKey(name: 'watchlist_count')
  int get watchlistCount;
  @override
  bool get followed;
  @override
  @JsonKey(name: 'is_following_me')
  bool get isFollowingMe;
  @override
  bool get hasBlocked;

  /// Create a copy of QuizUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizUserImplCopyWith<_$QuizUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizParticipation _$QuizParticipationFromJson(Map<String, dynamic> json) {
  return _QuizParticipation.fromJson(json);
}

/// @nodoc
mixin _$QuizParticipation {
  String get id => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  QuizUser get user => throw _privateConstructorUsedError;

  /// Serializes this QuizParticipation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizParticipation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizParticipationCopyWith<QuizParticipation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizParticipationCopyWith<$Res> {
  factory $QuizParticipationCopyWith(
          QuizParticipation value, $Res Function(QuizParticipation) then) =
      _$QuizParticipationCopyWithImpl<$Res, QuizParticipation>;
  @useResult
  $Res call({String id, int score, int rank, QuizUser user});

  $QuizUserCopyWith<$Res> get user;
}

/// @nodoc
class _$QuizParticipationCopyWithImpl<$Res, $Val extends QuizParticipation>
    implements $QuizParticipationCopyWith<$Res> {
  _$QuizParticipationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizParticipation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? score = null,
    Object? rank = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QuizUser,
    ) as $Val);
  }

  /// Create a copy of QuizParticipation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizUserCopyWith<$Res> get user {
    return $QuizUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizParticipationImplCopyWith<$Res>
    implements $QuizParticipationCopyWith<$Res> {
  factory _$$QuizParticipationImplCopyWith(_$QuizParticipationImpl value,
          $Res Function(_$QuizParticipationImpl) then) =
      __$$QuizParticipationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int score, int rank, QuizUser user});

  @override
  $QuizUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$QuizParticipationImplCopyWithImpl<$Res>
    extends _$QuizParticipationCopyWithImpl<$Res, _$QuizParticipationImpl>
    implements _$$QuizParticipationImplCopyWith<$Res> {
  __$$QuizParticipationImplCopyWithImpl(_$QuizParticipationImpl _value,
      $Res Function(_$QuizParticipationImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizParticipation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? score = null,
    Object? rank = null,
    Object? user = null,
  }) {
    return _then(_$QuizParticipationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QuizUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizParticipationImpl implements _QuizParticipation {
  const _$QuizParticipationImpl(
      {required this.id,
      required this.score,
      required this.rank,
      required this.user});

  factory _$QuizParticipationImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizParticipationImplFromJson(json);

  @override
  final String id;
  @override
  final int score;
  @override
  final int rank;
  @override
  final QuizUser user;

  @override
  String toString() {
    return 'QuizParticipation(id: $id, score: $score, rank: $rank, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizParticipationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, score, rank, user);

  /// Create a copy of QuizParticipation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizParticipationImplCopyWith<_$QuizParticipationImpl> get copyWith =>
      __$$QuizParticipationImplCopyWithImpl<_$QuizParticipationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizParticipationImplToJson(
      this,
    );
  }
}

abstract class _QuizParticipation implements QuizParticipation {
  const factory _QuizParticipation(
      {required final String id,
      required final int score,
      required final int rank,
      required final QuizUser user}) = _$QuizParticipationImpl;

  factory _QuizParticipation.fromJson(Map<String, dynamic> json) =
      _$QuizParticipationImpl.fromJson;

  @override
  String get id;
  @override
  int get score;
  @override
  int get rank;
  @override
  QuizUser get user;

  /// Create a copy of QuizParticipation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizParticipationImplCopyWith<_$QuizParticipationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizTitle _$QuizTitleFromJson(Map<String, dynamic> json) {
  return _QuizTitle.fromJson(json);
}

/// @nodoc
mixin _$QuizTitle {
  String? get english => throw _privateConstructorUsedError;
  String? get native => throw _privateConstructorUsedError;
  String? get romaji => throw _privateConstructorUsedError;
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
      {String? english, String? native, String? romaji, String? userPreferred});
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
    Object? english = freezed,
    Object? native = freezed,
    Object? romaji = freezed,
    Object? userPreferred = freezed,
  }) {
    return _then(_value.copyWith(
      english: freezed == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
      native: freezed == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
      romaji: freezed == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
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
      {String? english, String? native, String? romaji, String? userPreferred});
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
    Object? english = freezed,
    Object? native = freezed,
    Object? romaji = freezed,
    Object? userPreferred = freezed,
  }) {
    return _then(_$QuizTitleImpl(
      english: freezed == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
      native: freezed == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
      romaji: freezed == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
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
      {this.english, this.native, this.romaji, this.userPreferred});

  factory _$QuizTitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizTitleImplFromJson(json);

  @override
  final String? english;
  @override
  final String? native;
  @override
  final String? romaji;
  @override
  final String? userPreferred;

  @override
  String toString() {
    return 'QuizTitle(english: $english, native: $native, romaji: $romaji, userPreferred: $userPreferred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizTitleImpl &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.native, native) || other.native == native) &&
            (identical(other.romaji, romaji) || other.romaji == romaji) &&
            (identical(other.userPreferred, userPreferred) ||
                other.userPreferred == userPreferred));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, english, native, romaji, userPreferred);

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
      {final String? english,
      final String? native,
      final String? romaji,
      final String? userPreferred}) = _$QuizTitleImpl;

  factory _QuizTitle.fromJson(Map<String, dynamic> json) =
      _$QuizTitleImpl.fromJson;

  @override
  String? get english;
  @override
  String? get native;
  @override
  String? get romaji;
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
