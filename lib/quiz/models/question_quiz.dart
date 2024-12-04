import 'dart:convert';

import 'package:potatoes/libs.dart';

class QuestionQuiz extends Equatable {
  final String? id;
  final String label;
  final String? image;
  final List<QuizResponse> responses;
  final int correctAnswerIndex;
  const QuestionQuiz({
    required this.label,
    this.image,
    this.id,
    required this.responses,
    required this.correctAnswerIndex,
  });

  Map<String, dynamic> toFormData() {
    return {
      'label': label,
      'responses': jsonEncode(responses.map((e) => e.toJson()).toList()),
    };
  }
  // Méthode pour désérialiser depuis JSON
  factory QuestionQuiz.fromJson(Map<String, dynamic> json) {
    return QuestionQuiz(
      id: json['id'],
      label: json['label'],
      image: json['image'],
      responses: (json['responses'] as List)
          .map((e) => QuizResponse.fromJson(e))
          .toList(),
      correctAnswerIndex: json['correctAnswerIndex'],
    );
  }

  @override
  List<Object?> get props => [label, image, responses, correctAnswerIndex];
}

class QuizResponse {
  final String label;
  final bool isCorrect;

  const QuizResponse({
    required this.label,
    required this.isCorrect,
  });
// Méthode pour désérialiser depuis JSON
  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      label: json['label'],
      isCorrect: json['isCorrect'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'isCorrect': isCorrect,
    };
  }
}
