import 'package:daily/userInterface/homeSettings.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/homeMain.dart';
import 'package:daily/userInterface/homeSearch.dart';
import 'package:daily/userInterface/homeGlobal.dart';
import 'package:daily/userInterface/homeSettings.dart';

Widget homeBody(BuildContext context, State state) {
  switch (index) {
    case 0:
      return homeMainBody(context, state);
      break;
    case 3:
      return homeSettingsBody(context, state);
      break;
    default:
      return Container();
  }
}

int index = 0;
DotNavigationBar homeNavigationBar(BuildContext context, State state) {
  void indexChanged(int i) {
    state.setState(() {
      index = i;
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
    marginR: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
  );
}
