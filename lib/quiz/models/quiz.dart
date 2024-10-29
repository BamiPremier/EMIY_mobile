import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/common/models/user.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required String id,
    required String title,
    required String description,
    required Anime? anime,
    required User user,
    required bool reported,
    @JsonKey(name: 'created_at') required int createdAt,
    required String status,
    QuizParticipation? participation,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}
 
@freezed
class QuizParticipation with _$QuizParticipation {
  const factory QuizParticipation({
    required String id,
    required int score,
    @Default(0) int rank,
    required User user,
  }) = _QuizParticipation;

  factory QuizParticipation.fromJson(Map<String, dynamic> json) =>
      _$QuizParticipationFromJson(json);
}
 