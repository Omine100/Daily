import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/home/main/homeMain.dart';
import 'package:daily/userInterface/home/search/homeSearch.dart';
import 'package:daily/userInterface/home/global/homeGlobal.dart';
import 'package:daily/userInterface/home/settings/homeSettings.dart';
import 'package:daily/userInterface/home/sideMenu.dart';

int _pageIndex = 0;
PageController _pageController;

void setupWebPageController() {
  _pageController = PageController(initialPage: _pageIndex);
}

void onWebResume(State state) {
  _onPageChanged(state, 0);
  onTabTapped(0);
}

void _onPageChanged(State state, int i) {
  state.setState(() {
    _pageIndex = i;
    settingsToPrefs(settingsList);
  });
}

void onTabTapped(int i) {
  _pageController.jumpToPage(i);
}

Widget homeWebCardContainer(BuildContext context, State state, bool isSmall) {
  List<Widget> pages = [
    mainBody(context, state),
    globalBody(context),
    settingsBody(context, state),
    searchBody(context)
  ];

  return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.homeWebCardContainer,
          borderRadius:
              BorderRadius.horizontal(left: Radius.circular(isSmall ? 0 : 50))),
      child: PageView(
        children: pages,
        onPageChanged: (pageIndex) {
          _onPageChanged(state, pageIndex);
        },
        controller: _pageController,
      ));
}

Widget homeWebAppBar(BuildContext context, State state) {
  return AppBar(
    title: Text("Daily"),
    backgroundColor: Theme.of(context).colorScheme.homeWebAppBarBackground,
    shadowColor: Theme.of(context).colorScheme.materialTransparent,
  );
}

Widget homeWebDrawer(BuildContext context, State state) {
  return Drawer(
    child: SideMenu(),
  );
}
