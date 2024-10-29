import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/quiz/models/question_quiz.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/potatoes.dart';
part 'quiz_participation_state.dart';

class QuizParticipationCubit extends ObjectCubit<Quiz, QuizParticipationState> {
  final QuizService quizService;
  final Quiz quiz;

  QuizParticipationCubit(this.quizService, this.quiz)
      : super(const QuizParticipationIdleState());

  void createQuizParticipation(
      {required String title, required String description}) async {}

  @override
  Quiz? getObject(QuizParticipationState state) {
    // TODO: implement getObject
    throw UnimplementedError();
  }

  @override
  void update(Quiz object) {
    // TODO: implement update
  }
}
