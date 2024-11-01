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
 

  void selectResponse(QuizResponse response) {
    if (state is! QuizListQuestionState) return;
    final currentState = state as QuizListQuestionState;
    final selectedResponses = currentState.selectedResponses ?? {};
    final currentResponse = selectedResponses[currentState.currentQuestion];

    final newResponse =
        currentResponse != null && currentResponse.label == response.label
            ? null
            : response;

    emit(QuizQuestionResponseValidateState(
      quiz: currentState.quiz,
      questions: currentState.questions,
      currentQuestion: currentState.currentQuestion,
      selectedResponses: {
        ...selectedResponses,
        if (newResponse != null) currentState.currentQuestion: newResponse
      },
    ));
  }

  Future<void> validate({QuizResponse? response}) async {
    if (state is! QuizListQuestionState) return;
    final currentState = state as QuizListQuestionState;
    if (response != null) {
      emit(QuizQuestionResponseValidateState(
        quiz: currentState.quiz,
        questions: currentState.questions,
        currentQuestion: currentState.currentQuestion,
        selectedResponses: {currentState.currentQuestion: response},
      ));
    } else {
      emit(QuizQuestionResponseValidateState(
        quiz: currentState.quiz,
        questions: currentState.questions,
        currentQuestion: currentState.currentQuestion,
      ));
    }
  }

  Future<void> nextQuestion() async {
    final currentState = state as QuizQuestionResponseValidateState;
    final nextQuestion = currentState.currentQuestion + 1;
    if (nextQuestion < currentState.questions.length) {
      
      emit(QuizListQuestionState(
        quiz: currentState.quiz,
        questions: currentState.questions,
        currentQuestion: nextQuestion,
      ));
    }
  }
}
