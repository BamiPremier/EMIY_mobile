part of 'quiz_question_cubit.dart';

abstract class QuizQuestionState extends Equatable {
  const QuizQuestionState();
}

class QuizQuestionIdleState extends CubitSuccessState
    implements QuizQuestionState {
  const QuizQuestionIdleState();

  @override
  List<Object?> get props => [];
}

class QuizQuestionLoadingState extends CubitLoadingState
    implements QuizQuestionState {
  const QuizQuestionLoadingState();

  @override
  List<Object?> get props => [];
}

class QuizListQuestionState extends CubitInformationState
    implements QuizQuestionState {
  final Quiz quiz;
  final List<QuizQuestionResponse> questions;
  final int currentQuestion;
  final Map<int, QuizResponse>? selectedResponses;

  const QuizListQuestionState({
    required this.quiz,
    required this.questions,
    this.currentQuestion = 0,
    this.selectedResponses,
  });

  @override
  List<Object?> get props => [quiz, questions, currentQuestion, selectedResponses];
}

class QuizQuestionResponseValidateState extends CubitInformationState
    implements QuizQuestionState {
  final Quiz quiz;
  final List<QuizQuestionResponse> questions;
  final int currentQuestion;
  final Map<int, QuizResponse>? selectedResponses;

  const QuizQuestionResponseValidateState({
    required this.quiz,
    required this.questions,
    required this.currentQuestion,
    this.selectedResponses,
  });

  QuizResponse? getSelectedResponse(int questionIndex) {
    return selectedResponses?.containsKey(questionIndex) == true
        ? selectedResponses![questionIndex]
        : null;
  }

  QuizQuestionResponseValidateState copyWith({
    Quiz? quiz,
    List<QuizQuestionResponse>? questions,
    int? currentQuestion,
    Map<int, QuizResponse>? selectedResponses,
  }) {
    return QuizQuestionResponseValidateState(
      quiz: quiz ?? this.quiz,
      questions: questions ?? this.questions,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      selectedResponses: selectedResponses ?? this.selectedResponses,
    );
  }

  @override
  List<Object?> get props =>
      [quiz, questions, currentQuestion, selectedResponses];
}

class QuizQuestionErrorState extends CubitErrorState
    implements QuizQuestionState {
  QuizQuestionErrorState(super.error, [super.trace]);

  @override
  List<Object?> get props => [error, trace];
}
