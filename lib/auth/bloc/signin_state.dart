part of 'signin_cubit.dart';

mixin SignInState on Equatable {}

class SignInIdleState extends CubitSuccessState with SignInState {
  const SignInIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class SignInLoadingState extends CubitLoadingState with SignInState {
  const SignInLoadingState();
}

class SignInSuccessState extends CubitInformationState with SignInState {
  const SignInSuccessState();
}

class SignInMissingSupplierInformation extends CubitInformationState with SignInState {
  const SignInMissingSupplierInformation();
}

class SignInErrorState extends CubitErrorState with SignInState {
  SignInErrorState(super.error, [super.trace]);
}