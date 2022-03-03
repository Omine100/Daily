import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/home/settings/homeSettingsWebComponents.dart';
import 'package:daily/userInterface/home/settings/homeSettingsMobileComponents.dart';

settingsSmall(BuildContext context, State state) {
  return Adaptive(
      iOS: settingsMobileSmall(context, state, false),
      android: settingsMobileSmall(context, state, true),
      web: settingsWebSmall(context, state));
}

settingsLarge(BuildContext context, State state) {
  return Adaptive(
      iOS: settingsMobileLarge(context, state, false),
      android: settingsMobileLarge(context, state, true),
      web: settingsWebLarge(context, state));
}

settingsWebSmall(BuildContext context, State state) {
  return Stack(alignment: Alignment.center, children: [
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsMobileTitleTop),
      child: settingsTitle(context),
    ),
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

settingsWebLarge(BuildContext context, State state) {
  return Stack(alignment: Alignment.center, children: [
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsMobileTitleTop),
      child: settingsTitle(context),
    ),
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

settingsMobileSmall(BuildContext context, State state, bool isAndroid) {
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

settingsMobileLarge(BuildContext context, State state, bool isAndroid) {
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
        small: settingsSmall(context, state),
        large: settingsLarge(context, state),
      ));
}
