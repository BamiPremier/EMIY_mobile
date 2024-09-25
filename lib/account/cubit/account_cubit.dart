import 'dart:developer';
import 'dart:io';

import 'package:umai/account/services/account_service.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/common/services/preferences_service.dart';
import 'package:umai/common/models/user.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountService accountService;
  final PreferencesService preferencesService;

  AccountCubit(
    this.accountService,
    this.preferencesService,
  ) : super(const AccountIdleState());

  User? get user => accountService.preferencesService.user;

  void updateUser({required user}) {
    final stateBefore = state;

    emit(const AccountLoadingState());
    accountService.updateUser(data: user).then((response) {
      emit(const AccountSuccessState());
      var user = User.fromJson(response);
      log('meee $response');
      preferencesService.saveUser(user);
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
      var user = User.fromJson(response);
      log('meeesss $response');
      preferencesService.saveUser(user);
      log('meeesss image_full ${user.imageFull}');
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AccountUpdateProfilePictureErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
