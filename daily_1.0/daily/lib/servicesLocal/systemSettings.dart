import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily/datastructures/settingState.dart';

// #region Settings
Setting locale = new Setting(
    key: "locale",
    value: "en",
    type: Locale,
    format: Format.DropDown,
    defaultValue: "en");
Setting languageCode = new Setting(
    key: "languageCode",
    value: "en",
    type: String,
    format: Format.List,
    defaultValue: "en");
Setting isDark = new Setting(
    key: "isDark",
    value: false,
    type: bool,
    format: Format.Switch,
    defaultValue: false);
Setting isAndroid = new Setting(
    key: "isAndroid",
    value: true,
    type: bool,
    format: Format.Switch,
    defaultValue: true);
Setting profileURL = new Setting(
    key: "profileURL",
    value: "",
    type: String,
    format: Format.URL,
    defaultValue: "");

List<Setting> settingsList = [
  locale,
  languageCode,
  isDark,
  isAndroid,
  profileURL
];
// #endregion

SharedPreferences prefs;
prefsInstance() async {
  prefs ??= await SharedPreferences.getInstance();
}

void settingsToPrefs(List<Setting> settingsList) async {
  await prefsInstance();

  settingsList.forEach((setting) {
    saveToPrefs(setting.key, setting.value);
  });
}

void prefsToSettings() async {
  await prefsInstance();
  if (prefs.getKeys() == null) {
    settingsList.forEach((setting) {
      saveToPrefs(setting.key, setting.defaultValue);
    });
  }
  prefs.getKeys().forEach((key) {
    if (settingsList.contains(key))
      settingsList.where((element) => element.key == key).first.value =
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
    default:
      prefs.setString(key, value.toString());
  }
}
