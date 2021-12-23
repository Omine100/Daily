import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily/datastructures/settingState.dart';

Setting locale = new Setting(
    key: "locale", value: "en", type: Locale, format: Format.DropDown);
Setting languageCode = new Setting(
    key: "languageCode", value: "en", type: String, format: Format.List);
Setting isDark =
    new Setting(key: "isDark", value: false, type: bool, format: Format.Switch);
Setting isAndroid = new Setting(
    key: "isAndroid", value: true, type: bool, format: Format.Switch);
Setting profileURL =
    new Setting(key: "profileURL", value: "", type: String, format: Format.URL);

List<Setting> settingsList() {
  return [locale, languageCode, isDark, isAndroid, profileURL];
}

SharedPreferences prefs;

prefsInstance() async {
  prefs ??= await SharedPreferences.getInstance();
}

void prefsToSettings() async {
  await prefsInstance();
  if (prefs.getKeys() == null) {
    initializePrefs();
  }
  prefs.getKeys().forEach((key) {
    switch (prefs.get(key)) {
      case "locale":
        locale.value = prefs.get(key);
        break;
      case "languageCode":
        languageCode.value = prefs.get(key);
        break;
      case "isDark":
        isDark.value = prefs.get(key);
        break;
      case "isAndroid":
        isAndroid.value = prefs.get(key);
        break;
      case "profileURL":
        profileURL.value = prefs.get(key);
        break;
      default:
        return;
    }
  });
}

void settingsToPrefs(List<Setting> settingsList) {
  settingsList.forEach((setting) {
    saveToPrefs(setting.key, setting.value);
  });
}

saveToPrefs(String key, dynamic value) async {
  await prefsInstance();
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

initializePrefs() {
  saveToPrefs("locale", "en");
  saveToPrefs("languageCode", "en");
  saveToPrefs("isDark", false);
  saveToPrefs("isAndroid", true);
  saveToPrefs("profileURL", "");
}
