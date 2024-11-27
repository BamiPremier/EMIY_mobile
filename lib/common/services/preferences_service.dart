import 'dart:async';
import 'dart:convert'; 

import 'package:crypto/crypto.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:potatoes_secured_preferences/potatoes_secured_preferences.dart';
import 'package:umai/common/models/device_info.dart';
import 'package:umai/common/models/user.dart';

class PreferencesService extends SecuredPreferencesService {
  static const String _keyUser = 'user';
  static const String _keyUserUID = 'user_id';
  static const String _keyDeviceToken = 'device-token';
  static const String _keyAuthToken = 'auth_token';
  final PackageInfo packageInfo;
  final DeviceInfo deviceInfo;
  final String timezone;
  PreferencesService(super.preferences, super.secureStorage, this.packageInfo,
      this.deviceInfo, this.timezone);

  User? get user {
    final value = preferences.getString(_keyUser);

    if (value == null) return null;
    return User.fromJson(jsonDecode(value) as Map<String, dynamic>);
  }

  Future<void> saveUser(User user) {
    return Future.wait([
      preferences.setString(_keyUserUID, user.id),
      preferences.setString(_keyUser, jsonEncode(user)),
    ]);
  }

  Future<void> saveDeviceToken(String token) {
    return secureStorage.write(key: _keyDeviceToken, value: token);
  }

  Future<String?> get deviceToken {
    return secureStorage.read(key: _keyDeviceToken);
  }
  Future<void> saveAuthToken(String token) {
    return secureStorage.write(key: _keyAuthToken, value: token);
  }

  @override
  FutureOr<Map<String, String>> getAuthHeaders() async {
    final String userId = user!.id;
    final String authToken = (await secureStorage.read(key: _keyAuthToken))!;
    final DateTime dateTime = DateTime.now();

    String rawSign = "$userId\$${dateTime.millisecondsSinceEpoch}\$$authToken";
    Digest digest = sha1.convert(utf8.encode(rawSign)); 
    return {
      "timestamp": dateTime.millisecondsSinceEpoch.toString(),
      "id": userId,
      "hash": digest.toString(),
      "device_id": deviceInfo.id,
      "device_name": deviceInfo.name,
      "app_version": packageInfo.buildNumber ,
      "timezone": timezone,
    };
  }
}
