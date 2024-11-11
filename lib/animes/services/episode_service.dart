import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/social/model/comment.dart';

class EpisodeService extends ApiService with XService<Episode> {
  static const String _likeEpisode = '/episodes/:idEpisode/like';
  static const String _commentEpisode = '/episodes/:idEpisode/comment';
  static const String _shareEpisode = '/episodes/:idEpisode/share';

  //Action comment
  static const String _listCommentEpisode = '/episodes/:idEpisode/comments';
  static const String _likeCommentEpisode = '/episodes/comment/:idComment/like';
  static const String _commentCommentEpisode =
      '/episodes/comment/:idComment/comment';
  static const String _listCommentResponseEpisode =
      '/episodes/comment/:idComment/comments';

  static const String _deleteCommentEpisode = '/episodes/comment/:idComment';
  static const String _signalerCommentEpisode =
      '/episodes/comment/:idComment/report';

  const EpisodeService(super._dio);
  @override
  Future shareItem({required String idItem}) {
    return compute(
      dio.post(
        _shareEpisode.replaceAll(':idEpisode', idItem.toString()),
        options: Options(headers: withAuth()),
      ),
    );
  }

  @override
  Future<PaginatedList<Comment>> getComments({
    required String idItem,
    int page = 1,
    String? target,
  }) async {
    return compute(
      dio.get(
        _listCommentEpisode.replaceAll(':idEpisode', idItem.toString()),
        options: Options(headers: withAuth()),
        queryParameters: {
          'page': page,
          'size': 20,
          if (target != null && target != '') 'target': target
        },
      ),
      mapper: (result) => toPaginatedList(result, Comment.fromJson),
    );
  }

  @override
  Future<Episode> likeItem({
    required String idItem,
  }) async {
    return compute(
      dio.post(
        _likeEpisode.replaceAll(':idEpisode', idItem.toString()),
        options: Options(headers: withAuth()),
      ),
      mapper: Episode.fromJson,
    );
  }

  @override
  Future<Episode> unLikeItem({
    required String idItem,
  }) async {
    return compute(
      dio.delete(
        _likeEpisode.replaceAll(':idEpisode', idItem.toString()),
        options: Options(headers: withAuth()),
      ),
      mapper: Episode.fromJson,
    );
  }

  @override
  Future<Comment> commentItem({
    required String idItem,
    required String content,
    String? target,
  }) async {
    return compute(
      dio.post(
        _commentEpisode.replaceAll(':idEpisode', idItem.toString()),
        options: Options(headers: withAuth()),
        data: {'content': content, if (target != null) 'target': target},
      ),
      mapper: Comment.fromJson,
    );
  }

  @override
  Future<PaginatedList<Comment>> getCommentsResponse({
    required String commentId,
    int page = 1,
  }) async {
    return compute(
      dio.get(
        _listCommentResponseEpisode.replaceAll(':commentId', commentId),
        options: Options(headers: withAuth()),
        queryParameters: {
          'page': page,
          'size': 10,
        },
      ),
      mapper: (result) => toPaginatedList(result, Comment.fromJson),
    );
  }

  @override
  Future<Comment> commentComment({
    required String commentId,
  }) async {
    return compute(
      dio.post(
        _commentCommentEpisode.replaceAll(':commentId', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }

  @override
  Future<Comment> likeComment({
    required String commentId,
  }) async {
    return compute(
      dio.post(
        _likeCommentEpisode.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }

  @override
  Future unLikeComment({
    required String commentId,
  }) async {
    return compute(
      dio.delete(
        _likeCommentEpisode.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }

  @override
  Future<void> reportComment({
    required String commentId,
    required String reason,
  }) async {
    return compute(
      dio.post(
        _signalerCommentEpisode.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
        data: {'reason': reason},
      ),
    );
  }

  Future<Comment> deleteComment({
    required String commentId,
  }) async {
    return compute(
      dio.delete(
        _deleteCommentEpisode.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }
}
