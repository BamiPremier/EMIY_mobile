part of 'quiz_manage_cubit.dart';

mixin QuizManageState on Equatable {}

class InitializingQuizManageState extends CubitSuccessState
    with QuizManageState {
  final Quiz quiz;

  const InitializingQuizManageState(this.quiz);

  @override
  List<Object?> get props => [quiz];
}

class QuizManageIdleState extends CubitSuccessState with QuizManageState {
  const QuizManageIdleState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class QuizManageLoadingState extends CubitLoadingState with QuizManageState {
  const QuizManageLoadingState();
}

class ShareQuizLoadingState extends CubitLoadingState with QuizManageState {
  const ShareQuizLoadingState();
}

class ShareQuizSuccesState extends CubitInformationState with QuizManageState {
  final String link;

  const ShareQuizSuccesState(this.link);

  @override
  List<Object?> get props => [link];
}

class QuizManagePublishedState extends CubitInformationState
    with QuizManageState {
  const QuizManagePublishedState();
}

class QuizManageErrorState extends CubitErrorState with QuizManageState {
  QuizManageErrorState(super.error, [super.trace]);
}
