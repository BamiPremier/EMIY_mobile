import 'package:umai/account/services/account_service.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/models/user.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountService accountService;

  AccountCubit(this.accountService) : super(AccountIdleState());

  User? get user => accountService.preferencesService.user;
}
