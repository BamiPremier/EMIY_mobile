import 'package:potatoes/libs.dart';

import 'package:potatoes/potatoes.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/social_service.dart';
part 'post_manip_state.dart';

class PostManipCubit extends ObjectCubit<Post, PostManipState> {
  final SocialService socialService;

  PostManipCubit(this.socialService, Post post)
      : super(InitializingPostManipState(post));

  @override
  Post? getObject(PostManipState state) {
    if (state is InitializingPostManipState) {
      return state.post;
    }
    return null;
  }

  Post? get post {
    final post = getObject(state) ?? object;

    if (post != null) return post;
    throw UnsupportedError(
        'cannot retrieve post: Current state is ${state.runtimeType}');
  }

  @override
  void update(Post object) {
    emit(InitializingPostManipState(object));
  }

  void likePost() {
    final stateBefore = state;
    var newPost = post!.copyWith(hasLiked: !post!.hasLiked);
    update(newPost);
    // emit(const PostManipLoadingState());
    socialService
        .likePost(
      idPost: post!.id,
    )
        .then((updatepost) {
      // update(updatepost);
    }, onError: (error, trace) {
      emit(PostManipErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void unLikePost() {
    final stateBefore = state;
    var newPost = post!.copyWith(hasLiked: !post!.hasLiked);
    update(newPost);
    // emit(const PostManipLoadingState());
    socialService
        .unLikePost(
      idPost: post!.id,
    )
        .then((updatepost) {
      // update(updatepost);
    }, onError: (error, trace) {
      emit(PostManipErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void commentPost({required String content}) {
    final stateBefore = state;

    emit(const PostManipLoadingState());
    socialService.commentPost(idPost: post!.id, content: content).then(
        (updatepost) {
      emit(CommentPostSuccesState());
      // update(updatepost);
      
    }, onError: (error, trace) {
      emit(PostManipErrorState(error, trace));
      emit(stateBefore);
    });
  }
}
