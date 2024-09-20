part of 'auth_cubit.dart';

mixin AuthState on Equatable {}

class AuthIdleState extends CubitSuccessState with AuthState {
  AuthIdleState()
      : userNameController = TextEditingController(),
        userTagController = TextEditingController();

  final TextEditingController userNameController;
  final TextEditingController userTagController;
  @override
  List<Object?> get props =>
      [userNameController, userTagController, identityHashCode(this)];
}

class AuthLoadingState extends CubitLoadingState with AuthState {
  const AuthLoadingState();
}

class AuthSuccessActiveUserState extends CubitInformationState with AuthState {
  const AuthSuccessActiveUserState();
}

class AuthSuccessInActiveUserState extends CubitInformationState
    with AuthState {
  const AuthSuccessInActiveUserState();
}

class CompleteUserSuccessUserState extends CubitInformationState
    with AuthState {
  const CompleteUserSuccessUserState();
}

class AuthMissingSupplierInformation extends CubitInformationState
    with AuthState {
  const AuthMissingSupplierInformation();
}

class AuthErrorState extends CubitErrorState with AuthState {
  AuthErrorState(super.error, [super.trace]);
}
