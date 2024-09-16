import 'package:umai/common/models/pagination.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';

class PreferenceUserService extends ApiService {
  static const String _category = '/api/auth/animes-genre';
  static const String _anime = '/api/auth/animes-by-genres';
  static const String _followers = '/users';

  const PreferenceUserService(super._dio);

  Future<Pagination> getCategoryAnimes({
    int page = 1,
  }) {
    return compute(
        dio.get(_category,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
            }),
        mapper: Pagination.fromJson);
  }

  Future<Pagination> getAnimes(
      {int page = 1, required List<int> listCategory}) {
    return compute(
        dio.get(_anime,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
            }),
        mapper: Pagination.fromJson);
  }

  Future<Pagination> getFollowers({
    int page = 1,
  }) {
    return compute(
        dio.get(_followers,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
            }),
        mapper: Pagination.fromJson);
  }

  Future<Pagination> completePreferenceUser(/* {
    int page = 1,
  } */
      ) {
    return compute(
        dio.get(_followers,
            options: Options(headers: withAuth()),
            queryParameters: {
              // 'next': page,
            }),
        mapper: Pagination.fromJson);
  }
}
