import 'dart:io';

import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/models/follower_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AccountService extends ApiService {
  final PreferencesService preferencesService;
  static const String _updateUser = '/users';
  static const String _updateProfilePicture = '/users/picture';
  static const String _userFollowers = '/users/followers';
  static const String _userFollowing = '/users/following';
  static const String _logout = '/users/logout';
  static const String _animeView = '/users/animes-viewed';
  static const String _animeWatchlist = '/users/animes-watchlist';
  const AccountService(
    super._dio,
    this.preferencesService,
  );
  Future updateUser({required data}) async {
    return compute(
      dio.post(
        _updateUser,
        data: data,
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future logout() async {
    return compute(
      dio.post(
        _logout,
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<AnimeResponse> getAnimeView({int page = 1}) async {
    return compute(
        dio.get(_animeView,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
            }),
        mapper: AnimeResponse.fromJson);
  }

  Future<AnimeResponse> getWatchList({int page = 1}) async {
    return compute(
        dio.get(_animeWatchlist,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
            }),
        mapper: AnimeResponse.fromJson);
  }

  Future<User> getUserFollowers({int page = 1}) async {
    return compute(
        dio.get(_userFollowers,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
            }),
        mapper: User.fromJson);
  }

  Future<User> getUserFollowing({int page = 1}) async {
    return compute(
        dio.get(_userFollowing,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
            }),
        mapper: User.fromJson);
  }

  Future updateProfilePicture({
    required File file,
  }) async {
    return compute(
        dio.patch(_updateProfilePicture,
            options: Options(headers: withAuth()),
            data: FormData.fromMap({
              'image': await MultipartFile.fromFile(file.path,
                  filename: basename(file.path))
            })),
        mapperKey: 'user');
  }
}
