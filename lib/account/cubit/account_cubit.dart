import 'package:umai/account/services/account_service.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/models/user.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountService accountService;

  AccountCubit(this.accountService) : super(AccountIdleState());

  User? get user => accountService.preferencesService.user;

  void updateUser({required user}) {
    final stateBefore = state;

    emit(const AccountLoadingState());
    accountService.updateUser(data: user).then((response) {
      emit(AccountSuccessState());

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AccountErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
