part of 'person_cubit.dart';

mixin PersonState on Equatable {}

class InitializingPersonState extends CubitSuccessState with PersonState {
  final User user;

  const InitializingPersonState(this.user);

  @override
  List<Object?> get props => [user];
}

class PersonLoadingBlockState extends CubitLoadingState with PersonState {
  const PersonLoadingBlockState() : super();
}

class PersonLoadingState extends CubitLoadingState with PersonState {
  const PersonLoadingState() : super();
}

class SuccessBlockPersonState extends CubitSuccessState with PersonState {
  final User user;

  const SuccessBlockPersonState(this.user);

  @override
  List<Object?> get props => [user];
}

class PersonErrorState extends CubitErrorState with PersonState {
  PersonErrorState(super.error, [super.trace]);
}
