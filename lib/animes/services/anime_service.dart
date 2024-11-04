import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/common/services/api_service.dart';

class AnimeService extends ApiService {
  static const String _anime = '/animes';
  static const String _animeFeed = '/animes/feed';

  static const String _episode = '/animes/:idAnime/episodes';
  static const String _similar = '/animes/:idAnime/similar';
  static const String _watchlistAdd = '/animes/:idAnime/watchlist';
  static const String _viewerAdd = '/animes/:idAnime/viewed';

  const AnimeService(super._dio);

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
