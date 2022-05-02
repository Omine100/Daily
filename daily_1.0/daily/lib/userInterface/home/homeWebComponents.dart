import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/home/main/homeMain.dart';
import 'package:daily/userInterface/home/search/homeSearch.dart';
import 'package:daily/userInterface/home/global/homeGlobal.dart';
import 'package:daily/userInterface/home/settings/homeSettings.dart';

int _pageIndex = 0;
PageController _pageController;

void setupWebPageController() {
  _pageController = PageController(initialPage: _pageIndex);
}

void onWebResume(State state) {
  _onPageChanged(state, 0);
  _onTabTapped(0);
}

void _onPageChanged(State state, int i) {
  state.setState(() {
    _pageIndex = i;
    settingsToPrefs(settingsList);
  });
}

void _onTabTapped(int i) {
  _pageController.animateToPage(i,
      duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuint);
}

Widget homeWebBody(BuildContext context, State state) {
  List<Widget> pages = [
    mainBody(context, state),
    searchBody(context),
    globalBody(context),
    settingsBody(context, state)
  ];

  return PageView(
    children: pages,
    onPageChanged: (pageIndex) {
      _onPageChanged(state, pageIndex);
    },
    controller: _pageController,
  );
}

Widget homeWebAppBar(BuildContext context, State state) {
  return AppBar(
    title: Text("Daily"),
    backgroundColor: Theme.of(context).colorScheme.homeWebAppBarBackground,
  );
}

Widget homeWebDrawer(BuildContext context, State state) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

Widget homeWebNavigationBar(BuildContext context, State state) {
  return DotNavigationBar(
    currentIndex: _pageIndex,
    backgroundColor: _pageIndex == 3
        ? Theme.of(context)
            .colorScheme
            .homeMobileNavigationBarBackgroundSettings
        : Theme.of(context).colorScheme.homeMobileNavigationBarBackground,
    dotIndicatorColor: Theme.of(context).colorScheme.homeMobileNavigationBarDot,
    duration: Duration(milliseconds: 1250),
    unselectedItemColor:
        Theme.of(context).colorScheme.homeMobileNavigationBarUnselectedIcon,
    selectedItemColor:
        Theme.of(context).colorScheme.homeMobileNavigationBarSelectedIcon,
    enableFloatingNavBar: true,
    curve: Curves.easeOutQuint,
    onTap: (pageIndex) {
      _onTabTapped(pageIndex);
    },
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
