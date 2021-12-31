import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';

Setting locale = new Setting(
    key: "locale",
    value: null,
    type: Locale,
    group: Group.Hidden,
    format: Format.DropDown,
    isSignInRequired: false,
    defaultValue: Locale("en", "en"));
Setting languageCode = new Setting(
    key: "languageCode",
    value: null,
    type: String,
    group: Group.Account,
    format: Format.DropDown,
    isSignInRequired: false,
    defaultValue: "en",
    items: getDropdownMenuList());
Setting notifications = new Setting(
  key: "notification",
  value: false,
  type: bool,
  group: Group.General,
  format: Format.Switch,
  isSignInRequired: false,
  defaultValue: false,
);
Setting isDark = new Setting(
    key: "isDark",
    value: false,
    type: bool,
    group: Group.General,
    format: Format.Switch,
    isSignInRequired: false,
    defaultValue: false);
Setting isAndroid = new Setting(
    key: "isAndroid",
    value: true,
    type: bool,
    group: Group.Hidden,
    format: Format.Switch,
    isSignInRequired: false,
    defaultValue: true);
Setting profileURL = new Setting(
    key: "profileURL",
    value: "",
    type: String,
    group: Group.Hidden,
    format: Format.URL,
    isSignInRequired: true,
    defaultValue: "");

List<Setting> settingsList = [
  locale,
  languageCode,
  notifications,
  isDark,
  isAndroid,
  profileURL
];
