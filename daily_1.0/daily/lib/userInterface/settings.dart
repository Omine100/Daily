import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/settingsComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  settingsScreenDesktop() {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsDesktopTitleTop),
        child: settingsTitle(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsDesktopProfileTop),
        child: settingsProfile(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsDesktopCardTop),
        child: settingsCard(context),
      ),
    ]);
  }

  settingsScreenTablet() {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsTabletTitleTop),
        child: settingsTitle(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsTabletProfileTop),
        child: settingsProfile(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsTabletCardTop),
        child: settingsCard(context),
      ),
    ]);
  }

  settingsScreenMobile() {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsMobileTitleTop),
        child: settingsTitle(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsMobileProfileTop),
        child: settingsProfile(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsMobileCardTop),
        child: settingsCard(context),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.settingsBackground,
        child: Container(
            constraints: BoxConstraints.expand(
              height: double.maxFinite,
            ),
            child: Responsive(
              desktop: settingsScreenDesktop(),
              tablet: settingsScreenTablet(),
              mobile: settingsScreenMobile(),
            )));
  }
}
