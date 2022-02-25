import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesBroad/contact.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/standards/userXStandards.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();

Widget settingsTitle(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: getDimension(
        context, false, Theme.of(context).visualDensity.settingsTitleWidth),
    child: Text(
      getTranslated(context, "settingsTitle"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.settingsMobileTitle,
        fontSize: Theme.of(context).textTheme.settingsTitle,
        fontWeight: Theme.of(context).typography.settingsTitle,
      ),
    ),
  );
}

Widget settingsProfile(BuildContext context, State state) {
  return firebaseAccounts.getSignedInStatus()
      ? Container(
          width: getDimension(context, false,
              Theme.of(context).visualDensity.settingsProfileWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 35.0),
                child: GestureDetector(
                  onTap: () {
                    showMediaSelection(context, state,
                        firebaseAccounts.setCurrentUserProfilePicImage);
                  },
                  child: Container(
                    height: getDimension(
                        context,
                        true,
                        Theme.of(context)
                            .visualDensity
                            .settingsProfileIconHeight),
                    width: getDimension(
                        context,
                        true,
                        Theme.of(context)
                            .visualDensity
                            .settingsProfileIconWidth),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context)
                          .colorScheme
                          .settingsMobileProfileBackground,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: profileURL.value,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => showProgress(context),
                      errorWidget: (context, url, error) => Icon(
                        Icons.person_outline_rounded,
                        size: 55,
                        color: Theme.of(context)
                            .colorScheme
                            .settingsMobileProfileIcon,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: getDimension(context, false,
                    Theme.of(context).visualDensity.settingsProfileInfoWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        firebaseAccounts.getCurrentUserDisplayName() ??
                            getTranslated(context, "settingsNullName"),
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .settingsMobileProfileName,
                          fontSize:
                              Theme.of(context).textTheme.settingsProfileName,
                          fontWeight:
                              Theme.of(context).typography.settingsProfileName,
                        ),
                      ),
                    ),
                    Text(
                      firebaseAccounts.getCurrentUserEmail() ??
                          getTranslated(context, "settingsNullEmail"),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .settingsMobileProfileEmail,
                        fontSize:
                            Theme.of(context).textTheme.settingsProfileEmail,
                        fontWeight:
                            Theme.of(context).typography.settingsProfileEmail,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      : Container();
}

Container settingsCard(BuildContext context, State state) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    height: getDimension(
        context, true, Theme.of(context).visualDensity.settingsCardHeight),
    width: getDimension(
        context, false, Theme.of(context).visualDensity.settingsCardWidth),
    child: DraggableScrollableSheet(
        initialChildSize: firebaseAccounts.getSignedInStatus()
            ? Theme.of(context).visualDensity.settingsSheetMinSize
            : Theme.of(context).visualDensity.settingsSheetSize,
        minChildSize: Theme.of(context).visualDensity.settingsSheetMinSize,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
                height: getDimension(
                    context,
                    true,
                    Theme.of(context)
                        .visualDensity
                        .settingsCardSheetContainerHeight),
                width: getDimension(
                    context,
                    false,
                    Theme.of(context)
                        .visualDensity
                        .settingsCardSheetContainerWidth),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  color: Theme.of(context).colorScheme.settingsMobileCard,
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
    if (setting.group == Group.settingGroupHidden) return;
    if (setting.isSignInRequired && !firebaseAccounts.getSignedInStatus())
      return;
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
  if (firebaseAccounts.getSignedInStatus() == true)
    column.children.add(settingsSignOut(context));
  return column;
}

Row settingsGroupTitle(BuildContext context, String key) {
  return Row(
    children: [
      Text(
        getTranslated(context, key),
        style: TextStyle(
          color: Theme.of(context).colorScheme.settingsMobileGroupTitle,
          fontSize: Theme.of(context).textTheme.settingsGroupTitle,
          fontWeight: Theme.of(context).typography.settingsGroupTitle,
        ),
      ),
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
            Text(getTranslated(context, setting.key),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.settingsMobileRowText,
                  fontSize: Theme.of(context).textTheme.settingsRowText,
                  fontWeight: Theme.of(context).typography.settingsRowText,
                )),
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
  );
}

void showHelpSupportBox(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Theme.of(context).colorScheme.settingsMobileBoxBackground,
          title: Text(getTranslated(context, "settingsHelpSupportBox"),
              style: TextStyle(
                color: Theme.of(context).colorScheme.settingsMobileBoxText,
                fontSize: Theme.of(context).textTheme.settingsBoxTextTitle,
                fontWeight: Theme.of(context).typography.settingsBoxTextTitle,
              )),
          content: Text(getContactEmail(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.settingsMobileBoxText,
                fontSize: Theme.of(context).textTheme.settingsBoxText,
                fontWeight: Theme.of(context).typography.settingsBoxText,
              )),
        );
      });
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

Widget settingsSignOut(BuildContext context) {
  return GestureDetector(
    onTap: () {
      firebaseAccounts.signOut();
      context.router.push(AuthScreen(isSignIn: true));
    },
    child: Text(
      getTranslated(context, "settingsSignOut"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.settingsMobileSignOut,
        fontSize: Theme.of(context).textTheme.settingsSignOut,
        fontWeight: Theme.of(context).typography.settingsSignOut,
      ),
    ),
  );
}
