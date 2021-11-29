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
  settingsScreenDesktop() {}

  settingsScreenTablet() {}

  settingsScreenMobile() {}

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.settingsBackground,
        child: Container(
            constraints: BoxConstraints.expand(height: double.maxFinite),
            child: Responsive(
              desktop: settingsScreenDesktop(),
              tablet: settingsScreenTablet(),
              mobile: settingsScreenMobile(),
            )));
  }
}
