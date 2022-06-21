import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/themesLocal/dimensions.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

Widget settingsWebCard(BuildContext context, State state, bool isSmall) {
  return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: settingsBreakdown(context, state));
}

Column settingsBreakdown(BuildContext context, State state) {
  Map<Group, Column> settings = new Map<Group, Column>();

  settingsList.forEach((setting) {
    if (setting.group == Group.settingGroupHidden) return;
    if (setting.isSignInRequired && !_firebaseAccounts.getSignedInStatus())
      return;
    if (setting.isMobile && kIsWeb) return;
    if (settings[setting.group] == null) {
      settings[setting.group] = new Column(children: []);
      settings[setting.group].children.add(settingsGroupTitle(
          context, setting.group.toString().split("Group.").last));
    }
    settings[setting.group].children.add(settingRow(context, setting, state));
  });

  Column column = new Column(children: []);
  settings.entries.forEach((element) {
    column.children.add(Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: element.value,
    ));
  });
  return column;
}

Row settingsGroupTitle(BuildContext context, String key) {
  return Row(
    children: [
      AdaptiveText(getTranslated(context, key),
          style: Theme.of(context).textTheme.headline1),
    ],
  );
}

Row settingRow(BuildContext context, Setting setting, State state) {
  Widget formPick() {
    switch (setting.format) {
      case Format.Switch:
        return settingSwitch(context, setting, state);
        break;
      case Format.DropDown:
        return settingDropdown(context, setting, state);
        break;
      case Format.Click:
        return settingClick(context, setting, state);
        break;
      default:
        return Row();
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: setting.format == Format.Click
        ? [settingClick(context, setting, state)]
        : [
            AdaptiveText(getTranslated(context, setting.key),
                style: Theme.of(context).textTheme.bodyText1),
            formPick()
          ],
  );
}

Widget settingSwitch(BuildContext context, Setting setting, State state) {
  return Switch(
    value: setting.value,
    onChanged: (value) {
      state.setState(() {
        setting.value = value;
        if (setting.onChanged != null)
          setting.onChanged.call(context, setting.value);
      });
    },
    activeColor: Theme.of(context).colorScheme.settingsMobileSwitchActiveThumb,
    activeTrackColor:
        Theme.of(context).colorScheme.settingsMobileSwitchActiveTrack,
    inactiveThumbColor:
        Theme.of(context).colorScheme.settingsMobileSwitchInactiveThumb,
    inactiveTrackColor:
        Theme.of(context).colorScheme.settingsMobileSwitchInactiveTrack,
  );
}

Widget settingDropdown(BuildContext context, Setting setting, State state) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
        alignment: Alignment.centerRight,
        isExpanded: false,
        isDense: true,
        menuMaxHeight: getDimension(context, true,
            Theme.of(context).visualDensity.settingDropdownHeight),
        items: setting.items(context),
        value: setting.value,
        style: TextStyle(
            color: Theme.of(context).colorScheme.settingsMobileDropdownText,
            fontSize: Theme.of(context).textTheme.settingDropdownText),
        dropdownColor:
            Theme.of(context).colorScheme.settingsMobileDropdownBackground,
        onChanged: (value) {
          state.setState(() {
            setting.value = value;
            if (setting.onChanged != null) {
              if (setting.call != null)
                setting.onChanged.call(context, setting.call.call());
              else
                setting.onChanged.call(context);
            }
          });
        },
      ),
    ),
  );
}

Widget settingClick(BuildContext context, Setting setting, State state) {
  return Padding(
    padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
    child: GestureDetector(
      onTap: () {
        if (setting.call != null)
          setting.onClicked.call(context, setting.call.call());
        else
          setting.onClicked.call(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(getTranslated(context, setting.key),
            style: TextStyle(
              color: Theme.of(context).colorScheme.settingsMobileRowText,
              fontSize: Theme.of(context).textTheme.settingsRowText,
              fontWeight: Theme.of(context).typography.settingsRowText,
            )),
      ),
    ),
  ).showClickOnHover;
}

void showAboutBox(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData(
          dialogBackgroundColor:
              Theme.of(context).colorScheme.settingsMobileBoxBackground,
          textTheme: TextTheme(
              headline5: TextStyle(
                  color: Theme.of(context).colorScheme.settingsMobileBoxText),
              bodyText2: TextStyle(
                  color: Theme.of(context).colorScheme.settingsMobileBoxText),
              caption: TextStyle(
                  color: Theme.of(context).colorScheme.settingsMobileBoxText)),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                primary: Theme.of(context).colorScheme.settingsMobileBoxText),
          ),
        ),
        child: AboutDialog(
          applicationIcon: Image.asset(
            "lib/assets/launcher/icon_noBackground.png",
            height: 75,
          ),
          applicationName: getTranslated(context, "settingsAboutBoxName"),
          applicationVersion: getTranslated(context, "settingsAboutBoxVersion"),
          applicationLegalese:
              getTranslated(context, "settingsAboutBoxLegalese"),
        ),
      );
    },
  );
}
