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

  static const String _folllow = '/users/follow';
  static const String _unfollow = '/users/unfollow';

  const AuthService(super._dio);

  Future<AuthResponse> authUser(
      {required String email, required String token}) {
    return compute(
      dio.post(
        _auth,
        data: {
          'email': email,
          'verify_token': token,
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
      {int page = 1, required List<String> genres}) {
    return compute(
        dio.get(_animes,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'genre': genres,
              'size': 12,
            }),
        mapper: (result) => toPaginatedList(result, Anime.fromJson));
  }

  Future<PaginatedList<User>> getPeopleToFollow({int page = 1}) {
    return compute(
        dio.get(_people,
            options: Options(headers: withAuth()),
            queryParameters: {'page': page}),
        mapper: (result) => toPaginatedList(result, User.fromJson));
  }

  Future<User> followUser({required follower}) async {
    return compute(
      dio.post(
        _folllow,
        data: {
          'idFollowing': follower,
        },
        options: Options(headers: withAuth()),
      ),
      mapper: User.fromJson,
    );
  }

  Future<User> unFollowUser({required follower}) async {
    return compute(
      dio.delete(
        _unfollow,
        data: {
          'idFollowing': follower,
        },
        options: Options(headers: withAuth()),
      ),
      mapper: User.fromJson,
    );
  }
}
