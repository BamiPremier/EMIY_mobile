import 'package:umai/auth/models/auth_response.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthService extends ApiService {
  static const String _auth = '/auth';
  static const String _authComplete = '/auth/complete';

  const AuthService(super._dio);

  Future<User> completeUserProfile({
    required String userTag,
    required String userName,
  }) {
    return compute(
      dio.patch(
        _authComplete,
        data: {
          'user_tag': userTag,
          'user_name': userName,
        },
        options: Options(headers: {
          'uidAuth':
              '66e8a2a3f5c797f41072fc1d', // Assurez-vous qu'il n'y a pas d'espace après 'uidAuth'
          'timestampAuth': '1726522019469',
          'hashAuth': hashToken(
              'FbOsNMj08YeK4jnaQM2jF7iwwhl7So7hoAfC9dkLaHPPSAxAeaJTYop1JJ40')
        }),
      ),
      mapper: User.fromJson,
    );
  }

  Future<AuthResponse> authUser(
      {required String email, required String token}) {
    return compute(
      dio.post(
        _auth,
        data: {
          'email': email,
          'verify_token': token,
        },
      ),
      mapper: AuthResponse.fromJson,
    );
  }

  String hashToken(String token) {
    var bytes = utf8.encode(token); // Encode le token en bytes
    var digest = sha256.convert(bytes); // Applique le hachage SHA-256
    return digest
        .toString(); // Retourne le hash sous forme de chaîne hexadécimale
  }
}
