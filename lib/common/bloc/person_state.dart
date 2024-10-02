part of 'person_cubit.dart';

mixin PersonState on Equatable {}

class InitializingPersonState extends CubitSuccessState with PersonState {
  final User user;

  const InitializingPersonState(this.user);

  @override
  List<Object?> get props => [user];
}

class PersonLoadingState extends CubitLoadingState with PersonState {
  const PersonLoadingState() : super();
}

class PersonErrorState extends CubitErrorState with PersonState {
  PersonErrorState(super.error, [super.trace]);
}
