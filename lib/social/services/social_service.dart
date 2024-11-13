import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/social/models/post.dart';

class SocialService extends ApiService with XService<Post> {
  //Action post

  static const String _newPost = '/posts';
  static const String _getPost = '/posts/:idItem';
  static const String _deletePost = '/posts/:idItem';
  static const String _reportPost = '/posts/:idItem/report';
  static const String _sharePost = '/posts/:idItem/share';
  static const String _feed = '/posts/feed';
  static const String _likePost = '/posts/:idItem/like';
  static const String _commentPost = '/posts/:idItem/comment';

//Action comment

  static const String _listComments = '/posts/:idItem/comments';
  static const String _likeComment = '/posts/comment/:idComment/like';
  static const String _commentComment = '/posts/comment/:idComment/comment';
  static const String _listCommentResponse = '/posts/:idItem/comments';

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

  Future<void> reportItem({required String idItem, required String reason}) {
    return compute(
      dio.post(
        _reportPost.replaceAll(':idItem', idItem),
        options: Options(headers: withAuth()),
        data: {'reason': reason},
      ),
    );
  }

  @override
  Future shareItem({required String idItem}) {
    return compute(
      dio.get(
        _sharePost.replaceAll(':idItem', idItem),
        options: Options(headers: withAuth()),
      ),
    );
  }

  Future<Post> deleteItem({required String idItem}) {
    return compute(
      dio.delete(
        _deletePost.replaceAll(':idItem', idItem),
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

  Future<Post> getPost({required String idItem}) {
    return compute(
      dio.get(
        _getPost.replaceAll(':idItem', idItem),
        options: Options(headers: withAuth()),
      ),
    );
  }

  @override
  Future<Post> likeItem({
    required String idItem,
  }) async {
    return compute(
      dio.post(
        _likePost.replaceAll(':idItem', idItem),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  @override
  Future<Post> unLikeItem({
    required String idItem,
  }) async {
    return compute(
      dio.delete(
        _likePost.replaceAll(':idItem', idItem),
        options: Options(headers: withAuth()),
      ),
      mapper: Post.fromJson,
    );
  }

  @override
  Future<Comment> commentItem({
    required String idItem,
    required String content,
    String? target,
  }) async {
    return compute(
      dio.post(
        _commentPost.replaceAll(':idItem', idItem),
        options: Options(headers: withAuth()),
        data: {'content': content, if (target != null) 'target': target},
      ),
      mapper: Comment.fromJson,
    );
  }

  @override
  Future<PaginatedList<Comment>> getComments({
    required String idItem,
    int page = 1,
    String? target,
  }) async {
    return compute(
      dio.get(
        _listComments.replaceAll(':idItem', idItem),
        options: Options(headers: withAuth()),
        queryParameters: {
          'page': page,
          'size': 20,
          if (target != null && target != '') 'target': target
        },
      ),
      mapper: (result) => toPaginatedList(result, Comment.fromJson),
    );
  }

  @override
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

  @override
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

  @override
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

  @override
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

  @override
  Future<void> reportComment({
    required String commentId,
    required String reason,
  }) async {
    return compute(
      dio.post(
        _signalerComment.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
        data: {'reason': reason},
      ),
    );
  }

  Future<Comment> deleteComment({
    required String commentId,
  }) async {
    return compute(
      dio.delete(
        _deleteComment.replaceAll(':idComment', commentId),
        options: Options(headers: withAuth()),
      ),
      mapper: Comment.fromJson,
    );
  }
}
