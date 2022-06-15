import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/base/alertsDropdown.dart';
import 'package:daily/userInterface/base/upload.dart';
import 'package:daily/userInterface/base/home/home.dart';
import 'package:daily/userInterface/base/search/search.dart';
import 'package:daily/userInterface/base/global/global.dart';
import 'package:daily/userInterface/base/settings/settings.dart';
import 'package:daily/userInterface/base/profile/profile.dart';
import 'package:daily/userInterface/base/sideMenu.dart';
import 'package:daily/userInterface/base/searchBar.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
int _pageIndex = 0;
PageController _pageController;
String uid;

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

Widget baseWebCardContainer(BuildContext context, State state, bool isSmall,
    GlobalKey<ScaffoldState> scaffoldKey) {
  List<Widget> pages = [
    homeBody(context, state, isSmall),
    globalBody(context, state, isSmall),
    settingsBody(context, state, isSmall),
    searchBody(context, state, isSmall),
    profileBody(context, state, isSmall, uid)
  ];

  return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.baseWebCardContainer,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isSmall ? 0 : 50),
              bottomLeft: _pageIndex == 4
                  ? Radius.circular(isSmall ? 0 : 50)
                  : Radius.circular(0))),
      child: Column(
        children: [
          baseWebHeader(context, state, isSmall, scaffoldKey),
          Container(
            height: MediaQuery.of(context).size.height - 75,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
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

Widget baseWebHeader(BuildContext context, State state, bool isSmall,
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
                child: _baseWebHeaderDrawer(context, scaffoldKey),
              )
            : SizedBox(
                width: 12.5,
              ),
        isSmall ? _baseWebHeaderTitle() : SizedBox(width: 12.5),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _baseWebHeaderSearchBar(context),
        ),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: _baseWebHeaderNotifications(context),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 16),
          child: _baseWebPostButton(context),
        )
      ],
    ),
  );
}

Widget _baseWebHeaderDrawer(
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

Widget _baseWebHeaderTitle() {
  return AdaptiveText(
    "Daily",
    style: TextStyle(
      color: Colors.grey,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget _baseWebHeaderSearchBar(BuildContext context) {
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

Widget _baseWebPostButton(BuildContext context) {
  return Tooltip(
    message: "Upload an image for the day",
    waitDuration: Duration(seconds: 1),
    child: Upload(),
  );
}

Widget _baseWebHeaderNotifications(BuildContext context) {
  return Tooltip(
    message: "Notifications",
    waitDuration: Duration(seconds: 1),
    child: AlertsDropdown(
      backgroundColor: Theme.of(context).colorScheme.baseBackground,
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

Widget baseWebDrawer(BuildContext context, State state) {
  return Drawer(
    child: SideMenu(),
  );
}
