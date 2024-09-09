import 'package:umai/auth/models/register_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';

class AuthService extends ApiService {
  static const String _register = '/user/registration';
  static const String _login = '/user/authentification';

  const AuthService(super._dio);

  Future<RegisterResponse> register({
    String? firstName,
    required String lastName,
    required String email,
    required String token,
  }) {
    return compute(
      dio.post(_register, data: {
        'user': {
          'firstname': firstName,
          'lastname': lastName,
          'email': email,
          'token': token,
        }..removeWhere((key, value) => value == null),
      }),
      mapper: RegisterResponse.fromJson,
    );
  }

  Future<RegisterResponse> login(
      {required String identifier, required String password}) {
    return compute(
      dio.post(_login,
          data: FormData.fromMap({
            'login': identifier,
            'password': password,
          })),
      mapper: RegisterResponse.fromJson,
    );
  }
}
