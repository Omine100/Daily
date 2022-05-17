import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/home/main/homeMain.dart';
import 'package:daily/userInterface/home/search/homeSearch.dart';
import 'package:daily/userInterface/home/global/homeGlobal.dart';
import 'package:daily/userInterface/home/settings/homeSettings.dart';
import 'package:daily/userInterface/home/sideMenu.dart';
import 'package:daily/userInterface/home/searchBar.dart';

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

Widget homeWebCardContainer(BuildContext context, State state, bool isSmall,
    GlobalKey<ScaffoldState> scaffoldKey) {
  List<Widget> pages = [
    mainBody(context, state),
    globalBody(context),
    settingsBody(context, state),
    searchBody(context)
  ];

  return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.homeWebCardContainer,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(isSmall ? 0 : 50))),
      child: Column(
        children: [
          homeWebHeader(context, state, isSmall, scaffoldKey),
          Container(
            height: MediaQuery.of(context).size.height - 75,
            child: PageView(
              children: pages,
              onPageChanged: (pageIndex) {
                _onPageChanged(state, pageIndex);
              },
              controller: _pageController,
            ),
          )
        ],
      ));
}

Widget homeWebHeader(BuildContext context, State state, bool isSmall,
    GlobalKey<ScaffoldState> scaffoldKey) {
  return Container(
    height: 75,
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        isSmall
            ? _homeWebHeaderDrawer(context, scaffoldKey)
            : SizedBox(
                width: 12.5,
              ),
        isSmall ? _homeWebHeaderTitle() : SizedBox(width: 12.5),
        _homeWebHeaderSearchBar(context),
        Spacer(),
        _homeWebHeaderNotifications(),
      ],
    ),
  );
}

Widget _homeWebHeaderDrawer(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return IconButton(
    icon: Icon(
      Icons.menu,
      color: Colors.grey,
    ),
    iconSize: 25,
    onPressed: () {
      scaffoldKey.currentState?.openDrawer();
    },
  );
}

Widget _homeWebHeaderTitle() {
  return Text(
    "Daily",
    style: TextStyle(
      color: Colors.grey,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget _homeWebHeaderSearchBar(BuildContext context) {
  return SearchBar(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.5,
      borderRadius: 10,
      background: Colors.black38,
      foreground: Colors.grey,
      iconSize: 25,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      hint: "Search",
      onChanged: null);
}

Widget _homeWebHeaderNotifications() {
  return IconButton(
    icon: Icon(
      Icons.notifications,
      color: Colors.grey,
    ),
    iconSize: 25,
    onPressed: () {},
  );
}

Widget homeWebDrawer(BuildContext context, State state) {
  return Drawer(
    child: SideMenu(),
  );
}
