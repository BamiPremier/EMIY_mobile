part of 'signup_cubit.dart';

mixin SignUpState on Equatable {}

class SignUpIdleState extends CubitSuccessState with SignUpState {
  const SignUpIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class SignUpLoadingState extends CubitLoadingState with SignUpState {
  const SignUpLoadingState();
}

class SignUpRegisterSuccess extends CubitSuccessState with SignUpState {
  final User user;
  final String jwt;

  const SignUpRegisterSuccess(this.user, this.jwt);

  @override
  List<Object?> get props => [user, jwt];
}

class SignUpSuccess extends CubitInformationState with SignUpState {
  const SignUpSuccess();
}

class SupplierSignUpSuccess extends CubitInformationState with SignUpState {
  const SupplierSignUpSuccess();
}

class SignUpErrorState extends CubitErrorState with SignUpState {
  SignUpErrorState(super.error, [super.trace]);
}