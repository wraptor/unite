import 'package:shared_preferences/shared_preferences.dart' as sp;

class SharedPreferences {
  SharedPreferences._internal();

  static late sp.SharedPreferences prefs;

  static Future<bool> init() async {
    print("SharedPreferences Init Starting");
    prefs = await sp.SharedPreferences.getInstance();
    print("SharedPreferences Init Success!");
    return Future.value(true);
  }

  static Future<bool> set(String key, dynamic value) async {
    bool res;
    if (value is int) {
      res = await prefs.setInt(key, value);
    } else if (value is double) {
      res = await prefs.setDouble(key, value);
    } else if (value is String) {
      res = await prefs.setString(key, value);
    } else if (value is bool) {
      res = await prefs.setBool(key, value);
    } else if (value is List<String>) {
      res = await prefs.setStringList(key, value);
    } else {
      res = await prefs.setString(key, value.toString());
    }
    return Future.value(res);
  }

  static Object? get(String key) {
    return prefs.get(key);
  }
}
