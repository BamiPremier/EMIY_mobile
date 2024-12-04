import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/bloc/report_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/screens/common_details.dart';

part 'common_state.dart';

mixin XService<T> implements ReportService<T> {
  Future<T> likeItem({required String idItem});
  Future<T> unLikeItem({required String idItem});
  Future shareItem({required String idItem});
  Future<Comment> commentItem({
    required String idItem,
    required String content,
    String? target,
  });

  Future<PaginatedList<Comment>> getComments({
    required String idItem,
    int page = 1,
    String? target,
  });
  Future<PaginatedList<Comment>> getCommentsResponse({
    required String commentId,
    int page = 1,
  });
  Future<Comment> commentComment({
    required String commentId,
  });
  Future<Comment> likeComment({
    required String commentId,
  });
  Future deleteComment({
    required String commentId,
  });
  Future unLikeComment({
    required String commentId,
  });
}

class XCommonCubit<T> extends ObjectCubit<XItem, XCommonState> {
  final XService<T> service;

  XCommonCubit(this.service, XItem item)
      : super(InitializingXCommonState(item));

  @override
  XItem? getObject(XCommonState state) {
    if (state is InitializingXCommonState) {
      return state.item;
    }
    return null;
  }

  XItem get x {
    final item = getObject(state) ?? object;

    if (item != null) return item;
    throw UnsupportedError(
        'cannot retrieve item: Current state is ${state.runtimeType}');
  }

  @override
  void update(XItem object) {
    emit(InitializingXCommonState(object));
  }

  void reset() {
    update(x);
  }

  void likeItem() {
    if (state is InitializingXCommonState) {
      final stateBefore = state;
      var newItem = x.copyWithLike(
        hasLiked: !x.itemHasLiked,
        likesCount: x.itemLikesCount + 1,
      );
      update(newItem);
      service
          .likeItem(
        idItem: x.itemId,
      )
          .then((updateItem) {}, onError: (error, trace) {
        emit(XErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void unLikeItem() {
    if (state is InitializingXCommonState) {
      final stateBefore = state;
      var newItem = x.copyWithLike(
        hasLiked: !x.itemHasLiked,
        likesCount: x.itemLikesCount - 1 > 0 ? x.itemLikesCount - 1 : 0,
      );
      update(newItem);
      service
          .unLikeItem(
        idItem: x.itemId,
      )
          .then((updateItem) {}, onError: (error, trace) {
        emit(XErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void shareItem() {
    if (state is InitializingXCommonState) {
      final stateBefore = state;

      emit(const ShareItemLoadingState());
      service
          .shareItem(
        idItem: x.itemId,
      )
          .then((reponse) {
        emit(ShareItemSuccessState(reponse['shareLink']));
        emit(InitializingXCommonState(x));
      }, onError: (error, trace) {
        emit(XErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void commentItem({required String content, String? targetCommentId}) {
    if (state is InitializingXCommonState) {
      final stateBefore = state;

      emit(const XLoadingState());
      service
          .commentItem(
              idItem: x.itemId,
              content: content.trim(),
              target: targetCommentId)
          .then((comment) {
        emit(CommentItemSuccessState(comment));

        var newItem = x.copyWithCommentsCount(increment: true);
        update(newItem);
      }, onError: (error, trace) {
        emit(XErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }
}
