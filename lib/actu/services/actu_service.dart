import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/actu/models/actu.dart';
import 'package:umai/social/models/post.dart';

class ActuService extends ApiService {
  static const String _feed = '/actu/feed';
  const ActuService(super._dio);

  Future<PaginatedList<Actu>> getFeed({int page = 1}) {
    return compute(
        dio.get(_feed, options: Options(headers: withAuth()), queryParameters: {
          'page': page,
          'size': 10,
        }),
        mapper: (result) => toPaginatedList(result, Actu.fromJson));
  }

  Future<PaginatedList<Actu>> getUserActus(
      {int page = 1, required String userId}) {
    return compute(
        dio.get(_feed, options: Options(headers: withAuth()), queryParameters: {
          'page': page,
          'userId': userId,
          'size': 10,
        }),
        mapper: (result) => toPaginatedList(result, Actu.fromJson));
  }
}
