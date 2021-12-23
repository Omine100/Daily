import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';

Setting locale = new Setting(
    key: "locale",
    value: "en",
    type: Locale,
    group: Group.Hidden,
    format: Format.DropDown,
    defaultValue: "en");
Setting languageCode = new Setting(
    key: "languageCode",
    value: "en",
    type: String,
    group: Group.General,
    format: Format.List,
    defaultValue: "en");
Setting isDark = new Setting(
    key: "isDark",
    value: false,
    type: bool,
    group: Group.General,
    format: Format.Switch,
    defaultValue: false);
Setting isAndroid = new Setting(
    key: "isAndroid",
    value: true,
    type: bool,
    group: Group.Hidden,
    format: Format.Switch,
    defaultValue: true);
Setting profileURL = new Setting(
    key: "profileURL",
    value: "",
    type: String,
    group: Group.User,
    format: Format.URL,
    defaultValue: "");

List<Setting> settingsList = [
  locale,
  languageCode,
  isDark,
  isAndroid,
  profileURL
];
