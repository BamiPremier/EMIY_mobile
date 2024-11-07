import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/comment_episode.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/common/services/api_service.dart';

class EpisodeService extends ApiService {
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

  Future shareEpisode({required int idEpisode}) {
    return compute(
      dio.post(
        _shareEpisode.replaceAll(':idEpisode', idEpisode.toString()),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<PaginatedList<CommentEpisode>> getCommentsEpisode({
    required int idEpisode,
    int page = 1,
    String? target,
  }) async {
    return compute(
      dio.get(
        _listCommentEpisode.replaceAll(':idEpisode', idEpisode.toString()),
        options: Options(headers: withAuth()),
        queryParameters: {
          'page': page,
          'size': 20,
          if (target != null && target != '') 'target': target
        },
      ),
      mapper: (result) => toPaginatedList(result, CommentEpisode.fromJson),
    );
  }

  Future<void> likeEpisode({
    required int idEpisode,
  }) async {
    return compute(
      dio.post(
        _likeEpisode.replaceAll(':idEpisode', idEpisode.toString()),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<void> unLikeEpisode({
    required int idEpisode,
  }) async {
    return compute(
      dio.delete(
        _likeEpisode.replaceAll(':idEpisode', idEpisode.toString()),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<CommentEpisode> commentEpisode({
    required int idEpisode,
    required String content,
    String? target,
  }) async {
    return compute(
      dio.post(
        _commentEpisode.replaceAll(':idEpisode', idEpisode.toString()),
        options: Options(headers: withAuth()),
        data: {'content': content, if (target != null) 'target': target},
      ),
      mapper: CommentEpisode.fromJson,
    );
  }

  Future<PaginatedList<CommentEpisode>> getCommentsResponseEpisode({
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
      mapper: (result) => toPaginatedList(result, CommentEpisode.fromJson),
    );
  }

  Future<CommentEpisode> commentCommentEpisode({
    required String commentId,
  }) async {
    return compute(
      dio.post(
        _commentCommentEpisode.replaceAll(':commentId', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: CommentEpisode.fromJson,
    );
  }

  Future<CommentEpisode> likeCommentEpisode({
    required String commentId,
  }) async {
    return compute(
      dio.post(
        _likeCommentEpisode.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: CommentEpisode.fromJson,
    );
  }

  Future unLikeCommentEpisode({
    required String commentId,
  }) async {
    return compute(
      dio.delete(
        _likeCommentEpisode.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: CommentEpisode.fromJson,
    );
  }

  Future<void> reportCommentEpisode({
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

  Future<CommentEpisode> deleteCommentEpisode({
    required String commentId,
  }) async {
    return compute(
      dio.delete(
        _deleteCommentEpisode.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: CommentEpisode.fromJson,
    );
  }
}
