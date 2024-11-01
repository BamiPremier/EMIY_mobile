part of 'quiz_participation_cubit.dart';

mixin QuizParticipationState on Equatable {}

class QuizParticipationIdleState extends CubitSuccessState
    with QuizParticipationState {
  final List<QuizQuestionResponse> questions;
  final QuizQuestionResponse currentQuestion;
  final QuizResponse? userResponse;

  QuizParticipationIdleState._({
    required this.questions,
    this.userResponse,
    required this.currentQuestion,
  }) : assert(questions.isNotEmpty);

  factory QuizParticipationIdleState.copyWith({
    List<QuizQuestionResponse>? questions,
    QuizResponse? userResponse,
    QuizQuestionResponse? currentQuestion,
  }) {
    return QuizParticipationIdleState._(
      questions: questions ?? [],
      userResponse: userResponse,
      currentQuestion: currentQuestion ?? questions!.first,
    );
  }

  QuizParticipationIdleState.initQuestions({required this.questions})
      : assert(questions.isNotEmpty),
        currentQuestion = questions.first,
        userResponse = null;

  QuizParticipationSubmittedState toSubmited() {
    return QuizParticipationSubmittedState(
      questions: questions,
      userResponse: userResponse,
      currentQuestion: currentQuestion,
    );
  }

  @override
  List<Object?> get props => [questions, currentQuestion, userResponse];
}

class QuizParticipationSubmittedState extends QuizParticipationIdleState {
  QuizParticipationSubmittedState({
    required super.questions,
    required super.currentQuestion,
    super.userResponse,
  }) : super._();
}

class QuizParticipationLoadingState extends CubitLoadingState
    with QuizParticipationState {
  @override
  List<Object?> get props => [];
}

class QuizParticipationFinishedState extends CubitSuccessState
    with QuizParticipationState {
  final int nombrePoints;
  const QuizParticipationFinishedState(this.nombrePoints);
  @override
  List<Object?> get props => [identityHashCode(this), nombrePoints];
}

class QuizParticipationErrorState extends CubitErrorState
    with QuizParticipationState {
  QuizParticipationErrorState(super.error, super.trace);
}
