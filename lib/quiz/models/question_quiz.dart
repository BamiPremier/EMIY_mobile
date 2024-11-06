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

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'isCorrect': isCorrect,
    };
  }
}
