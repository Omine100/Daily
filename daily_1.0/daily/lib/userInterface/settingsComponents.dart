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

Widget settingsProfile(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            //Profile image change
          },
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.grey.shade400,
            ),
            child: profileURL.value == ""
                ? Icon(
                    Icons.person_outline_rounded,
                    size: 45,
                    color: Colors.white,
                  )
                : Image(
                    image: AssetImage(profileURL.value),
                  ),
          ),
        ),
        SizedBox(
          width: 35,
        ),
        Column(
          children: [
            Text("DisplayName"),
            Text("Email"),
          ],
        ),
      ],
    ),
  );
}

Widget settingsCard(BuildContext context) {
  return Container(
      height: 800,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        color: Colors.white,
      ),
      child: Padding(
          padding: EdgeInsets.all(15), child: settingsBreakdown(context)));
}

Column settingsBreakdown(BuildContext context) {
  Map<Group, Column> settings = new Map<Group, Column>();

  settingsList.forEach((setting) {
    if (setting.group == Group.Hidden) return;
    if (settings[setting.group] == null) {
      settings[setting.group] = new Column(
        children: [],
      );
      settings[setting.group].children.add(settingsGroupTitle(
          context, setting.group.toString().split("Group.").last));
    }
    settings[setting.group].children.add(settingRow(context, setting));
  });

  Column column = new Column(children: []);
  settings.entries.forEach((element) {
    column.children.add(element.value);
  });
  return column;
}

Row settingsGroupTitle(BuildContext context, String key) {
  return Row(
    children: [
      Text(
        key,
        style: TextStyle(
          color: Theme.of(context).colorScheme.settingsGroupTitle,
          fontSize: Theme.of(context).textTheme.settingsGroupTitle,
          fontWeight: Theme.of(context).typography.settingsGroupTitle,
        ),
      )
    ],
  );
}

Row settingRow(BuildContext context, Setting setting) {
  Widget formPick() {
    switch (setting.format) {
      case Format.Switch:
        return settingSwitch(setting.value);
        break;
      default:
        return Row();
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(setting.key),
      formPick(),
    ],
  );
}

Widget settingSwitch(bool value) {
  return Switch(
    value: value,
    onChanged: (_value) => value,
    activeColor: Colors.red,
    activeTrackColor: Colors.red.shade300,
    inactiveThumbColor: Colors.blue,
    inactiveTrackColor: Colors.blue.shade300,
  );
}

Widget settingDropDown(dynamic value, List<dynamic> items) {
  return DropdownButton(
    items: items,
    value: value,
    onChanged: (_value) => value,
  );
}
