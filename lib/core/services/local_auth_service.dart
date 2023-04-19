import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthService {
  late final SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> signUp(String user, String password) async {
    Map<String, String> userMap = {
      "user": user,
      "password": password,
    };
    await _sharedPreferences.setString(user, userMap.toString());
  }

  Future<bool> signIn(String user, String password) async {
    Map<String, String> userMap = {
      "user": user,
      "password": password,
    };
    String? userString = _sharedPreferences.getString(user);
    if (userString == null) {
      return false;
    }
    return userString == userMap.toString();
  }
}
