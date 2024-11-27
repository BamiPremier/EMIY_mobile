 
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/common/services/api_service.dart';
import 'package:umai/activity/models/activity.dart'; 

class ActivityService extends ApiService {
  static const String _feed = '/activities/feed';
  static const String _userActivity = '/activities';
  const ActivityService(super._dio);

  Future<PaginatedList<Activity>> getFeed({int page = 1}) {
    return compute(
        dio.get(_feed, options: Options(headers: withAuth()), queryParameters: {
          'page': page,
          'size': 12,
        }),
        mapper: (result) => toPaginatedList(result, Activity.fromJson));
  }

  Future<PaginatedList<Activity>> getUserActivity(
      {int page = 1, required String? userId}) {
    return compute(
        dio.get(_userActivity,
            options: Options(headers: withAuth()),
            queryParameters: {
              'page': page,
              'size': 12,
              if (userId != null) 'userId': userId,
            }),
        mapper: (result) => toPaginatedList(result, Activity.fromJson));
  }
}
