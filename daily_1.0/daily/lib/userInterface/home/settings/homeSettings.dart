import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/home/settings/homeSettingsWebComponents.dart';
import 'package:daily/userInterface/home/settings/homeSettingsMobileComponents.dart';

_settingsSmall(BuildContext context, State state) {
  return Adaptive(
      iOS: _settingsMobileSmall(context, state, false),
      android: _settingsMobileSmall(context, state, true),
      web: _settingsWebSmall(context, state));
}

_settingsLarge(BuildContext context, State state) {
  return Adaptive(
      iOS: _settingsMobileLarge(context, state, false),
      android: _settingsMobileLarge(context, state, true),
      web: _settingsWebLarge(context, state));
}

_settingsWebSmall(BuildContext context, State state) {
  return Stack(alignment: Alignment.center, children: [
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsMobileCardTop),
      child: settingsWebCard(context, state),
    ),
  ]);
}

_settingsWebLarge(BuildContext context, State state) {
  return Stack(alignment: Alignment.center, children: [
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsMobileCardTop),
      child: settingsWebCard(context, state),
    ),
  ]);
}

_settingsMobileSmall(BuildContext context, State state, bool isAndroid) {
  return Stack(alignment: Alignment.center, children: [
    Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsMobileTitleTop),
        child: settingsTitle(context)),
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsMobileProfileTop),
      child: settingsProfile(context, state),
    ),
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsMobileCardTop),
      child: settingsCard(context, state),
    ),
  ]);
}

_settingsMobileLarge(BuildContext context, State state, bool isAndroid) {
  return Stack(alignment: Alignment.center, children: [
    Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsMobileTitleTop),
        child: settingsTitle(context)),
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsMobileProfileTop),
      child: settingsProfile(context, state),
    ),
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsMobileCardTop),
      child: settingsCard(context, state),
    ),
  ]);
}

Widget settingsBody(BuildContext context, State state) {
  return Container(
      constraints: BoxConstraints.expand(height: double.maxFinite),
      color: Theme.of(context).colorScheme.settingsBackground,
      child: Responsive(
        small: _settingsSmall(context, state),
        large: _settingsLarge(context, state),
      ));
}
