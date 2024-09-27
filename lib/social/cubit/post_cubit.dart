import 'dart:developer';

import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:umai/auth/services/auth_service.dart';

import 'package:umai/social/model/post_response.dart';
import 'package:umai/social/services/social_service.dart';

class PostCubit extends AutoListCubit<Post> {
  final SocialService service;
  PostCubit(this.service)
      : super(
          provider: ({int page = 1}) =>
              service.getFeeds(page: page).then((p) => PaginatedList<Post>(
                    items: p.content,
                    page: p.page,
                    total: p.total,
                  )),
        );

  @override
  DataProvider<Post> get provider {
    return ({int page = 1}) => service.getFeeds(page: page).then((p) {
          return PaginatedList<Post>(
            items: p.content,
            page: p.page,
            total: p.total,
          );
        });
  }

  void addToFeed(Post post) {
    if (state is PostReadyState) {
      var stateBefore = state as PostReadyState;
      var updatedPosts = [post, ...stateBefore.items.items];

      log("Nouveau post ajouté : ${post.toString()}");
      log("Liste mise à jour : ${updatedPosts.toString()}");

      emit(PostListState(PaginatedList<Post>(
          items: updatedPosts,
          page: stateBefore.items.page,
          total: stateBefore.items.total + 1)));
    }
  }
}

typedef PostState = AutoListState<Post>;
typedef PostReadyState = AutoListReadyState<Post>;

class PostListState extends PostReadyState {
  const PostListState(super.items);
  @override
  List<Object?> get props => [...super.props];
}
