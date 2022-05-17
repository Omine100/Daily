import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';

SharedPreferences? _prefs;
_prefsInstance() async {
  _prefs ??= await SharedPreferences.getInstance();
}

void settingsToPrefs(List<Setting> settingsList) async {
  await _prefsInstance();
  settingsList.forEach((setting) {
    if (setting.value != null) _saveToPrefs(setting.key, setting.value);
  });
}

Future<void> prefsToSettings() async {
  await _prefsInstance();
  if (_prefs?.getKeys().length == 0) {
    settingsList.forEach((setting) {
      if (setting.defaultValue != null)
        _saveToPrefs(setting.key, setting.defaultValue);
    });
  }
  try {
    _prefs?.getKeys().forEach((key) {
      settingsList.where((setting) => setting.key == key).first.value =
          _prefs?.get(key);
    });
  } catch (e) {}
}

_saveToPrefs(String key, dynamic value) {
  switch (value.runtimeType) {
    case int:
      _prefs?.setInt(key, value);
      break;
    case double:
      _prefs?.setDouble(key, value);
      break;
    case bool:
      _prefs?.setBool(key, value);
      break;
    case String:
      _prefs?.setString(key, value);
      break;
    case Locale:
      _prefs?.setString(key, value.languageCode + "_" + value.countryCode);
      break;
    default:
      _prefs?.setString(key, value.toString());
  }
}
