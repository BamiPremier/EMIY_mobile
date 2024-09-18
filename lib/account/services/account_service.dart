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
 

  const AccountService(
    super._dio,
    this.preferencesService,
  );
}
