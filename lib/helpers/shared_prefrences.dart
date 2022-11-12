import 'dart:convert';
import 'package:arrows/modules/sign_up/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static User? loginShared;

//initializing shared preferences instance
  static onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (getDataToSharedPrefrence("user") != null && getDataToSharedPrefrence("user") != 'null') {
      loginShared = User.fromJson(jsonDecode(getDataToSharedPrefrence("user")));
    }
  }

//get dynamic data from the shared preferences
  static dynamic getDataToSharedPrefrence(String key) {
    return sharedPreferences!.get(key);
  }

//add dynamic data to the shared preferences
  static Future<bool> saveDataToSharedPrefrence(
      String key, dynamic value) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is double) return await sharedPreferences!.setDouble(key, value);
    if (value == null) return await sharedPreferences!.setString(key, value.toString());

    value = jsonEncode(value);
    return await sharedPreferences!.setString(key, value);
  }
}
