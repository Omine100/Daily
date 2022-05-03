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
            onTap: () => Navigator.pushReplacementNamed(context, '/')),
        _createItem(
            context: context,
            icon: Icons.favorite,
            text: 'Favorites',
            onTap: () => Navigator.pushReplacementNamed(context, '/')),
        _createItem(
            context: context,
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => Navigator.pushReplacementNamed(context, '/')),
        Expanded(child: Container()),
        Column(
          children: <Widget>[
            _createItem(
                context: context,
                icon: Icons.help,
                text: 'Help',
                onTap: () => Navigator.pushReplacementNamed(context, '/')),
            _createItem(
                context: context,
                icon: Icons.exit_to_app,
                text: 'Logout',
                onTap: () => Navigator.pushReplacementNamed(context, '/'))
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

Widget homeWebNavigationBar(BuildContext context, State state) {
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
