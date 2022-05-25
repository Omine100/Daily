import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/base/home/home.dart';
import 'package:daily/userInterface/base/search/search.dart';
import 'package:daily/userInterface/base/global/global.dart';
import 'package:daily/userInterface/base/settings/settings.dart';

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

Widget baseMobileBody(BuildContext context, State state, bool isSmall) {
  List<Widget> pages = [
    homeBody(context, state, isSmall),
    searchBody(context, state, isSmall),
    globalBody(context, state, isSmall),
    settingsBody(context, state, isSmall)
  ];

  return PageView(
    children: pages,
    onPageChanged: (pageIndex) {
      _onPageChanged(state, pageIndex);
    },
    controller: _pageController,
  );
}

Widget baseMobileNavigationBar(BuildContext context, State state) {
  return DotNavigationBar(
    currentIndex: _pageIndex,
    backgroundColor: _pageIndex == 3
        ? Theme.of(context)
            .colorScheme
            .baseMobileNavigationBarBackgroundSettings
        : Theme.of(context).colorScheme.baseMobileNavigationBarBackground,
    dotIndicatorColor: Theme.of(context).colorScheme.baseMobileNavigationBarDot,
    duration: Duration(milliseconds: 1250),
    unselectedItemColor:
        Theme.of(context).colorScheme.baseMobileNavigationBarUnselectedIcon,
    selectedItemColor:
        Theme.of(context).colorScheme.baseMobileNavigationBarSelectedIcon,
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
