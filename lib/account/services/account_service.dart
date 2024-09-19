import 'package:umai/auth/models/auth_response.dart';
import 'package:umai/auth/models/auth_response_complete_user.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:umai/common/services/preferences_service.dart';

class AccountService extends ApiService {
  final PreferencesService preferencesService;
   static const String _updateUser = '/users/update';

  const AccountService(
    super._dio,
    this.preferencesService,
  );
  Future updateUser({required data}) async {
    return compute(
      dio.post(
        _updateUser,
        data: data,
        options: Options(headers: await preferencesService.getAuthHeaders()),
      ),
    );
  }
}
