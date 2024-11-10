import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/social_service.dart';

class PostCubit extends XCommonCubit<Post> {
  final SocialService socialService;

  PostCubit(this.socialService, Post post) : super(socialService, post);
  void report({required String reason}) {
    if (state is InitializingXCommonState) {
      final stateBefore = state;
      emit(const SendReportLoadingState());
      socialService
          .reportItem(
        idItem: x.itemId,
        reason: reason,
      )
          .then((_) {
        emit(SuccessSendReportItemState(x));
      }, onError: (error, trace) {
        emit(XErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void delete() {
    if (state is InitializingXCommonState) {
      final stateBefore = state;

      socialService
          .deleteItem(
        idItem: x.itemId,
      )
          .then((updatePost) {}, onError: (error, trace) {
        emit(XErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }
}
