import 'package:umai/auth/models/auth_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';

class AuthService extends ApiService {
  static const String _register = '/user/registration';
  static const String _auth = '/auth';

  const AuthService(super._dio);

  Future<AuthResponse> completeUserName({
    required String idUserName,
    required String username,
  }) {
    return compute(
      dio.patch(_register, data: {
        'user': {
          'idUserName': idUserName,
          'username': username,
        },
      }),
      mapper: AuthResponse.fromJson,
    );
  }

  Future<AuthResponse> authUser(
      {required String email, required String token}) {
    return compute(
      dio.post(_auth,
          data: FormData.fromMap({
            'email': email,
            'token': token,
          })),
      mapper: AuthResponse.fromJson,
    );
  }
}
