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
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          //Profile image change
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: Colors.red,
          ),
          child: profileURL.value == null
              ? Container()
              : Image(
                  image: AssetImage(profileURL.value),
                ),
        ),
      ),
      Column(
        children: [
          Text("DisplayName"), //DisplayName
          Text("Email"), //Email
        ],
      ),
    ],
  );
}

Widget settingsCard(BuildContext context) {
  return Container(
    height: 400,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      color: Colors.white,
    ),
    child: settingsBreakdown(context),
  );
}

Widget settingsBreakdown(BuildContext context) {
  settingsList.forEach((setting) {});
}

Widget settingsGroupTitle(BuildContext context, String key) {
  return Text(
    getTranslated(context, key),
    style: TextStyle(
      color: Theme.of(context).colorScheme.settingsGroupTitle,
      fontSize: Theme.of(context).textTheme.settingsGroupTitle,
      fontWeight: Theme.of(context).typography.settingsGroupTitle,
    ),
  );
}

Widget settingRow(BuildContext context, Setting setting) {
  Map<Format, dynamic> settingForm = {
    Format.Switch: settingSwitch(setting.value),
    //Format.DropDown: settingDropDown(value),
    //Format.List: settingList(value),
    //Format.URL: settingURL(value),
    //Format.DateSelector: settingDateSelector(value),
  };

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(setting.key),
      settingForm[setting.format],
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
