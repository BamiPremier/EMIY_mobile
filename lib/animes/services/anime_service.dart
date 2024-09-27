import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/common/services/api_service.dart';

class AnimeService extends ApiService {
  static const String _anime = '/animes';

  static const String _watchlistAdd = '/animes/:idAnime/watchlist';
  static const String _viewerAdd = '/animes/:idAnime/viewed';

  const AnimeService(super._dio);

  Future<PaginatedList<Anime>> getAnimes({int page = 1}) async {
    return compute(
        dio.get(_anime,
          options: Options(headers: withAuth()),
          queryParameters: {
            'page': page,
            'size': 10,
          }),
        mapper: (result) => toPaginatedList(result, Anime.fromJson)
    );
  }

  Future<Anime> addToWatchList({required int anime}) async {
    return compute(
      dio.post(
        _watchlistAdd.replaceAll(':idAnime', anime.toString()),
        options: Options(headers: withAuth()),
      ),
      mapper: Anime.fromJson
    );
  }

  Future<Anime> addToViewerList({required int anime}) async {
    return compute(
      dio.post(
        _viewerAdd.replaceAll(':idAnime', anime.toString()),
        options: Options(headers: withAuth()),
      ),
      mapper: Anime.fromJson
    );
  }
}
