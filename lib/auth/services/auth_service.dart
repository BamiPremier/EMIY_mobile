 
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/auth/models/auth_response.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/api_service.dart';

class AuthService extends ApiService {
  static const String _auth = '/auth';
  static const String _completeProfile = '/auth/complete';
  static const String _genres = '/auth/animes-genre';
  static const String _animes = '/auth/animes-by-genres';
  static const String _people = '/auth/list-to-follow';

  static const String _addListAnimeToWatchlist = '/animes/many/watchlist';
  static const String _addListAnimeToViewer = '/animes/many/viewed';
  const AuthService(super._dio);

  Future<AuthResponse> authUser(
      {required String token,
      required String deviceId,
      required String deviceName,
      required String timezone,
      required String appVersion}) {
    return compute(
      dio.post(
        _auth,
        data: {
          "verify_token": token,
          "device_id": deviceId,
          "device_name": deviceName,
          "app_version": int.parse(appVersion),
          "timezone": timezone,
        },
      ),
      mapper: AuthResponse.fromJson,
    );
  }

  Future<User> completeUserProfile({
    required String userTag,
    required String userName,
  }) {
    return compute(
      dio.patch(
        _completeProfile,
        options: Options(headers: withAuth()),
        data: {
          'user_tag': userTag,
          'user_name': userName,
        },
      ),
      mapper: User.fromJson,
    );
  }

  Future<List<String>> getGenres() {
    return compute(
      dio.get(
        _genres,
        options: Options(headers: withAuth()),
      ),
      mapper: (result) => (result['response'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }

  Future<PaginatedList<Anime>> getAnimes(
      {int page = 1, required String selectedTarget}) {
    return compute(
        dio.get(_animes,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'selectedTarget': selectedTarget,
              'size': 12,
            }),
        mapper: (result) => toPaginatedList(result, Anime.fromJson));
  }

  Future addListAnimeToWatchList({required List<int> animeList}) async {
    return compute(
      dio.post(
        _addListAnimeToWatchlist,
        data: {
          'ids': animeList,
        },
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future addListAnimeToViewerList({required List<int> animeList}) async {
    return compute(
      dio.post(
        _addListAnimeToViewer,
        data: {
          'ids': animeList,
        },
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<PaginatedList<User>> getPeopleToFollow({int page = 1}) {
    return compute(
        dio.get(_people,
            options: Options(headers: withAuth()),
            queryParameters: {'page': page}),
        mapper: (result) => toPaginatedList(result, User.fromJson));
  }
}
