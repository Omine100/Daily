import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/homeSettingsComponents.dart';

settingsScreenDesktop(BuildContext context, State state) {
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

settingsScreenTablet(BuildContext context, State state) {
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

settingsScreenMobile(BuildContext context, State state) {
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

Widget homeSettingsBody(BuildContext context, State state) {
  return Container(
      constraints: BoxConstraints.expand(height: double.maxFinite),
      color: Theme.of(context).colorScheme.settingsBackground,
      child: Responsive(
        desktop: settingsScreenDesktop(context, state),
        tablet: settingsScreenTablet(context, state),
        mobile: settingsScreenMobile(context, state),
      ));
}
