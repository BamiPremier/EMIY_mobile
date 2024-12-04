import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';

class PostCubit extends XCommonCubit<Post> {
  final SocialService socialService;

  PostCubit(this.socialService, Post post) : super(socialService, post);

  @override
  Future<void> close() { 
    return super.close();
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
