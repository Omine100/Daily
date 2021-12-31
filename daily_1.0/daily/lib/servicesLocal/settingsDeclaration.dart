import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';

Setting locale = new Setting(
    key: "settingLocale",
    value: null,
    group: Group.Account,
    format: Format.DropDown,
    isSignInRequired: false,
    defaultValue: Locale("en", "en"),
    items: getDropdownMenuList(),
    onChanged: setLanguage);
Setting notifications = new Setting(
    key: "settingNotifications",
    value: false,
    group: Group.General,
    format: Format.Switch,
    isSignInRequired: false,
    defaultValue: false);
Setting isDark = new Setting(
    key: "settingIsDark",
    value: false,
    group: Group.General,
    format: Format.Switch,
    isSignInRequired: false,
    defaultValue: false);
Setting isAndroid = new Setting(
    key: "settingIsAndroid",
    value: true,
    group: Group.Hidden,
    format: Format.Switch,
    isSignInRequired: false,
    defaultValue: true);
Setting profileURL = new Setting(
    key: "settingProfileURL",
    value: null,
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
