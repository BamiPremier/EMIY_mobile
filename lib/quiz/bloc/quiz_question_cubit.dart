import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/quiz/models/question_quiz.dart' hide QuizResponse;
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/potatoes.dart';
part 'quiz_question_state.dart';

class QuizQuestionCubit extends Cubit<QuizQuestionState> {
  final QuizService quizService;
  QuizQuestionCubit(
    this.quizService,
  ) : super(const QuizQuestionIdleState());

  void getQuizQuestions({required Quiz quiz}) async {
    final stateBefore = state;

    try {
      emit(const QuizQuestionLoadingState());

      await quizService
          .getQuizQuestions(idQuiz: quiz.id)
          .then((response) async {
        emit(QuizListQuestionState(quiz: quiz, questions: response));
      });
    } catch (error, trace) {
      emit(QuizQuestionErrorState(error, trace));
      emit(stateBefore);
    }
  }
}
