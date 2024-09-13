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

class SignInSuccessActiveUserState extends CubitInformationState
    with SignInState {
  const SignInSuccessActiveUserState();
}

class SignInSuccessInActiveUserState extends CubitInformationState
    with SignInState {
  const SignInSuccessInActiveUserState();
}

class CompleteUserSuccessUserState extends CubitInformationState
    with SignInState {
  const CompleteUserSuccessUserState();
}

class SignInMissingSupplierInformation extends CubitInformationState
    with SignInState {
  const SignInMissingSupplierInformation();
}

class SignInErrorState extends CubitErrorState with SignInState {
  SignInErrorState(super.error, [super.trace]);
}
