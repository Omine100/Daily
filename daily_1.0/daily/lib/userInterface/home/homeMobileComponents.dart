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

void setupMobilePageController() {
  _pageController = PageController(initialPage: _pageIndex);
}

void onMobileResume(State state) {
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

Widget homeMobileBody(BuildContext context, State state) {
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

Widget homeMobileNavigationBar(BuildContext context, State state) {
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
