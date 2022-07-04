import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  static String loginStatusKey = "LOGIN_STATUS_KEY";
  static String userIDKey = "USER_ID_KEY";

  static Future saveLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginStatusKey, true);
  }

  static Future saveUserID(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userIDKey, userID);
  }

  static Future<bool?> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loginStatusKey);
  }

  static Future<String?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIDKey);
  }
}
