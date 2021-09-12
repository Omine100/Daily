import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//VARIABLE INITIALIZATION
SharedPreferences prefs;
bool isDark = false;

class SystemPreferences extends ChangeNotifier {
  initPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  saveToPrefs(String key, dynamic value) async {
    await initPrefs();
    if (value.runtimeType == int) prefs.setInt(key, value);
    if (value.runtimeType == double) prefs.setDouble(key, value);
    if (value.runtimeType == bool) prefs.setBool(key, value);
    if (value.runtimeType == String) prefs.setString(key, value);
  }

  dynamic getFromPrefs(String key) async {
    await initPrefs();
    return prefs.get(key);
  }
}