import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
          borderRadius: BorderRadius.horizontal(left: Radius.circular(50))),
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

Widget _createHeader(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          "lib/assets/launcher/icon_noBackground.png",
          height: 50,
        ),
      ),
      AdaptiveText(
        "Daily",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
      )
    ],
  );
}

Widget _createProfile(BuildContext context) {
  return _firebaseAccounts.getSignedInStatus()
      ? Container(
          width: getDimension(context, false,
              Theme.of(context).visualDensity.homeWebProfileWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getDimension(context, true,
                    Theme.of(context).visualDensity.homeWebProfileIconHeight),
                width: getDimension(context, true,
                    Theme.of(context).visualDensity.homeWebProfileIconWidth),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.homeWebProfileBackground,
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
                    color: Theme.of(context).colorScheme.homeWebProfileIcon,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                width: getDimension(context, false,
                    Theme.of(context).visualDensity.homeWebProfileInfoWidth),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        _firebaseAccounts.getCurrentUserDisplayName() ??
                            getTranslated(context, "settingsNullName"),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.homeWebProfileName,
                          fontSize:
                              Theme.of(context).textTheme.homeWebProfileName,
                          fontWeight:
                              Theme.of(context).typography.homeWebProfileName,
                        ),
                      ),
                    ),
                    Text(
                      _firebaseAccounts.getCurrentUserEmail() ??
                          getTranslated(context, "settingsNullEmail"),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.homeWebProfileEmail,
                        fontSize:
                            Theme.of(context).textTheme.homeWebProfileEmail,
                        fontWeight:
                            Theme.of(context).typography.homeWebProfileEmail,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      : Container();
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? 5 : 0),
      color: Theme.of(context).colorScheme.homeWebDrawerBackground,
      child: SafeArea(
          child: Column(children: [
        _createHeader(context),
        SizedBox(
          height: 5,
        ),
        _createProfile(context),
        Row(
          children: [
            Spacer(),
            if (!getIsLarge(context)) CloseButton(),
          ],
        ),
        SizedBox(height: 15),
        _createItem(
            context: context,
            icon: Icons.home,
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
            Container(
              width: MediaQuery.of(context).size.width / 6,
              child: Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.homeWebCardContainer,
              ),
            ),
            _createItem(
                context: context,
                icon: Icons.help,
                text: 'Help',
                onTap: () => {showHelpSupportBox(context)}),
            _createItem(
              context: context,
              icon: Icons.exit_to_app,
              text: 'Logout',
              onTap: () {
                _firebaseAccounts.signOut();
                context.router.replaceAll([AuthScreen()]);
              },
            )
          ],
        ),
      ])),
    );
  }
}

Widget _createItem(
    {BuildContext context,
    IconData icon,
    String text,
    GestureTapCallback onTap}) {
  return InkWell(
    child: ListTile(
        onTap: onTap,
        title: Row(children: <Widget>[
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
              ).showCursorOnHover),
        ])),
  );
}

void showHelpSupportBox(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Theme.of(context).colorScheme.settingsMobileBoxBackground,
          title: Text(getTranslated(context, "settingsHelpSupportBox"),
              style: TextStyle(
                color: Theme.of(context).colorScheme.settingsMobileBoxText,
                fontSize: Theme.of(context).textTheme.settingsBoxTextTitle,
                fontWeight: Theme.of(context).typography.settingsBoxTextTitle,
              )),
          content: Text(getContactEmail(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.settingsMobileBoxText,
                fontSize: Theme.of(context).textTheme.settingsBoxText,
                fontWeight: Theme.of(context).typography.settingsBoxText,
              )),
        );
      });
}
