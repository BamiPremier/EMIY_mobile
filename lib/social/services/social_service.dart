import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';

class SocialService extends ApiService {
  static const String _newPost = '/posts';
  static const String _getPost = '/posts/:idPost';
  static const String _deletePost = '/posts/:idPost';
  static const String _feed = '/posts/feed';
  static const String _likePost = '/posts/:idPost/like';
  static const String _commentPost = '/posts/:idPost/comment';
  static const String _listComments = '/posts/:idPost/comments';
  static const String _likeComment = '/posts/comment/:idComment/like';
  static const String _unlikeComment = '/posts/comment/:idComment/unlike';

  const SocialService(super._dio);

  Future<Post> create({
    String? content,
    File? file,
  }) async {
    final data = <String, dynamic>{'content': content};
    if (file != null) {
      data['image'] = await MultipartFile.fromFile(file.path,
          filename: basename(file.path));
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

  Future<Post> deletePost({required String postId}) {
    return compute(
      dio.delete(
        _deletePost.replaceAll(':idPost', postId),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<PaginatedList<Post>> getFeed({int page = 1}) {
    return compute(
        dio.get(_feed, options: Options(headers: withAuth()), queryParameters: {
          'page': page,
          'size': 10,
        }),
        mapper: (result) => toPaginatedList(result, Post.fromJson));
  }

  Future<PaginatedList<Post>> getUserPosts(
      {int page = 1, required String userId}) {
    return compute(
        dio.get(_newPost,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'userId': userId,
              'size': 10,
            }),
        mapper: (result) => toPaginatedList(result, Post.fromJson));
  }

  Future<Post> getPost({required String postId}) {
    return compute(
      dio.get(
        _getPost.replaceAll(':idPost', postId),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<Post> likePost({
    required String postId,
  }) async {
    return compute(
      dio.post(
        _likePost.replaceAll(':idPost', postId),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  Future<Post> unLikePost({
    required String postId,
  }) async {
    return compute(
      dio.delete(
        _likePost.replaceAll(':idPost', postId),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  Future<Post> commentPost({
    required String postId,
  }) async {
    return compute(
      dio.post(
        _commentPost.replaceAll(':idPost', postId),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  Future<PaginatedList<Comment>> listComments({
    required String postId,
  }) async {
    return compute(
      dio.get(
        _listComments.replaceAll(':idPost', postId),
        options: Options(headers: withAuth()),
      ),
      mapper: (result) => toPaginatedList(result, Comment.fromJson),
    );
  }

  Future<Comment> likeComment({
    required String commentId,
  }) async {
    return compute(
      dio.post(
        _likeComment.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }

  Future unLikeComment({
    required String commentId,
  }) async {
    return compute(
      dio.delete(
        _unlikeComment.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }
}
