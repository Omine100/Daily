import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';

Setting locale = new Setting(
    key: "locale",
    value: null,
    group: Group.Account,
    format: Format.DropDown,
    isSignInRequired: false,
    defaultValue: Locale("en", "en"),
    items: getDropdownMenuList(),
    onChanged: setLanguage);
Setting notifications = new Setting(
  key: "notification",
  value: false,
  group: Group.General,
  format: Format.Switch,
  isSignInRequired: false,
  defaultValue: false,
);
Setting isDark = new Setting(
    key: "isDark",
    value: false,
    group: Group.General,
    format: Format.Switch,
    isSignInRequired: false,
    defaultValue: false);
Setting isAndroid = new Setting(
    key: "isAndroid",
    value: true,
    group: Group.Hidden,
    format: Format.Switch,
    isSignInRequired: false,
    defaultValue: true);
Setting profileURL = new Setting(
    key: "profileURL",
    value: "",
    group: Group.Hidden,
    format: Format.NoUserInput,
    isSignInRequired: true,
    defaultValue: "");

List<Setting> settingsList = [
  locale,
  notifications,
  isDark,
  isAndroid,
  profileURL
];
