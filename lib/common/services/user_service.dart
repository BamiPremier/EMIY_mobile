 

import 'package:potatoes/libs.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/api_service.dart';

class UserService extends ApiService {
  static const String _get = '/user/detail';

  const UserService(super._dio);

  Future<User> get(String id) {
    return compute(
        dio.get(
          _get,
          options: Options(headers: withAuth()),
          queryParameters: {'id': id},
        ),
        mapper: User.fromJson,
        mapperKey: 'user');
  }
}
