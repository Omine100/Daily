import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/home/main/homeMain.dart';
import 'package:daily/userInterface/home/search/homeSearch.dart';
import 'package:daily/userInterface/home/global/homeGlobal.dart';
import 'package:daily/userInterface/home/settings/homeSettings.dart';

int pageIndex = 0;
PageController pageController;

void setupPageController() {
  pageController = PageController(initialPage: pageIndex);
}

void onResume(State state) {
  onPageChanged(state, 0);
  onTabTapped(0);
}

void onPageChanged(State state, int i) {
  state.setState(() {
    pageIndex = i;
    settingsToPrefs(settingsList);
  });
}

void onTabTapped(int i) {
  pageController.animateToPage(i,
      duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuint);
}

Widget homeBody(BuildContext context, State state) {
  List<Widget> pages = [
    mainBody(context, state),
    searchBody(context),
    globalBody(context),
    settingsBody(context, state)
  ];

  return PageView(
    children: pages,
    onPageChanged: (pageIndex) {
      onPageChanged(state, pageIndex);
    },
    controller: pageController,
  );
}

Widget homeNavigationBar(BuildContext context, State state) {
  return DotNavigationBar(
    currentIndex: pageIndex,
    backgroundColor: pageIndex == 3
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
    onTap: (pageIndex) {
      onTabTapped(pageIndex);
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
