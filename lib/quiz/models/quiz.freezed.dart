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
  Anime? get anime => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  bool get reported => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  QuizParticipation? get participation => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_count')
  int get questionCount => throw _privateConstructorUsedError;

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
      Anime? anime,
      User user,
      bool reported,
      @JsonKey(name: 'created_at') int createdAt,
      String status,
      QuizParticipation? participation,
      @JsonKey(name: 'question_count') int questionCount});

  $AnimeCopyWith<$Res>? get anime;
  $UserCopyWith<$Res> get user;
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
    Object? anime = freezed,
    Object? user = null,
    Object? reported = null,
    Object? createdAt = null,
    Object? status = null,
    Object? participation = freezed,
    Object? questionCount = null,
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
      anime: freezed == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as Anime?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeCopyWith<$Res>? get anime {
    if (_value.anime == null) {
      return null;
    }

    return $AnimeCopyWith<$Res>(_value.anime!, (value) {
      return _then(_value.copyWith(anime: value) as $Val);
    });
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
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
      Anime? anime,
      User user,
      bool reported,
      @JsonKey(name: 'created_at') int createdAt,
      String status,
      QuizParticipation? participation,
      @JsonKey(name: 'question_count') int questionCount});

  @override
  $AnimeCopyWith<$Res>? get anime;
  @override
  $UserCopyWith<$Res> get user;
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
    Object? anime = freezed,
    Object? user = null,
    Object? reported = null,
    Object? createdAt = null,
    Object? status = null,
    Object? participation = freezed,
    Object? questionCount = null,
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
      anime: freezed == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as Anime?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
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
      required this.anime,
      required this.user,
      required this.reported,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.status,
      this.participation,
      @JsonKey(name: 'question_count') required this.questionCount});

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final Anime? anime;
  @override
  final User user;
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
  @JsonKey(name: 'question_count')
  final int questionCount;

  @override
  String toString() {
    return 'Quiz(id: $id, title: $title, description: $description, anime: $anime, user: $user, reported: $reported, createdAt: $createdAt, status: $status, participation: $participation, questionCount: $questionCount)';
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
                other.participation == participation) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, anime,
      user, reported, createdAt, status, participation, questionCount);

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
          required final Anime? anime,
          required final User user,
          required final bool reported,
          @JsonKey(name: 'created_at') required final int createdAt,
          required final String status,
          final QuizParticipation? participation,
          @JsonKey(name: 'question_count') required final int questionCount}) =
      _$QuizImpl;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  Anime? get anime;
  @override
  User get user;
  @override
  bool get reported;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  String get status;
  @override
  QuizParticipation? get participation;
  @override
  @JsonKey(name: 'question_count')
  int get questionCount;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizParticipation _$QuizParticipationFromJson(Map<String, dynamic> json) {
  return _QuizParticipation.fromJson(json);
}

/// @nodoc
mixin _$QuizParticipation {
  String get id => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

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
  $Res call({String id, int score, int? rank, User user});

  $UserCopyWith<$Res> get user;
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
    Object? rank = freezed,
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
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of QuizParticipation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
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
  $Res call({String id, int score, int? rank, User user});

  @override
  $UserCopyWith<$Res> get user;
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
    Object? rank = freezed,
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
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizParticipationImpl implements _QuizParticipation {
  const _$QuizParticipationImpl(
      {required this.id, required this.score, this.rank, required this.user});

  factory _$QuizParticipationImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizParticipationImplFromJson(json);

  @override
  final String id;
  @override
  final int score;
  @override
  final int? rank;
  @override
  final User user;

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
      final int? rank,
      required final User user}) = _$QuizParticipationImpl;

  factory _QuizParticipation.fromJson(Map<String, dynamic> json) =
      _$QuizParticipationImpl.fromJson;

  @override
  String get id;
  @override
  int get score;
  @override
  int? get rank;
  @override
  User get user;

  /// Create a copy of QuizParticipation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizParticipationImplCopyWith<_$QuizParticipationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
