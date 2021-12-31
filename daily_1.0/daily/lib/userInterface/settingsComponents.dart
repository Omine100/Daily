import 'package:daily/servicesLocal/mediaManagement.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:flutter/material.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/userInterface/welcome.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();

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

Widget settingsProfile(BuildContext context, State state) {
  return firebaseAccounts.getSignedInStatus()
      ? Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () {
                  // Need to figure out how we want to get the image to save/display
                  MediaManagement().imagePicker(context, true, state);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firebaseAccounts.getCurrentUserDisplayName() ??
                        getTranslated(context, "settingsNullName"),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.settingsProfileName,
                      fontSize: Theme.of(context).textTheme.settingsProfileName,
                      fontWeight:
                          Theme.of(context).typography.settingsProfileName,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    firebaseAccounts.getCurrentUserEmail() ??
                        getTranslated(context, "settingsNullEmail"),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.settingsProfileEmail,
                      fontSize:
                          Theme.of(context).textTheme.settingsProfileEmail,
                      fontWeight:
                          Theme.of(context).typography.settingsProfileEmail,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      : Container();
}

Container settingsCard(BuildContext context, State state) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: DraggableScrollableSheet(
        initialChildSize: firebaseAccounts.getSignedInStatus() ? 0.875 : 1.0,
        minChildSize: 0.875,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
                height: 800,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  color: Theme.of(context).colorScheme.settingsCard,
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: settingsBreakdown(context, state))),
          );
        }),
  );
}

Column settingsBreakdown(BuildContext context, State state) {
  Map<Group, Column> settings = new Map<Group, Column>();

  settingsList.forEach((setting) {
    if (setting.group == Group.Hidden) return;
    if (setting.isSignInRequired && firebaseAccounts.getSignedInStatus())
      return;
    if (settings[setting.group] == null) {
      settings[setting.group] = new Column(
        children: [],
      );
      settings[setting.group].children.add(settingsGroupTitle(
          context, setting.group.toString().split("Group.").last));
    }
    settings[setting.group].children.add(settingRow(context, setting, state));
  });
  settings[Group.Account].children.add(settingsResetPassword(context));

  Column column = new Column(children: []);
  settings.entries.forEach((element) {
    column.children.add(element.value);
    column.children.add(SizedBox(
      height: 30,
    ));
  });
  column.children.add(settingsSignOut(context));
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

Row settingRow(BuildContext context, Setting setting, State state) {
  Widget formPick() {
    switch (setting.format) {
      case Format.Switch:
        return settingSwitch(context, setting, state);
        break;
      case Format.DropDown:
        return settingDropDown(context, setting, state);
        break;
      default:
        return Row();
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(setting.key,
          style: TextStyle(
            color: Theme.of(context).colorScheme.settingsRowText,
            fontSize: Theme.of(context).textTheme.settingsRowText,
            fontWeight: Theme.of(context).typography.settingsRowText,
          )),
      formPick(),
    ],
  );
}

Widget settingSwitch(BuildContext context, Setting setting, State state) {
  return Switch(
    value: setting.value,
    onChanged: (value) {
      state.setState(() {
        setting.value = value;
      });
    },
    activeColor: Theme.of(context).colorScheme.settingSwitchActiveThumb,
    activeTrackColor: Theme.of(context).colorScheme.settingSwtichActiveTrack,
    inactiveThumbColor:
        Theme.of(context).colorScheme.settingSwitchInactiveThumb,
    inactiveTrackColor:
        Theme.of(context).colorScheme.settingSwtichInactiveTrack,
  );
}

Widget settingDropDown(BuildContext context, Setting setting, State state) {
  return DropdownButton(
    items: setting.items,
    value: setting.value,
    onChanged: (value) {
      state.setState(() {
        setting.value = value;
        setLanguage(context, value);
      });
    },
  );
}

Widget settingsResetPassword(BuildContext context) {
  return GestureDetector(
    onTap: () {
      firebaseAccounts.sendPasswordReset(
          context, firebaseAccounts.getCurrentUserEmail());
      UserIStandards().showToastMessage(context, "settingsResetPasswordSent");
    },
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          getTranslated(context, "settingsResetPassword"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.settingsRowText,
            fontSize: Theme.of(context).textTheme.settingsRowText,
            fontWeight: Theme.of(context).typography.settingsRowText,
          ),
        ),
      ],
    ),
  );
}

Widget settingsSignOut(BuildContext context) {
  return GestureDetector(
    onTap: () {
      firebaseAccounts.signOut();
      RouteNavigation().routeBase(context, WelcomeScreen());
    },
    child: Text(
      getTranslated(context, "settingsSignOut"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.settingsSignOut,
        fontSize: Theme.of(context).textTheme.settingsSignOut,
        fontWeight: Theme.of(context).typography.settingsSignOut,
      ),
    ),
  );
}
