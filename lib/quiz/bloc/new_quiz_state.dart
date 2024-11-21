part of 'new_quiz_cubit.dart';

mixin NewQuizState on Equatable {}

class QuizIdleState extends CubitSuccessState with NewQuizState {
  const QuizIdleState();

  @override
  List<Object?> get props => [];
}

class QuizLoadingState extends CubitLoadingState with NewQuizState {
  const QuizLoadingState();
}

class QuizLoadingPublishState extends CubitLoadingState with NewQuizState {
  const QuizLoadingPublishState();
}

class QuizCreatedState extends CubitSuccessState with NewQuizState {
  final Anime? anime;
  final Quiz quiz;
  final List<QuestionQuiz> questions;

  const QuizCreatedState(
      {this.anime, required this.quiz, required this.questions});
  @override
  List<Object?> get props => [anime, quiz, questions];
}

class QuizPublishedState extends CubitInformationState with NewQuizState {
  const QuizPublishedState();
}

class QuizErrorState extends CubitErrorState with NewQuizState {
  QuizErrorState(super.error, [super.trace]);
}

class QuizSelectAnimeState extends CubitSuccessState with NewQuizState {
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

class QuizUpdateState extends CubitSuccessState with NewQuizState {
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
