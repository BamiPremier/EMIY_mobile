import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required String id,
    required String title,
    required String description,
    required QuizAnime anime,
    required QuizUser user,
    required bool reported,
    @JsonKey(name: 'created_at') required int createdAt,
    required String status,
    QuizParticipation? participation,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class QuizAnime with _$QuizAnime {
  const factory QuizAnime({
    required int id,
    required QuizTitle title,
    required String description,
    required QuizCoverImage coverImage,
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
    @Default(false) bool isAdult,
    int? averageScore,
    int? popularity,
  }) = _QuizAnime;

  factory QuizAnime.fromJson(Map<String, dynamic> json) =>
      _$QuizAnimeFromJson(json);
}

@freezed
class QuizUser with _$QuizUser {
  const factory QuizUser({
    required String id,
    required String username,
    required String usertag,
    required String image,
    @JsonKey(name: 'image_full') required String imageFull,
    required String biography,
    required String type,
    required String status,
    @JsonKey(name: 'followers_count') required int followersCount,
    @JsonKey(name: 'following_count') required int followingCount,
    @JsonKey(name: 'animes_viewed_count') required int animesViewedCount,
    @JsonKey(name: 'watchlist_count') required int watchlistCount,
    required bool followed,
    @JsonKey(name: 'is_following_me') required bool isFollowingMe,
    required bool hasBlocked,
  }) = _QuizUser;

  factory QuizUser.fromJson(Map<String, dynamic> json) =>
      _$QuizUserFromJson(json);
}

@freezed
class QuizParticipation with _$QuizParticipation {
  const factory QuizParticipation({
    required String id,
    required int score,
    required int rank,
    required QuizUser user,
  }) = _QuizParticipation;

  factory QuizParticipation.fromJson(Map<String, dynamic> json) =>
      _$QuizParticipationFromJson(json);
}

@freezed
class QuizTitle with _$QuizTitle {
  const factory QuizTitle({
    String? english,
    String? native,
    String? romaji,
    String? userPreferred,
  }) = _QuizTitle;

  factory QuizTitle.fromJson(Map<String, dynamic> json) =>
      _$QuizTitleFromJson(json);
}

@freezed
class QuizCoverImage with _$QuizCoverImage {
  const factory QuizCoverImage({
    String? extraLarge,
    String? large,
    String? medium,
    String? color,
  }) = _QuizCoverImage;

  factory QuizCoverImage.fromJson(Map<String, dynamic> json) =>
      _$QuizCoverImageFromJson(json);
}

@freezed
class QuizDate with _$QuizDate {
  const factory QuizDate({
    int? year,
    int? month,
    int? day,
  }) = _QuizDate;

  factory QuizDate.fromJson(Map<String, dynamic> json) =>
      _$QuizDateFromJson(json);
}

@freezed
class QuizEpisode with _$QuizEpisode {
  const factory QuizEpisode({
    int? airingAt,
    int? timeUntilAiring,
    int? episode,
  }) = _QuizEpisode;

  factory QuizEpisode.fromJson(Map<String, dynamic> json) =>
      _$QuizEpisodeFromJson(json);
}
