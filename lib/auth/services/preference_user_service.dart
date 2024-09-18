import 'package:umai/auth/models/anime_response.dart' hide Pagination;
import 'package:umai/auth/models/category_anime_response.dart';
import 'package:umai/auth/models/follower_response.dart';
import 'package:umai/common/models/pagination.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/preferences_service.dart';

class PreferenceUserService extends ApiService {
  static const String _category = '/auth/animes-genre';
  static const String _anime = '/auth/animes-by-genres';
  static const String _followers = '/users';
  final PreferencesService preferencesService;
  const PreferenceUserService(
    super._dio,
    this.preferencesService,
  );

  Future getCategoryAnimes({
    int page = 1,
  }) async {
    return compute(
        dio.get(_category,
            options:
                Options(headers: await preferencesService.getAuthHeaders()),
            queryParameters: {
              'page': page,
            }),
        mapper: CategoryAnimeResponse.fromJson);
  }

  Future<AnimeResponse> getAnimes(
      {int page = 1, required List<String> listCategory}) async {
    return compute(
        dio.get(_anime,
            options:
                Options(headers: await preferencesService.getAuthHeaders()),
            queryParameters: {
              'page': page,
              'genre': listCategory.length < 0 ? [listCategory] : listCategory,
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
 
}
