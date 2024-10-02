import 'package:potatoes/libs.dart';

import 'package:potatoes/potatoes.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/social_service.dart';
part 'post_state.dart';

class PostCubit extends ObjectCubit<Post, PostState> {
  final SocialService socialService;

  PostCubit(this.socialService, Post post) : super(InitializingPostState(post));

  @override
  Post? getObject(PostState state) {
    if (state is InitializingPostState) {
      return state.post;
    }
    return null;
  }

  Post get post {
    final post = getObject(state) ?? object;

    if (post != null) return post;
    throw UnsupportedError(
        'cannot retrieve post: Current state is ${state.runtimeType}');
  }

  @override
  void update(Post object) {
    emit(InitializingPostState(object));
  }

  void likePost() {
    if (state is InitializingPostState) {
      final stateBefore = state;
      var newPost = post.copyWith(hasLiked: !post.hasLiked);
      update(newPost);
      socialService
          .likePost(
        idPost: post.id,
      )
          .then((updatepost) {}, onError: (error, trace) {
        emit(PostErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void unLikePost() {
    if (state is InitializingPostState) {
      final stateBefore = state;
      var newPost = post.copyWith(hasLiked: !post.hasLiked);
      update(newPost);
      socialService
          .unLikePost(
        idPost: post.id,
      )
          .then((updatepost) {}, onError: (error, trace) {
        emit(PostErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void sharePost() {
    if (state is InitializingPostState) {
      final stateBefore = state;

      emit(const PostLoadingState());
      socialService
          .sharePost(
        idPost: post.id,
      )
          .then((reponse) {
        emit(SharePostPostSuccesState(reponse['shareLink']));
        emit(stateBefore);
      }, onError: (error, trace) {
        emit(PostErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void signalerPost() {
    if (state is InitializingPostState) {
      final stateBefore = state;

      socialService
          .signalerPost(
        idPost: post.id,
        reason: 'reason',
      )
          .then((updatePost) {}, onError: (error, trace) {
        emit(PostErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void deletePost() {
    if (state is InitializingPostState) {
      final stateBefore = state;

      socialService
          .deletePost(
        idPost: post.id,
      )
          .then((updatePost) {}, onError: (error, trace) {
        emit(PostErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void commentPost({required String content, String? targetCommentId}) {
    if (state is InitializingPostState) {
      final stateBefore = state;

      emit(const PostLoadingState());
      socialService
          .commentPost(
              idPost: post.id, content: content, target: targetCommentId)
          .then((comment) {
        emit(CommentPostSuccesState(comment));
        emit(stateBefore);
      }, onError: (error, trace) {
        emit(PostErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }
}
