import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localAuthService = Provider((ref) => LocalAuthService());

class LocalAuthService extends ChangeNotifier {
  late SharedPreferences _sharedPreferences;
  bool isAuthenticated = false;
  TextEditingController userTextController = TextEditingController();
  TextEditingController registerUserTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController registerPasswordTextController =
      TextEditingController();

  final formKeySignIn = GlobalKey<FormState>();
  final formKeySignUp = GlobalKey<FormState>();

  Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> signUp(String user, String password) async {
    await initSharedPreferences();
    Map<String, String> userMap = {
      "user": user,
      "password": password,
    };
    await _sharedPreferences.setString(user, userMap.toString());
    isAuthenticated = false;
    notifyListeners();
  }

  Future<void> signIn(String user, String password) async {
    await initSharedPreferences();
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
