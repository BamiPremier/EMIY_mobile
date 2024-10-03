import 'dart:developer';

import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:umai/social/model/comment.dart';

import 'package:umai/social/services/social_service.dart';

class LoadCommentCubit extends AutoListCubit<Comment> {
  final SocialService socialService;

  LoadCommentCubit(
    this.socialService,
    String idPost,
    String target,
  ) : super(provider: ({int page = 1}) async {
          print(
            socialService,
          );
          print(
            target,
          );
          print(
            idPost,
          );
          final p = await socialService.getComments(
              idPost: idPost, target: target, page: page);
          return p;
        });

  void putFirst(Comment comment) {
    if (state is LoadCommentListState) {
      final list = (state as LoadCommentListState).items;

      emit(LoadCommentListState(list.prepend(others: [comment])));
    }
  }

  void deleteComment(Comment comment) {
    print(state);
    if (state is LoadCommentReadyState) {
      final list = (state as LoadCommentReadyState).items;

      socialService.deleteComment(commentId: comment.id).then((_) {
        emit(LoadCommentReadyState(PaginatedList(
          items: List.from(list.items)..removeWhere((c) => c.id == comment.id),
          total: list.total - 1,
          page: list.page,
        )));
      }, onError: (error) {
        // emit(LoadCommentErrorState(error));
      });
    }
  }
}

typedef LoadCommentState = AutoListState<Comment>;
typedef LoadCommentReadyState = AutoListReadyState<Comment>;

class LoadCommentListState extends LoadCommentReadyState {
  const LoadCommentListState(
    super.items,
  );
  @override
  List<Object?> get props => [...super.props];
}
