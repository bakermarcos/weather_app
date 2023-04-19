import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthService extends ChangeNotifier {
  late final SharedPreferences _sharedPreferences;
  bool isAuthenticated = false;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> signUp(String user, String password) async {
    Map<String, String> userMap = {
      "user": user,
      "password": password,
    };
    await _sharedPreferences.setString(user, userMap.toString());
    isAuthenticated = false;
    notifyListeners();
  }

  Future<void> signIn(String user, String password) async {
    Map<String, String> userMap = {
      "user": user,
      "password": password,
    };
    String? userString = _sharedPreferences.getString(user);
    if (userString == null) {
      isAuthenticated = false;
    } else {
      isAuthenticated = userString == userMap.toString();
    }
    notifyListeners();
  }
}
