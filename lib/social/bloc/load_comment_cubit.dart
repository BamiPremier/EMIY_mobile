import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/social/model/comment.dart';

import 'package:umai/social/services/social_service.dart';

class LoadCommentCubit extends AutoListCubit<Comment> {
  final SocialService socialService;
  final PersonCubitManager personCubitManager;

  LoadCommentCubit(
      this.socialService, String idPost, String target, this.personCubitManager)
      : super(provider: ({int page = 1}) async {
          final p = await socialService.getComments(
              idPost: idPost, target: target, page: page);
          return p;
        });

  @override
  void onChange(Change<AutoListState<Comment>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Comment>) {
      (change.nextState as AutoListReadyState<Comment>)
          .items
          .items
          .forEach((comment) {
        personCubitManager.add(comment.user);
      });
    }
  }

  void putFirst(Comment comment) {
    if (state is LoadCommentReadyState) {
      final list = (state as LoadCommentReadyState).items;

      emit(LoadCommentReadyState(list.prepend(others: [comment])));
    }
  }

  void deleteComment(Comment comment) {
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
