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
              BorderRadius.horizontal(left: Radius.circular(isSmall ? 0 : 50))),
      child: Column(
        children: [
          homeWebHeader(context, state, isSmall, scaffoldKey),
          Container(
            height: MediaQuery.of(context).size.height - 50,
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
    height: 50,
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        isSmall ? _homeWebHeaderDrawer(context, scaffoldKey) : Container(),
        isSmall ? _homeWebHeaderTitle() : Container(),
        _homeWebHeaderSearchBar(),
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

Widget _homeWebHeaderSearchBar() {
  return Container();
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
