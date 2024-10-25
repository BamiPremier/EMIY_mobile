import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required int id,
    required QuizTitle title,
    required String description,
    required QuizCoverImage coverImage,
    required String? bannerImage,
    @JsonKey(name: 'is_viewed') @Default(false) bool isViewed,
    @JsonKey(name: 'is_in_watchlist') @Default(false) bool isInWatchlist,
    @JsonKey(name: 'anime_view_count') @Default(0) int animeViewCount,
    int? averageScore,
    int? chapters,
    int? duration,
    QuizDate? endDate,
    int? episodes,
    String? format,
    List<String>? genres,
    @Default(false) bool isAdult,
    QuizEpisode? nextAiringEpisode,
    int? popularity,
    String? season,
    int? seasonYear,
    QuizDate? startDate,
    int? volumes,
    @JsonKey(name: 'watchlist_count') @Default(0) int watchlistCount,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class QuizTitle with _$QuizTitle {
  const factory QuizTitle({
    required String romaji,
    String? english,
    String? native,
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
