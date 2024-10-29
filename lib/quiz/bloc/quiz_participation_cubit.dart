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

  QuizParticipationCubit(this.quizService, Quiz quiz)
      : super(InitializingQuizParticipationState(quiz));
 
  @override
  Quiz? getObject(QuizParticipationState state) {
    if (state is InitializingQuizParticipationState) {
      return state.quiz;
    }
    return null;
  }

  Quiz get quiz {
    final quiz = getObject(state) ?? object;

    if (quiz != null) return quiz;
    throw UnsupportedError(
        'cannot retrieve quiz: Current state is ${state.runtimeType}');
  }

  @override
  void update(Quiz object) {
    emit(InitializingQuizParticipationState(object));
  }
}
