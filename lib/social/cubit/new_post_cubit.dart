import 'dart:async';
import 'dart:io';

import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/social_service.dart';

part 'new_post_state.dart';

class NewPostCubit extends Cubit<NewPostState> {
  final SocialService socialService;

  NewPostCubit(this.socialService) : super(const NewPostIdleState());

  void create({
    String? content,
    File? file,
  }) {
    assert(!(content == null && file == null));

    final stateBefore = state;
    emit(const NewPostUploadingState());
    socialService
        .create(
      content: content,
      file: file,
    )
        .then((post) {
      emit(NewPostUploadedState(post));

      Timer(const Duration(seconds: 5), () {
        emit(const NewPostIdleState());
      });
    }, onError: (error, trace) {
      emit(NewPostErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
