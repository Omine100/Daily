import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';

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
