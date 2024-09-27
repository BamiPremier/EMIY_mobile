import 'dart:developer';
import 'dart:io';

import 'package:umai/account/services/account_service.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/common/services/preferences_service.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/social/model/post_response.dart';
import 'package:umai/social/services/social_service.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  final SocialService socialService;

  SocialCubit(
    this.socialService,
  ) : super(const SocialIdleState());

  void newPost({
    required String content,
    required File file,
  }) {
    final stateBefore = state;

    emit(const NewPostLoadingState());
    socialService
        .newPost(
      content: content,
      file: file,
    )
        .then((response) {
      log('=================success===============');

      emit(NewPostSuccessState(response));
      Future.delayed(const Duration(seconds: 15), () {
        log('=================reinitialisation===============');
        emit(stateBefore);
      });
    }, onError: (error, trace) {
      emit(NewPostErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
