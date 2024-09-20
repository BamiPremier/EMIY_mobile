import 'package:potatoes/libs.dart';
import 'package:umai/auth/models/auth_response.dart';
import 'package:umai/auth/models/auth_response_complete_user.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/models/follower_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:umai/common/services/preferences_service.dart';

class AuthService extends ApiService {
  final PreferencesService preferencesService;

  static const String _category = '/auth/animes-genre';
  static const String _anime = '/auth/animes-by-genres';
  static const String _followers = '/auth/list-to-follow';
  static const String _watchlistAdd = '/watchlist/add';
  static const String _viewerAdd = '/animes_viewed/add';
  static const String _folllowerAdd = '/follow/user-follow-with-id';
  static const String _folllowerRemove = '/follow/user-unfollow-with-id';
  static const String _auth = '/auth';
  static const String _completeProfile = '/auth/userUID/complete';

  const AuthService(
    super._dio,
    this.preferencesService,
  );

  Future<AuthResponseCompleteUser> completeUserProfile({
    required String userTag,
    required String userName,
  }) async {
    return compute(
      dio.patch(
        _completeProfile.replaceAll('userUID', preferencesService.userUID!),
        data: {
          'user_tag': userTag,
          'user_name': userName,
        },
      ),
      mapper: AuthResponseCompleteUser.fromJson,
    );
  }

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

  Future getCategoryAnimes() async {
    return compute(
      dio.get(
        _category,
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<AnimeResponse> getAnimes(
      {int page = 1, required List<String> listCategory}) async {
    return compute(
        dio.get(_anime,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'genre': listCategory,
              'take': 12,
            }),
        mapper: AnimeResponse.fromJson);
  }

  Future<FollowerResponse> getFollowers({
    int page = 1,
  }) async {
    return compute(
        dio.get(_followers,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
            }),
        mapper: FollowerResponse.fromJson);
  }

  Future addToWatchList({required anime}) async {
    return compute(
      dio.post(
        "$_watchlistAdd?id=$anime",
        data: {
          'id': anime,
        },
        options: Options(headers: withAuth()),
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
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future followUser({required follower}) async {
    return compute(
      dio.post(
        _folllowerAdd,
        data: {
          'idFollowing': follower,
        },
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future unFollowUser({required follower}) async {
    return compute(
      dio.post(
        _folllowerRemove,
        data: {
          'idFollowing': follower,
        },
        options: Options(headers: withAuth()),
      ),
    );
  }
}
