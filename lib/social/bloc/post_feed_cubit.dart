import 'dart:developer';

import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/services/social_service.dart';

class PostFeedCubit extends AutoListCubit<Post> {
  final SocialService socialService; 
  final PostCubitManager cubitManager;

  PostFeedCubit(
    this.socialService,
    this.cubitManager, 
  ) : super(provider: socialService.getFeed);

  @override
  void onChange(Change<AutoListState<Post>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Post>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Post>).items.items);
       
    }
  }

  void deletePost(Post post) {
    if (state is AutoListReadyState<Post>) {
      final list = (state as AutoListReadyState<Post>).items;
      emit(AutoListReadyState(list.remove(post, update: true)));
    }
  }

  void deleteUserPost(User user) {
      if (state is AutoListReadyState<Post>) {
      final list = (state as AutoListReadyState<Post>).items;
      var l = List.from(list.items)..removeWhere((p) => p.user.id == user.id);
    
      emit(AutoListReadyState(PaginatedList(
        items: List.from(list.items)..removeWhere((p) => p.user.id == user.id),
        total: list.total - 1,
        page: list.page,
      )));
    }
  }
}
