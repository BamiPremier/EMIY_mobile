import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/preferences_service.dart';

class AccountService extends ApiService {
  final PreferencesService preferencesService;
  static const String _updateUser = '/users/update'; 
  static const String _logout = '/users/logout';
  
  const AccountService(
    super._dio,
    this.preferencesService,
  );
  Future updateUser({required data}) async {
    return compute(
      dio.post(
        _updateUser,
        data: data,
        options: Options(headers: withAuth()),
      ),
    );
  }
  Future logout() async {
    return compute(
      dio.post(
        _logout,
        options: Options(headers: withAuth()),
      ),
    );
  }
}
