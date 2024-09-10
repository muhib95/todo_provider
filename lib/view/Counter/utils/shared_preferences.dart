import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<void> addValueInteger(String key, int value) async {
    print('${key} ${value}');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int?> getIntValue(String key) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
    return counter;
  }
}
