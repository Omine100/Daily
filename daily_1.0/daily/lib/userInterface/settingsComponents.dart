import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';

Widget settingsTitle(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: getDimension(
        context, false, Theme.of(context).visualDensity.settingsTitleWidth),
    child: Text(
      getTranslated(context, "settingsTitle"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.settingsTitle,
        fontSize: Theme.of(context).textTheme.settingsTitle,
        fontWeight: Theme.of(context).typography.settingsTitle,
      ),
    ),
  );
}

Widget settingsBreakdown(BuildContext context) {
  settingsList.forEach((setting) {
    if (setting.group == Group.General) print("Testing");
  });
}

Widget settingGroup(BuildContext context) {
  return Column(
    children: [],
  );
}

Widget settingGroupTitle(BuildContext context) {
  return Row(
    children: [
      Text(""),
    ],
  );
}

Widget settingRow(BuildContext context) {
  return Row(
    children: [],
  );
}

Widget settingGroup(BuildContext context) {}

Widget settingsProfile(BuildContext context) {}
