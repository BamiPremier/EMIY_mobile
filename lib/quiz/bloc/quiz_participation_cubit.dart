import 'dart:async';
import 'package:potatoes/libs.dart';
import 'package:umai/quiz/bloc/timer_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/models/quiz_response.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'package:potatoes/potatoes.dart';
part 'quiz_participation_state.dart';

class QuizParticipationCubit extends Cubit<QuizParticipationState> {
  static const timerDuration = Duration(seconds: 30);
  final QuizService quizService;
  late TimerCubit timerCubit;
  late StreamSubscription<ATimerState> timerSubscription;
  late int score = 0;

  QuizParticipationCubit(
    this.quizService,
    List<QuizQuestionResponse> questions,
  )   : timerCubit = TimerCubit.duration(timerDuration),
        super(QuizParticipationIdleState.initQuestions(
          questions: questions,
        )) {
    _startTimer();
  }

  void _startTimer() {
    if (!isClosed) {
      timerSubscription = timerCubit.stream.listen((event) {
        if (event is TimerFinished) {
          submit();
        }
      });
    }
  }

  void dispose() {
    timerCubit.close();
    timerSubscription.cancel();
    super.close();
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
        sendParticipation();
      } else {
        timerCubit.close();
        timerSubscription.cancel();
        timerCubit = TimerCubit.duration(timerDuration);
        _startTimer();
        emit(QuizParticipationIdleState.copyWith(
          questions: stateBefore.questions,
          currentQuestion: stateBefore.questions[currentIndex + 1],
        ));
      }
    }
  }

  void submit() {
    if (state is QuizParticipationIdleState) {
      final stateBefore = state as QuizParticipationIdleState;
      if (stateBefore.userResponse?.isCorrect ?? false) {
        score = score + 1;
      }
      emit(stateBefore.toSubmited());
     
      timerCubit.close();

  
    }
  }

  void sendParticipation() async {
    final stateBefore = state;
    emit(QuizParticipationLoadingState());

    await quizService
        .participationQuiz(
            score: score,
            idQuiz: (stateBefore as QuizParticipationIdleState)
                .questions
                .first
                .quizId)
        .then((quiz) {
      emit(QuizParticipationFinishedState(nombrePoints: score, quiz: quiz));
    }, onError: (error, trace) {
      emit(QuizParticipationErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
