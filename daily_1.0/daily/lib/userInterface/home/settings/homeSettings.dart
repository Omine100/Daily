import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/homeSettingsComponents.dart';

settingsWeb(BuildContext context, State state) {
  return Stack(alignment: Alignment.center, children: [
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsDesktopTitleTop),
      child: settingsTitle(context),
    ),
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsDesktopProfileTop),
      child: settingsProfile(context, state),
    ),
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsDesktopCardTop),
      child: settingsCard(context, state),
    ),
  ]);
}

settingsTablet(BuildContext context, State state) {
  return Stack(alignment: Alignment.center, children: [
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsTabletTitleTop),
      child: settingsTitle(context),
    ),
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsTabletProfileTop),
      child: settingsProfile(context, state),
    ),
    Positioned(
      top: getPosition(context, true,
          Theme.of(context).materialTapTargetSize.settingsTabletCardTop),
      child: settingsCard(context, state),
    ),
  ]);
}

settingsMobile(BuildContext context, State state) {
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
        web: settingsWeb(context, state),
        tablet: settingsTablet(context, state),
        mobile: settingsMobile(context, state),
      ));
}
