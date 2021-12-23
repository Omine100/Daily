import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//VARIABLE INITIALIZATION
SharedPreferences prefs;
Locale locale;

enum Format { DropDown, List, Switch, DateSelector }

class Setting {
  String name;
  dynamic value;
  dynamic type;
  Format format;

  Setting(
      {@required this.name,
      @required this.value,
      @required this.type,
      @required this.format});
}

//Need to do getTranslated for the names
Setting languageCode = new Setting(
    name: "languageCode", value: "en", type: String, format: Format.List);
Setting isDark = new Setting(
    name: "isDark", value: false, type: bool, format: Format.Switch);
Setting isAndroid = new Setting(
    name: "isAndroid", value: true, type: bool, format: Format.Switch);

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
