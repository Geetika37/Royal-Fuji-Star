import 'package:shared_preferences/shared_preferences.dart';

class TokenKey {
  static Future<void> saveValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    print('saved value***: $value  key:$key');
  }

  static Future<String?> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    print('**retrieved value*****: $value');
    return value;
  }

  static Future<void> clearValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    print('--cleared value--$key');
  }
}
