import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//VARIABLE INITIALIZATION
SharedPreferences prefs;
bool isDark = false;
bool isAndroid = true;

class SystemPreferences extends ChangeNotifier {
  initPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  saveToPrefs(String key, dynamic value) async {
    await initPrefs();
    switch (value.runtimeType) {
      case int:
        prefs.setInt(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case bool:
        prefs.setBool(key, value);
        break;
      case String:
        prefs.setString(key, value);
        break;
      default:
        prefs.setString(key, value.toString());
    }
  }

  Future<dynamic> getFromPrefs(String key) async {
    await initPrefs();
    return prefs.get(key);
  }
}
