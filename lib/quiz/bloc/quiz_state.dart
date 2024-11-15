part of 'quiz_cubit.dart';

mixin QuizState on Equatable {}

class QuizIdleState extends CubitSuccessState with QuizState {
  const QuizIdleState();

  @override
  List<Object?> get props => [];
}

class QuizLoadingState extends CubitLoadingState with QuizState {
  const QuizLoadingState();
}

class QuizLoadingPublishState extends CubitLoadingState with QuizState {
  const QuizLoadingPublishState();
}

class QuizCreatedState extends CubitSuccessState with QuizState {
  final Anime? anime;
  final Quiz quiz;
  final List<QuestionQuiz> questions;

  const QuizCreatedState(
      {this.anime, required this.quiz, required this.questions});
  @override
  List<Object?> get props => [anime, quiz, questions];
}

class QuizPublishedState extends CubitInformationState with QuizState {
  const QuizPublishedState();
}

class QuizErrorState extends CubitErrorState with QuizState {
  QuizErrorState(super.error, [super.trace]);
}

class QuizSelectAnimeState extends CubitSuccessState with QuizState {
  final Anime anime;
  final List<QuestionQuiz>? questions;
  final Quiz? quiz;

  const QuizSelectAnimeState({
    required this.anime,
    this.quiz,
    required this.questions,
  });

  @override
  List<Object?> get props => [anime, quiz, questions];
}

class QuizUpdateState extends CubitSuccessState with QuizState {
  final Anime? anime;
  final List<QuestionQuiz>? questions;
  final Quiz? quiz;

  const QuizUpdateState({
    required this.anime,
    this.quiz,
    required this.questions,
  });

  @override
  List<Object?> get props => [anime, quiz, questions];
}
