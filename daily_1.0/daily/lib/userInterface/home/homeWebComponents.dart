import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesBroad/contact.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/standards/userXStandards.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';
import 'package:daily/userInterface/home/main/homeMain.dart';
import 'package:daily/userInterface/home/search/homeSearch.dart';
import 'package:daily/userInterface/home/global/homeGlobal.dart';
import 'package:daily/userInterface/home/settings/homeSettings.dart';
import 'package:daily/userInterface/home/sideMenu.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
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
    settingsBody(context, state)
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
