// import 'dart:async';
// import 'dart:convert';

// import 'package:umai/common/models/user.dart';
// import 'package:potatoes/potatoes.dart' as potatoes;

// class PreferencesService extends potatoes.PreferencesService {
//   static const String _keyUser = 'user';
//   static const String _keyJwt = 'jwt';

//   const PreferencesService(
//     super.preferences,
//   );

//   User? get user {
//     final value = preferences.getString(_keyUser);

//     if (value == null) return null;
//     return User.fromJson(jsonDecode(value) as Map<String, dynamic>);
//   }

//   Future<void> saveUser(User user) {
//     return preferences.setString(_keyUser, jsonEncode(user));
//   }

//   Future<void> saveJwt(String jwt) {
//     return preferences.setString(_keyJwt, jwt);
//   }

//   @override
//   FutureOr<Map<String, String>> getAuthHeaders() async {
//     return {'Authorization': 'Bearer ${preferences.get(_keyJwt)}'};
//   }
// }
