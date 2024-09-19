 
import 'package:umai/auth/models/anime_response.dart';
import 'package:umai/auth/models/follower_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/preferences_service.dart';

class PreferenceUserService extends ApiService {
  static const String _category = '/auth/animes-genre';
  static const String _anime = '/auth/animes-by-genres';
  static const String _followers = '/follow/list-to-follow';
  static const String _watchlistAdd = '/watchlist/add';
  static const String _viewerAdd = '/animes_viewed/add';
  static const String _folllowerAdd = '/follow/user-follow-with-id';
  final PreferencesService preferencesService;
  const PreferenceUserService(
    super._dio,
    this.preferencesService,
);

  Future getCategoryAnimes() async {
    return compute(
      dio.get(
        _category,
        options: Options(headers: await preferencesService.getAuthHeaders()),
      ),
    );
  }

  Future<AnimeResponse> getAnimes(
      {int page = 1, required List<String> listCategory}) async {
    return compute(
        dio.get(_anime,
            options:
                Options(headers: await preferencesService.getAuthHeaders()),
            queryParameters: {
              'page': page,
              'genre': listCategory,
              'take': 10,
            }),
        mapper: AnimeResponse.fromJson);
  }

  Future<FollowerResponse> getFollowers({
    int page = 1,
  }) async {
    return compute(
        dio.get(_followers,
            options:
                Options(headers: await preferencesService.getAuthHeaders()),
            queryParameters: {
              'page': page,
            }),
        mapper: FollowerResponse.fromJson);
  }

  addToWatchList({required anime}) async {
    return compute(
      dio.post(
        "$_watchlistAdd?id=$anime",
        data: {
          'id': anime,
        },
        options: Options(headers: await preferencesService.getAuthHeaders()),
      ),
    );
  }

  Future addToViewerList({required anime}) async {
    return compute(
      dio.post(
        _viewerAdd,
        data: {
          'id': anime,
        },
        options: Options(headers: await preferencesService.getAuthHeaders()),
      ),
    );
  }

  addToFollowerList({required follower}) async {
    return compute(
      dio.post(
        _folllowerAdd,
        data: {
          'idFollowing': follower,
        },
        options: Options(headers: await preferencesService.getAuthHeaders()),
      ),
    );
  }
}
