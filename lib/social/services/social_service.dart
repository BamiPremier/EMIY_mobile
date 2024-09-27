import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/social/model/post.dart';

class SocialService extends ApiService {
  static const String _newPost = '/posts';
  static const String _getPost = '/posts/:idPost';
  static const String _feed = '/posts/feed';
  static const String _likePost = '/posts/like';
  static const String _commentPost = '/posts/comment';
  static const String _likeComment = '/posts/comment/like';

  const SocialService(super._dio);

  Future<Post> create({
    String? content,
    File? file,
  }) async {
    final data = <String, dynamic>{'content': content};
    if (file != null) {
      data['image'] = await MultipartFile.fromFile(
        file.path,
        filename: basename(file.path)
      );
    }

    return compute(
      dio.post(
        _newPost,
        data: FormData.fromMap(data),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  Future<PaginatedList<Post>> getFeed({int page = 1}) {
    return compute(
        dio.get(_feed,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 10,
            }),
        mapper: (result) => toPaginatedList(result, Post.fromJson)
    );
  }

  Future<PaginatedList<Post>> getUserPosts({int page = 1, required String userId}) {
    return compute(
        dio.get(_newPost,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'userId': userId,
              'size': 10,
            }),
        mapper: (result) => toPaginatedList(result, Post.fromJson)
    );
  }

  Future<Post> getPost({required String postId}) {
    return compute(
      dio.get(
        _getPost.replaceAll('idPost', postId),
        data: {},
        options: Options(headers: withAuth()),
      ),
    );
  }
}
