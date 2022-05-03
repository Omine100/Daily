import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
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

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
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
    backgroundColor: Theme.of(context).colorScheme.homeWebAppBarBackground,
    child: Column(
      children: <Widget>[
        _createHeader(context: context, state: state),
        _createItem(
            context: context,
            icon: Icons.home_outlined,
            text: 'Home',
            onTap: () => {_onTabTapped(0)}),
        _createItem(
            context: context,
            icon: Icons.favorite,
            text: 'Favorites',
            onTap: () => {_onTabTapped(1)}),
        _createItem(
            context: context,
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => {_onTabTapped(2)}),
        Expanded(child: Container()),
        Column(
          children: <Widget>[
            _createItem(
                context: context,
                icon: Icons.help,
                text: 'Help',
                onTap: () => {_onTabTapped(0)}),
            _createItem(
                context: context,
                icon: Icons.exit_to_app,
                text: 'Logout',
                onTap: () => {_firebaseAccounts.signOut()})
          ],
        ),
      ],
    ),
  );
}

Widget _createHeader({BuildContext context, State state}) {
  return DrawerHeader(
    child: _firebaseAccounts.getSignedInStatus()
        ? Container(
            width: getDimension(context, false,
                Theme.of(context).visualDensity.settingsProfileWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 35.0),
                  child: GestureDetector(
                    onTap: () {
                      showMediaSelection(context, state,
                          _firebaseAccounts.setCurrentUserProfilePicImage);
                    },
                    child: Container(
                      height: getDimension(
                          context,
                          true,
                          Theme.of(context)
                              .visualDensity
                              .settingsProfileIconHeight),
                      width: getDimension(
                          context,
                          true,
                          Theme.of(context)
                              .visualDensity
                              .settingsProfileIconWidth),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context)
                            .colorScheme
                            .settingsMobileProfileBackground,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: profileURL.value,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) => showProgress(context),
                        errorWidget: (context, url, error) => Icon(
                          Icons.person_outline_rounded,
                          size: 55,
                          color: Theme.of(context)
                              .colorScheme
                              .settingsMobileProfileIcon,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: getDimension(context, false,
                      Theme.of(context).visualDensity.settingsProfileInfoWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          _firebaseAccounts.getCurrentUserDisplayName() ??
                              getTranslated(context, "settingsNullName"),
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .settingsMobileProfileName,
                            fontSize:
                                Theme.of(context).textTheme.settingsProfileName,
                            fontWeight: Theme.of(context)
                                .typography
                                .settingsProfileName,
                          ),
                        ),
                      ),
                      Text(
                        _firebaseAccounts.getCurrentUserEmail() ??
                            getTranslated(context, "settingsNullEmail"),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .settingsMobileProfileEmail,
                          fontSize:
                              Theme.of(context).textTheme.settingsProfileEmail,
                          fontWeight:
                              Theme.of(context).typography.settingsProfileEmail,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container(),
  );
}

Widget _createItem(
    {BuildContext context,
    IconData icon,
    String text,
    GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon, color: Theme.of(context).colorScheme.homeWebDrawerItem),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.homeWebDrawerItem,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
