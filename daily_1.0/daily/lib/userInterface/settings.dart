import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/settingsComponents.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void dispose() {
    super.dispose();
    settingsToPrefs(settingsList);
  }

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
        child: settingsProfile(context, this),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsDesktopCardTop),
        child: settingsCard(context, this),
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
        child: settingsProfile(context, this),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsTabletCardTop),
        child: settingsCard(context, this),
      ),
    ]);
  }

  settingsScreenMobile() {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.settingsMobileTitleTop),
          child: settingsTitle(context)),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsMobileProfileTop),
        child: settingsProfile(context, this),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.settingsMobileCardTop),
        child: settingsCard(context, this),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(height: double.maxFinite),
            color: Theme.of(context).colorScheme.settingsBackground,
            child: Responsive(
              desktop: settingsScreenDesktop(),
              tablet: settingsScreenTablet(),
              mobile: settingsScreenMobile(),
            )),
      ),
    );
  }
}
