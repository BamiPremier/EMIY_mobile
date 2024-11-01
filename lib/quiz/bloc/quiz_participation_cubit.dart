import 'dart:async';

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

class QuizParticipationCubit extends Cubit<QuizParticipationState> {
  static const timerDuration = Duration(seconds: 30);
  final QuizService quizService;
  final TimerCubit timerCubit;
  late final StreamSubscription<ATimerState> timerSubscription;

  QuizParticipationCubit(
    this.quizService,
    List<QuizQuestionResponse> questions,
  )   : timerCubit = TimerCubit.duration(timerDuration),
        super(QuizParticipationIdleState.initQuestions(
          questions: questions,
        )) {
    timerSubscription = timerCubit.stream.listen((event) {
      if (event is TimerFinished) {
        submit();
      }
    });
  }

  void dispose() {
    timerSubscription.cancel();
    timerCubit.close();
  }

  void selectAnswer(QuizResponse questionResponse) {
    if (state is QuizParticipationIdleState) {
      emit(QuizParticipationIdleState.copyWith(
        userResponse: questionResponse,
        questions: (state as QuizParticipationIdleState).questions,
        currentQuestion: (state as QuizParticipationIdleState).currentQuestion,
      ));
    }
  }

  void nextQuestion() {
    if (state is QuizParticipationIdleState) {
      final stateBefore = state as QuizParticipationSubmittedState;
      final currentIndex =
          stateBefore.questions.indexOf(stateBefore.currentQuestion);

      if (currentIndex == stateBefore.questions.length - 1) {
        emit(const QuizParticipationFinishedState());
      } else {
        emit(QuizParticipationIdleState.copyWith(
          questions: stateBefore.questions,
          currentQuestion: stateBefore.questions[currentIndex + 1],
        ));
        timerCubit.reset();
      }
      final currentIndex0 = stateBefore.questions
          .indexOf((state as QuizParticipationIdleState).currentQuestion);
    }
  }

  void submit() {
    if (state is QuizParticipationIdleState) {
      emit((state as QuizParticipationIdleState).toSubmited());
    }
  }
}
