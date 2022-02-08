import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/themesLocal/colors.dart';

Widget homeTitle(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    child: Text(
      "Home",
      style: TextStyle(
          color: Theme.of(context).colorScheme.homeTitle,
          fontSize: 30,
          fontWeight: FontWeight.w300),
    ),
  );
}

Widget homeBody(BuildContext context) {
  return Container();
}

var _selectedTab = _SelectedTab.main;
enum _SelectedTab { main, favorite, search, person }
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
    duration: Duration(milliseconds: 1000),
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
        icon: Icon(Icons.cloud_circle_outlined),
      ),
      DotNavigationBarItem(
        icon: Icon(Icons.person),
      ),
    ],
  );
}
