part of 'account_cubit.dart';
 
mixin AccountState on Equatable {}

class AccountIdleState extends CubitSuccessState with AccountState {
  const AccountIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}
