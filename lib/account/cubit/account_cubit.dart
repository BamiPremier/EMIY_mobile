import 'dart:io';

import 'package:umai/account/services/account_service.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/models/user.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountService accountService;

  AccountCubit(this.accountService) : super(const AccountIdleState());

  User? get user => accountService.preferencesService.user;

  void updateUser({required user}) {
    final stateBefore = state;

    emit(const AccountLoadingState());
    accountService.updateUser(data: user).then((response) {
      emit(const AccountSuccessState());

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AccountErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void updateProfilePicture({required File file}) {
    final stateBefore = state;

    emit(const AccountUpdateProfilePictureLoadingState());
    accountService.updateProfilePicture(file: file).then((response) {
      emit(const AccountUpdateProfilePictureSuccessState());

      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AccountUpdateProfilePictureErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
