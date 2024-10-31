import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/quiz/bloc/timer_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/potatoes.dart';
part 'quiz_participation_state.dart';

class QuizParticipationCubit
    extends ObjectCubit<QuizQuestionResponse, QuizParticipationState> {
  final QuizService quizService;
  final TimerCubit timerCubit;

  QuizParticipationCubit(
    this.quizService,
    QuizQuestionResponse quizQuestionResponse,
  )   : timerCubit = TimerCubit.duration(const Duration(seconds: 30)),
        super(InitializingQuizParticipationState(
          quizQuestionResponse: quizQuestionResponse,
          userResponse: null,
        ));

  void resetTimer() {
    timerCubit.reset();
  }

  @override
  Future<void> close() {
    timerCubit.close();
    return super.close();
  }

  @override
  QuizQuestionResponse? getObject(QuizParticipationState state) {
    if (state is InitializingQuizParticipationState) {
      return state.quizQuestionResponse;
    }
    return null;
  }

  QuizQuestionResponse get quizQuestionResponse {
    final quizQuestionResponse = getObject(state) ?? object;

    if (quizQuestionResponse != null) return quizQuestionResponse;
    throw UnsupportedError(
        'cannot retrieve quiz: Current state is ${state.runtimeType}');
  }

  @override
  void update(QuizQuestionResponse object) {
    timerCubit.reset();
    emit(InitializingQuizParticipationState(
      quizQuestionResponse: object,
      userResponse: (state as InitializingQuizParticipationState).userResponse,
    ));
  }

  void selectResponse(QuizResponse response) {
    final currentState = state as InitializingQuizParticipationState;
    final currentResponse = currentState.userResponse;

    final newResponse =
        currentResponse != null && currentResponse.label == response.label
            ? null
            : response;

    emit(InitializingQuizParticipationState(
      quizQuestionResponse: quizQuestionResponse,
      userResponse: newResponse,
    ));
  }
}
