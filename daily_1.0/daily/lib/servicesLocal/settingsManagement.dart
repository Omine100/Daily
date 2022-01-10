import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';

SharedPreferences prefs;
prefsInstance() async {
  prefs ??= await SharedPreferences.getInstance();
}

void settingsToPrefs(List<Setting> settingsList) async {
  await prefsInstance();
  settingsList.forEach((setting) {
    if (setting.value != null) saveToPrefs(setting.key, setting.value);
  });
}

Future<void> prefsToSettings() async {
  await prefsInstance();
  if (prefs.getKeys().length == 0) {
    settingsList.forEach((setting) {
      if (setting.defaultValue != null)
        saveToPrefs(setting.key, setting.defaultValue);
    });
  }
  prefs.getKeys().forEach((key) {
    settingsList.where((setting) => setting.key == key).first.value =
        prefs.get(key);
  });
}

saveToPrefs(String key, dynamic value) {
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
    case Locale:
      prefs.setString(key, value.languageCode + "_" + value.countryCode);
      break;
    default:
      prefs.setString(key, value.toString());
  }
}
