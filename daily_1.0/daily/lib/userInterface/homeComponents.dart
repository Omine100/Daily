import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/homeMain.dart';
import 'package:daily/userInterface/homeSearch.dart';
import 'package:daily/userInterface/homeGlobal.dart';
import 'package:daily/userInterface/homeSettings.dart';

Widget homeBody(BuildContext context, State state) {
  switch (index) {
    case 0:
      return mainBody(context, state);
      break;
    case 1:
      return searchBody(context);
      break;
    case 3:
      return settingsBody(context, state);
      break;
    default:
      return Container();
  }
}

int index = 0;
Widget homeNavigationBar(BuildContext context, State state) {
  void indexChanged(int i) {
    state.setState(() {
      index = i;
      settingsToPrefs(settingsList);
    });
  }

  return DotNavigationBar(
    currentIndex: index,
    backgroundColor: index == 3
        ? Theme.of(context).colorScheme.homeNavigationBarBackgroundSettings
        : Theme.of(context).colorScheme.homeNavigationBarBackground,
    dotIndicatorColor: Theme.of(context).colorScheme.homeNavigationBarDot,
    duration: Duration(milliseconds: 1250),
    unselectedItemColor:
        Theme.of(context).colorScheme.homeNavigationBarUnselectedIcon,
    selectedItemColor:
        Theme.of(context).colorScheme.homeNavigationBarSelectedIcon,
    enableFloatingNavBar: true,
    curve: Curves.easeOutQuint,
    onTap: indexChanged,
    items: [
      DotNavigationBarItem(
        icon: Icon(Icons.camera_alt),
      ),
      DotNavigationBarItem(
        icon: Icon(Icons.search),
      ),
      DotNavigationBarItem(
        icon: Icon(Icons.favorite),
      ),
      DotNavigationBarItem(
        icon: Icon(Icons.settings),
      ),
    ],
    marginR: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
    paddingR: EdgeInsets.symmetric(vertical: 5),
  );
}
