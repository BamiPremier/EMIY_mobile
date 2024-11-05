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
  late final StreamSubscription<ATimerState> timerSubscription;
  late int nombrePoints = 0;

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
        emit(QuizParticipationFinishedState(nombrePoints));
      } else {
        timerCubit.reset();
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
        nombrePoints = nombrePoints + 1;
      }
      emit(stateBefore.toSubmited());
      print("============close timer");
      timerCubit.close();

      print("============close timer 00");
    }
  }

  void sendParticipation({required Quiz quiz}) async {
    final stateBefore = state;

    try {
      final data = {
        "quiz_id": quiz.id,
      };
      final response = await quizService.newQuiz(data: data);

      // emit(QuizCreatedState(
      //     quiz: response,
      //     questions: [],
      //     anime: (stateBefore is QuizSelectAnimeState)
      //         ? stateBefore.anime
      //         : null));
    } catch (error, trace) {
      emit(QuizParticipationErrorState(error, trace));
      emit(stateBefore);
    }
  }
}
