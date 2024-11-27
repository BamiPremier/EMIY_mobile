import 'dart:io';

import 'package:path/path.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/activitie/models/activitie.dart';
import 'package:umai/social/models/post.dart';

class ActivitieService extends ApiService {
  static const String _feed = '/activities/feed';
  static const String _userActivitie = '/activities';
  const ActivitieService(super._dio);

  Future<PaginatedList<Activitie>> getFeed({int page = 1}) {
    return compute(
        dio.get(_feed, options: Options(headers: withAuth()), queryParameters: {
          'page': page,
          'size': 12,
        }),
        mapper: (result) => toPaginatedList(result, Activitie.fromJson));
  }

  Future<PaginatedList<Activitie>> getUserActivitie(
      {int page = 1, required String? userId}) {
    return compute(
        dio.get(_userActivitie,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
              if (userId != null) 'userId': userId,
            }),
        mapper: (result) => toPaginatedList(result, Activitie.fromJson));
  }
}
