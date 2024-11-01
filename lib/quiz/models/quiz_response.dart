import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/common/models/user.dart';

part 'quiz_response.freezed.dart';
part 'quiz_response.g.dart';

@freezed
class QuizQuestionResponse with _$QuizQuestionResponse {
  const QuizQuestionResponse._(); // Ajout d'un constructeur privé pour les méthodes de classe

  const factory QuizQuestionResponse({
    @JsonKey(name: '_id') required String id,
    required String label,
    String? image,
    @JsonKey(name: 'quiz_id') required String quizId,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'updated_at') required int updatedAt,
    required List<QuizResponse> responses,
    @Default(0) @JsonKey(name: '__v') int version,
  }) = _QuizQuestionResponse;

  factory QuizQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionResponseFromJson(json);

  List<QuizResponse> get validResponses =>
      responses.whereType<QuizResponse>().toList();
}

@freezed
class QuizResponse with _$QuizResponse {
  const factory QuizResponse({
    required String label,
    @JsonKey(name: 'isCorrect') required bool isCorrect,
    @JsonKey(name: '_id') String? id,
  }) = _QuizResponse;

  factory QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseFromJson(json);
}
