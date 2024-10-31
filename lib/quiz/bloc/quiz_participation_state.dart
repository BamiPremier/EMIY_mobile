part of 'quiz_participation_cubit.dart';

mixin QuizParticipationState on Equatable {}

class InitializingQuizParticipationState extends CubitSuccessState
    with QuizParticipationState {
  final QuizQuestionResponse quizQuestionResponse;
  final QuizResponse? userResponse;

  final int currentQuestion;
  const InitializingQuizParticipationState(
      {required this.quizQuestionResponse,
      required this.userResponse,
      this.currentQuestion = 0});

  @override
  List<Object?> get props =>
      [quizQuestionResponse, userResponse, currentQuestion];
}

class ResponseQuizParticipationState extends CubitSuccessState
    with QuizParticipationState {
  final QuizQuestionResponse quizQuestionResponse;
  final QuizResponse? userResponse;

  final int currentQuestion;
  const ResponseQuizParticipationState(
      {required this.quizQuestionResponse,
      required this.userResponse,
      this.currentQuestion = 0});

  @override
  List<Object?> get props =>
      [quizQuestionResponse, userResponse, currentQuestion];
}

class QuizParticipationIdleState extends CubitSuccessState
    with QuizParticipationState {
  const QuizParticipationIdleState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class QuizParticipationLoadingState extends CubitLoadingState
    with QuizParticipationState {
  const QuizParticipationLoadingState();
}

class QuizParticipationPublishedState extends CubitInformationState
    with QuizParticipationState {
  const QuizParticipationPublishedState();
}

class QuizParticipationErrorState extends CubitErrorState
    with QuizParticipationState {
  QuizParticipationErrorState(super.error, [super.trace]);
}
