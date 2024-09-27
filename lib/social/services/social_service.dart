import 'dart:io';

import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/models/follower_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:umai/social/model/post_response.dart';

class SocialService extends ApiService {
  final PreferencesService preferencesService;
  static const String _newPost = '/posts';
  static const String _post = '/posts/idPost';
  static const String _feeds = '/posts/feeds';
  static const String _likePost = '/posts/like';
  static const String _commentPost = '/posts/comment';
  static const String _likeComment = '/posts/comment/like';
  const SocialService(
    super._dio,
    this.preferencesService,
  );
  Future<Post> newPost({
    required String content,
    required File file,
  }) async {
    return compute(
      dio.post(
        _newPost,
        data: FormData.fromMap({
          'content': content,
          'image': await MultipartFile.fromFile(file.path,
              filename: basename(file.path)),
        }),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  Future<PostResponse> getFeeds({int page = 1}) async {
    return compute(
        dio.get(_feeds,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'take': 10,
            }),
        mapper: PostResponse.fromJson);
  }

  Future<PostResponse> getUserPosts(
      {int page = 1, required String userId}) async {
    return compute(
        dio.get(_newPost,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'userId': userId,
              'take': 10,
            }),
        mapper: PostResponse.fromJson);
  }

  Future getPostInfo({
    required String postId,
  }) async {
    return compute(
      dio.post(
        _post.replaceAll('idPost', postId),
        data: {},
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future likePost({
    required String postId,
  }) async {
    return compute(
      dio.post(
        _likePost,
        data: {},
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future likeCommentForPost({
    required String postId,
  }) async {
    return compute(
      dio.post(
        _likeComment,
        data: {},
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<AnimeResponse> getCommentForPost({int page = 1}) async {
    return compute(
        dio.get(_commentPost,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'take': 10,
            }),
        mapper: AnimeResponse.fromJson);
  }
}
