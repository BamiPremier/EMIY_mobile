import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/social/model/post.dart';

class UserService extends ApiService {
  static const String _getMe = '/users/me';

  static const String _follow = '/users/follow';
  static const String _unfollow = '/users/unfollow';
  static const String _block = '/users/:userId/block';
  static const String _unblock = '/users/:userId/unblock';
  static const String _blockedUsers = '/users/block';
  static const String _updateUser = '/users';
  static const String _updateProfilePicture = '/users/picture';
  static const String _userFollowers = '/users/followers';
  static const String _userFollowing = '/users/following';
  static const String _logout = '/users/logout';
  static const String _animeView = '/users/animes-viewed';
  static const String _animeWatchlist = '/users/animes-watchlist';
  static const String _posts = '/posts';

  const UserService(super._dio);

  Future<User> getMe() {
    return compute(
        dio.get(
          _getMe,
          options: Options(headers: withAuth()),
        ),
        mapper: User.fromJson);
  }

  Future<User> follow({required user}) async {
    return compute(
        dio.post(
          _follow,
          data: {
            'idFollowing': user,
          },
          options: Options(headers: withAuth()),
        ),
        mapper: User.fromJson);
  }

  Future<User> unFollow({required user}) async {
    return compute(
        dio.delete(
          _unfollow,
          data: {
            'idFollowing': user,
          },
          options: Options(headers: withAuth()),
        ),
        mapper: User.fromJson);
  }

  Future<PaginatedList<User>> getBlockedUsers({int page = 1}) async {
    return compute(
        dio.get(_blockedUsers,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
            }),
        mapper: (result) => toPaginatedList(result, User.fromJson));
  }

  Future<User> blockUser({required user}) async {
    return compute(
        dio.post(
          _block.replaceAll(':userId', user),
          data: {
            'reason': null,
          },
          options: Options(headers: withAuth()),
        ),
        mapper: User.fromJson);
  }

  Future<User> unBlockUser({required user}) async {
    return compute(
        dio.post(
          _unblock.replaceAll(':userId', user),
          options: Options(headers: withAuth()),
        ),
        mapper: User.fromJson);
  }

  Future<User> updateUser({
    String? username,
    String? biography,
  }) {
    return compute(
        dio.patch(
          _updateUser,
          data: {'username': username, 'biography': biography},
          options: Options(headers: withAuth()),
        ),
        mapper: User.fromJson);
  }

  Future<User> updateProfilePicture({required File file}) async {
    return compute(
        dio.patch(_updateProfilePicture,
            options: Options(headers: withAuth()),
            data: FormData.fromMap({
              'image': await MultipartFile.fromFile(file.path,
                  filename: basename(file.path))
            })),
        mapper: User.fromJson);
  }

  Future<void> logout() {
    return compute(
      dio.post(
        _logout,
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<PaginatedList<Anime>> getAnimeViewed({int page = 1}) async {
    return compute(
        dio.get(_animeView,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
            }),
        mapper: (result) => toPaginatedList(result, Anime.fromJson));
  }

  Future<PaginatedList<Anime>> getWatchList({int page = 1}) async {
    return compute(
        dio.get(_animeWatchlist,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
            }),
        mapper: (result) => toPaginatedList(result, Anime.fromJson));
  }

  Future<PaginatedList<User>> getUserFollowers(
      {int page = 1, String? userId}) async {
    return compute(
        dio.get(_userFollowers,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
              if (userId != null) 'userId': userId,
            }),
        mapper: (result) => toPaginatedList(result, User.fromJson));
  }

  Future<PaginatedList<User>> getUserFollowing(
      {int page = 1, String? userId}) async {
    return compute(
        dio.get(_userFollowing,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
              if (userId != null) 'userId': userId,
            }),
        mapper: (result) => toPaginatedList(result, User.fromJson));
  }

  Future<PaginatedList<Post>> getPosts({int page = 1}) async {
    return compute(
        dio.get(_posts,
            options: Options(headers: withAuth()),
            queryParameters: {'page': page}),
        mapper: (result) => toPaginatedList(result, Post.fromJson));
  }
}
