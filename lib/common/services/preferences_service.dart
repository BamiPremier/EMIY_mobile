import 'dart:async';
import 'dart:convert';

import 'package:umai/common/models/user.dart';
import 'package:potatoes/potatoes.dart' as potatoes;
import 'package:crypto/crypto.dart';

class PreferencesService extends potatoes.PreferencesService {
  static const String _keyUser = 'user';
  static const String _keyUserUID = 'user_id';
  static const String _keyLogged = 'logged';
  static const String _keyCurrentSession = 'session_id';
  static const String _keyAuthToken = 'auth_token';
  const PreferencesService(
    super.preferences,
  );

  String? get userUID => preferences.getString(_keyUserUID);

  User? get user {
    // preferences.clear();
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

  Future<void> saveAuthToken(String token) {
    return preferences.setString(_keyAuthToken, token);
  }

  @override
  FutureOr<Map<String, String>> getAuthHeaders() async {
    final String userId = userUID!;
    final String authToken = (preferences.getString(_keyAuthToken))!;
    final DateTime dateTime = DateTime.now();

    String rawSign = "$userId\$${dateTime.millisecondsSinceEpoch}\$$authToken";
    Digest digest = sha1.convert(utf8.encode(rawSign));
    print({
      "timestamp": dateTime.millisecondsSinceEpoch.toString(),
      "uid": userId,
      "hash": digest.toString(),
      // 'app_version': _appVersion
    });
    return {
      "timestamp": dateTime.millisecondsSinceEpoch.toString(),
      "id": userId,
      "hash": digest.toString(),
      'app_version': '1.0.0'
    };
  }
}
