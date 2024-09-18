import 'package:umai/auth/models/auth_response.dart';
import 'package:umai/auth/models/auth_response_complete_user.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart'; 
import 'dart:convert';

import 'package:umai/common/services/preferences_service.dart';

class AuthService extends ApiService {
  final PreferencesService preferencesService;

  static const String _auth = '/auth';
  static const String _authComplete = '/auth/complete';

  const AuthService(
    super._dio,
    this.preferencesService,
  );

  Future<AuthResponseCompleteUser> completeUserProfile({
    required String userTag,
    required String userName,
  }) async {
    return compute(
      dio.patch(
        _authComplete,
        data: {
          'user_tag': userTag,
          'user_name': userName,
        },
        options: Options(headers: await preferencesService.getAuthHeaders()),
      ),
      mapper: AuthResponseCompleteUser.fromJson,
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
  
}
