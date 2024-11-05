import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/comment_episode.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/common/services/api_service.dart';

class AnimeService extends ApiService {
  static const String _anime = '/animes';
  static const String _animeFeed = '/animes/feed';

  static const String _episode = '/animes/:idAnime/episodes';
  static const String _similar = '/animes/:idAnime/similar';
  static const String _watchlistAdd = '/animes/:idAnime/watchlist';
  static const String _viewerAdd = '/animes/:idAnime/viewed';

  static const String _likeEpisode = '/animes/:idEpisode/like';
  static const String _commentEpisode = '/animes/:idEpisode/comment';

  //Action comment
  static const String _listCommentEpisode = '/animes/:idEpisode/comments';
  static const String _likeCommentEpisode = '/animes/comment/:idComment/like';
  static const String _commentCommentEpisode =
      '/animes/comment/:idComment/comment';
  static const String _listCommentResponseEpisode =
      '/animes/:idEpisode/comments';

  static const String _deleteCommentEpisode = '/animes/comment/:idComment';
  static const String _signalerCommentEpisode =
      '/animes/comment/:idComment/report';

  const AnimeService(super._dio);

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
    required String idEpisode,
  }) async {
    return compute(
      dio.post(
        _likeEpisode.replaceAll(':idEpisode', idEpisode),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<void> unLikeEpisode({
    required String idEpisode,
  }) async {
    return compute(
      dio.delete(
        _likeEpisode.replaceAll(':idEpisode', idEpisode),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<CommentEpisode> commentEpisode({
    required String idEpisode,
    required String content,
    String? target,
  }) async {
    return compute(
      dio.post(
        _commentEpisode.replaceAll(':idEpisode', idEpisode),
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

  Future<PaginatedList<Anime>> getAnimesFeed(
      {int page = 1, int? size, String? selectedFilter}) async {
    return compute(
        dio.get(_animeFeed,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': size ?? 6,
              'selectedFilter': selectedFilter,
            }),
        mapper: (result) => toPaginatedList(result, Anime.fromJson));
  }

  Future<PaginatedList<Episode>> getEpisodeAnime(
      {int page = 1, int? size, String? anime}) async {
    return compute(
        dio.get(_episode.replaceAll(':idAnime', anime.toString()),
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': size ?? 10,
            }),
        mapper: (result) => toPaginatedList(result, Episode.fromJson));
  }

  Future<PaginatedList<Anime>> getSimilarAnime(
      {int page = 1, int? size, String? anime}) async {
    return compute(
        dio.get(_similar.replaceAll(':idAnime', anime.toString()),
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': size ?? 10,
            }),
        mapper: (result) => toPaginatedList(result, Anime.fromJson));
  }

  Future<PaginatedList<Anime>> getAnimesSearch(
      {int page = 1, int? size, String? search}) async {
    return compute(
        dio.get(_anime,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': size ?? 6,
              'search': search,
            }),
        mapper: (result) => toPaginatedList(result, Anime.fromJson));
  }

  Future<Anime> addToWatchList({required int anime}) async {
    return compute(
        dio.post(
          _watchlistAdd.replaceAll(':idAnime', anime.toString()),
          options: Options(headers: withAuth()),
        ),
        mapper: Anime.fromJson);
  }

  Future<Anime> addToViewerList({required int anime}) async {
    return compute(
        dio.post(
          _viewerAdd.replaceAll(':idAnime', anime.toString()),
          options: Options(headers: withAuth()),
        ),
        mapper: Anime.fromJson);
  }

  Future<Anime> removeFromViewed({required int anime}) async {
    return compute(
        dio.delete(
          _viewerAdd.replaceAll(':idAnime', anime.toString()),
          options: Options(headers: withAuth()),
        ),
        mapper: Anime.fromJson);
  }

  Future<Anime> removeFromWatchList({required int anime}) async {
    return compute(
        dio.delete(
          _watchlistAdd.replaceAll(':idAnime', anime.toString()),
          options: Options(headers: withAuth()),
        ),
        mapper: Anime.fromJson);
  }
}
