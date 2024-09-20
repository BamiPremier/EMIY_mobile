import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/models/episode_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/preferences_service.dart';

class AnimeService extends ApiService {
  static const String _anime = '/animes';
  final PreferencesService preferencesService;
  const AnimeService(
    super._dio,
    this.preferencesService,
  );

  Future<AnimeResponse> getAnimes({int page = 1}) async {
    return compute(
        dio.get(_anime,
            options:
                Options(headers: await preferencesService.getAuthHeaders()),
            queryParameters: {
              'page': page,
              'take': 10,
            }),
        mapper: AnimeResponse.fromJson);
  }

  Future<EpisodeResponse> getEpisodesAnime(
      {int page = 1, required String anime}) async {
    return compute(
        dio.get(_anime,
            options:
                Options(headers: await preferencesService.getAuthHeaders()),
            queryParameters: {'page': page, 'take': 10, 'anime': anime}),
        mapper: EpisodeResponse.fromJson);
  }

  Future<AnimeResponse> getAnimesByGenre(
      {int page = 1, required String genre}) async {
    return compute(
        dio.get(_anime,
            options:
                Options(headers: await preferencesService.getAuthHeaders()),
            queryParameters: {
              'page': page,
              'take': 10,
            }),
        mapper: AnimeResponse.fromJson);
  }
}
