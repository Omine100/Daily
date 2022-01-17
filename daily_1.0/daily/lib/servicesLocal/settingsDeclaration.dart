import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();

Setting resetPassword = new Setting(
    key: "settingResetPassword",
    group: Group.settingGroupAccount,
    format: Format.Click,
    isSignInRequired: true,
    onClicked: firebaseAccounts.sendPasswordReset,
    call: firebaseAccounts.getCurrentUserEmail);
Setting locale = new Setting(
    key: "settingLocale",
    group: Group.settingGroupGeneral,
    format: Format.DropDown,
    isSignInRequired: false,
    value: null,
    defaultValue: Locale("en", "en"),
    items: getLocaleDropdownMenuList,
    onChanged: setLanguage);
Setting notifications = new Setting(
    key: "settingNotifications",
    group: Group.settingGroupGeneral,
    format: Format.Switch,
    isSignInRequired: false,
    value: false,
    defaultValue: false);
Setting theme = new Setting(
    key: "settingTheme",
    group: Group.settingGroupGeneral,
    format: Format.DropDown,
    isSignInRequired: false,
    value: null,
    defaultValue: "settingThemeDefault",
    items: getThemeDropdownMenuList,
    onChanged: setTheme);
Setting isDark = new Setting(
    key: "settingIsDark",
    group: Group.settingGroupHidden,
    format: Format.NoUserInput,
    isSignInRequired: false,
    value: false,
    defaultValue: false);
Setting profileURL = new Setting(
    key: "settingProfileURL",
    group: Group.settingGroupHidden,
    format: Format.NoUserInput,
    isSignInRequired: true,
    value: null,
    defaultValue: "");
Setting privacyPolicy = new Setting(
    key: "settingPrivacyPolicy",
    group: Group.settingGroupLegal,
    format: Format.Click,
    isSignInRequired: true,
    onClicked: null);
Setting userAgreementPolicy = new Setting(
    key: "settingUserAgreementPolicy",
    group: Group.settingGroupLegal,
    format: Format.Click,
    isSignInRequired: true,
    onClicked: null);

List<Setting> settingsList = [
  resetPassword,
  locale,
  notifications,
  theme,
  isDark,
  profileURL,
  privacyPolicy,
  userAgreementPolicy,
];
