import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';

class SocialService extends ApiService {
  //Action post

  static const String _newPost = '/posts';
  static const String _getPost = '/posts/:idPost';
  static const String _deletePost = '/posts/:idPost';
  static const String _signalerPost = '/posts/:idPost/report';
  static const String _sharePost = '/posts/:idPost/share';
  static const String _feed = '/posts/feed';
  static const String _likePost = '/posts/:idPost/like';
  static const String _commentPost = '/posts/:idPost/comment';

//Action comment

  static const String _listComments = '/posts/:idPost/comments';
  static const String _likeComment = '/posts/comment/:idComment/like';
  static const String _commentComment = '/posts/comment/:idComment/comment';
  static const String _listCommentResponse = '/posts/:idPost/comments';

  static const String _deleteComment = '/posts/comment/:idComment';
  static const String _signalerComment = '/posts/comment/:idComment/report';
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

  Future<Post> signalerPost({required String idPost, required String reason}) {
    return compute(
      dio.post(
        _signalerPost.replaceAll(':idPost', idPost),
        options: Options(headers: withAuth()),
        data: {'reason': reason},
      ),
    );
  }

  Future<Post> deletePost({required String idPost}) {
    return compute(
      dio.delete(
        _deletePost.replaceAll(':idPost', idPost),
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

  Future<Post> getPost({required String idPost}) {
    return compute(
      dio.get(
        _getPost.replaceAll(':idPost', idPost),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<Post> likePost({
    required String idPost,
  }) async {
    return compute(
      dio.post(
        _likePost.replaceAll(':idPost', idPost),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  Future<Post> unLikePost({
    required String idPost,
  }) async {
    return compute(
      dio.delete(
        _likePost.replaceAll(':idPost', idPost),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  Future<Comment> commentPost({
    required String idPost,
    required String content,
  }) async {
    return compute(
      dio.post(
        _commentPost.replaceAll(':idPost', idPost),
        options: Options(headers: withAuth()),
        data: {'content': content},
      ),
      mapper: Comment.fromJson,
    );
  }

  Future<PaginatedList<Comment>> getComments({
    required String idPost,
    int page = 1,
  }) async {
    return compute(
      dio.get(
        _listComments.replaceAll(':idPost', idPost),
        options: Options(headers: withAuth()),
        queryParameters: {
          'page': page,
          'size': 20,
        },
      ),
      mapper: (result) => toPaginatedList(result, Comment.fromJson),
    );
  }

  Future<PaginatedList<Comment>> getCommentsResponse({
    required String commentId,
    int page = 1,
  }) async {
    return compute(
      dio.get(
        _listCommentResponse.replaceAll(':commentId', commentId),
        options: Options(headers: withAuth()),
        queryParameters: {
          'page': page,
          'size': 10,
        },
      ),
      mapper: (result) => toPaginatedList(result, Comment.fromJson),
    );
  }

  Future<Comment> commentComment({
    required String commentId,
  }) async {
    return compute(
      dio.post(
        _commentComment.replaceAll(':commentId', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
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
        _likeComment.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }

  Future<Comment> signalerComment({
    required String commentId,
    required String reason,
  }) async {
    return compute(
      dio.post(
        _signalerComment.replaceAll(':commentId', commentId),
        options: Options(headers: withAuth()),
        data: {'reason': reason},
      ),
      mapper: Comment.fromJson,
    );
  }

  Future<Comment> deleteComment({
    required String commentId,
  }) async {
    return compute(
      dio.delete(
        _deleteComment.replaceAll(':commentId', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }
}
