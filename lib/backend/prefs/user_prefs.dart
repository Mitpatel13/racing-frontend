import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/model/usermodel.dart';
import '../../main.dart';

class UserPreferences {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _userInfoKey = 'userInfo';
  static const String _isAdminKey = 'isAdmin';

  static Future<void> setIsLoggedIn(bool value) async {
    await prefs.setBool(_isLoggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> saveUserInfo(UserModel userInfo) async {
    final userInfoJson = userModelToJson(userInfo);
    await prefs.setString(_userInfoKey, userInfoJson);
    await prefs.setBool(_isAdminKey, userInfo.data?.isAdmin??false);
  }
  static Future<UserModel?> getUserInfo() async {
    final userInfoJson = prefs.getString(_userInfoKey);
    if (userInfoJson != null) {
      return userModelFromJson(userInfoJson);
    } else {
      return null;
    }
  }

  static Future<bool> isAdmin() async {
    return prefs.getBool(_isAdminKey) ?? false;
  }


  static Future<void> clearUserInfo() async {
    await prefs.remove(_userInfoKey);
    await prefs.remove(_isAdminKey);
    print("user info clear and logout");
  }
}

class LoginManager {
  static Future<void> login(UserModel userInfo) async {
    await UserPreferences.setIsLoggedIn(true);
    await UserPreferences.saveUserInfo(userInfo);
  }

  static Future<void> logout() async {
    await UserPreferences.setIsLoggedIn(false);
    await UserPreferences.clearUserInfo();
  }

  static Future<bool> isLoggedIn() async {
    return await UserPreferences.isLoggedIn();
  }
}
