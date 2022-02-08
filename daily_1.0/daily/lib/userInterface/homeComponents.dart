import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/homeMain.dart';
import 'package:daily/userInterface/homeSearch.dart';
import 'package:daily/userInterface/homeGlobal.dart';
import 'package:daily/userInterface/homeProfile.dart';

Widget homeBody(BuildContext context) {
  switch (_selectedTab) {
    case _SelectedTab.person:
      return homeProfileBody(context);
      break;
    default:
      return Container();
  }
}

var _selectedTab = _SelectedTab.main;
enum _SelectedTab { main, search, favorite, person }
DotNavigationBar homeNavigationBar(BuildContext context, State state) {
  void _handleIndexChanged(int i) {
    state.setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  return DotNavigationBar(
    currentIndex: _SelectedTab.values.indexOf(_selectedTab),
    backgroundColor: Theme.of(context).colorScheme.homeNavigationBarBackground,
    dotIndicatorColor: Theme.of(context).colorScheme.homeNavigationBarDot,
    duration: Duration(milliseconds: 1250),
    unselectedItemColor:
        Theme.of(context).colorScheme.homeNavigationBarUnselectedIcon,
    selectedItemColor:
        Theme.of(context).colorScheme.homeNavigationBarSelectedIcon,
    enableFloatingNavBar: true,
    onTap: _handleIndexChanged,
    items: [
      DotNavigationBarItem(
        icon: Icon(Icons.home),
      ),
      DotNavigationBarItem(
        icon: Icon(Icons.search),
      ),
      DotNavigationBarItem(
        icon: Icon(Icons.favorite),
      ),
      DotNavigationBarItem(
        icon: Icon(Icons.person),
      ),
    ],
  );
}
