part of 'quiz_participation_cubit.dart';

mixin QuizParticipationState on Equatable {}

class InitializingQuizParticipationState extends CubitSuccessState
    with QuizParticipationState {
  final Quiz quiz;

  const InitializingQuizParticipationState(this.quiz);

  @override
  List<Object?> get props => [quiz];
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
