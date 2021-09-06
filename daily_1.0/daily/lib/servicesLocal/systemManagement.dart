import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemManagement extends ChangeNotifier {
  SharedPreferences prefs;

  _initPrefs() async {
    if (prefs == null)
      prefs = await SharedPreferences.getInstance();
  }

  Future<String> _loadStringFromPrefs(String pref) async {
    await _initPrefs();
    return prefs.getString(pref);
  }

  Future<bool> _loadBoolFromPrefs(bool pref) async {
    await _initPrefs();
    return prefs.getBool(pref);
  }
}