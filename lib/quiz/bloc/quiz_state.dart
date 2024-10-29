part of 'quiz_cubit.dart';

mixin QuizState on Equatable {}

class QuizIdleState extends CubitSuccessState with QuizState {
  const QuizIdleState();
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class QuizLoadingState extends CubitLoadingState with QuizState {
  const QuizLoadingState();
}

class QuizCreatedState extends CubitInformationState with QuizState {
  final Quiz quiz;
  final List<QuestionQuiz> questions;

  const QuizCreatedState({required this.quiz, required this.questions});
  @override
  List<Object?> get props => [quiz, questions];
}

class QuizPublishedState extends CubitInformationState with QuizState {
  const QuizPublishedState();
}

class QuizErrorState extends CubitErrorState with QuizState {
  QuizErrorState(super.error, [super.trace]);
}
  
class QuizSelectAnimeState extends CubitInformationState with QuizState {
  final Anime anime;

  const QuizSelectAnimeState(this.anime);
  @override
  List<Object?> get props => [anime];
}
