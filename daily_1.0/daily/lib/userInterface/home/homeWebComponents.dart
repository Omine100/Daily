import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/userInterface/home/alertsDropdown.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        isSmall
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: _homeWebHeaderDrawer(context, scaffoldKey),
              )
            : SizedBox(
                width: 12.5,
              ),
        isSmall ? _homeWebHeaderTitle() : SizedBox(width: 12.5),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _homeWebHeaderSearchBar(context),
        ),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _homeWebHeaderNotifications(context),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 16),
          child: _homeWebPostButton(context),
        )
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
  return AdaptiveText(
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

Widget _homeWebPostButton(BuildContext context) {
  return Tooltip(
    message: "Upload an image for the day",
    waitDuration: Duration(seconds: 1),
    child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.authWebGetStarted,
            borderRadius: BorderRadius.circular(10)),
        child: Material(
            color: Theme.of(context).colorScheme.materialTransparent,
            child: InkWell(
                splashColor:
                    Theme.of(context).colorScheme.authWebGetStartedInkWell,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {},
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "Post",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )))),
  );
}

Widget _homeWebHeaderNotifications(BuildContext context) {
  return Tooltip(
    message: "Notifications",
    waitDuration: Duration(seconds: 1),
    child: AlertsDropdown(
      backgroundColor: Theme.of(context).colorScheme.homeBackground,
      iconColor: Colors.grey,
      icons: [
        Icon(Icons.person),
        Icon(Icons.settings),
        Icon(Icons.four_g_plus_mobiledata)
      ],
      onChange: (index) {
        print(index);
      },
    ),
  );
}

Widget homeWebDrawer(BuildContext context, State state) {
  return Drawer(
    child: SideMenu(),
  );
}
