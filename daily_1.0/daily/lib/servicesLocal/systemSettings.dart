import 'package:flutter/material.dart';
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

void saveToPrefs(List<Setting> settingsList) {
  settingsList.forEach((setting) {});
}
