part of 'account_cubit.dart';

mixin AccountState on Equatable {}

class AccountIdleState extends CubitSuccessState with AccountState {
  const AccountIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AccountLoadingState extends CubitLoadingState with AccountState {
  const AccountLoadingState();
}

class AccountSuccessState extends CubitInformationState with AccountState {
  const AccountSuccessState();
}

class AccountErrorState extends CubitErrorState with AccountState {
  AccountErrorState(super.error, [super.trace]);
}
