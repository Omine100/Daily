import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
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
  _pageController.animateToPage(i,
      duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuint);
}

Widget homeWebBody(BuildContext context, State state, bool isSmall) {
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
    shadowColor: Theme.of(context).colorScheme.materialTransparent,
  );
}

Widget homeWebDrawer(BuildContext context, State state) {
  return Drawer(
    child: SideMenu(),
  );
}

Widget _createProfileHeader({BuildContext context}) {
  return _firebaseAccounts.getSignedInStatus()
      ? Container(
          width: getDimension(context, false,
              Theme.of(context).visualDensity.homeWebProfileWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                child: Container(
                  height: getDimension(context, true,
                      Theme.of(context).visualDensity.homeWebProfileIconHeight),
                  width: getDimension(context, true,
                      Theme.of(context).visualDensity.homeWebProfileIconWidth),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        Theme.of(context).colorScheme.homeWebProfileBackground,
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
              ),
              Container(
                width: getDimension(context, false,
                    Theme.of(context).visualDensity.homeWebProfileInfoWidth),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              _createProfileHeader(context: context),
              Row(
                children: [
                  Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!getIsLarge(context)) CloseButton(),
                ],
              ),
              SizedBox(height: 5),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.grey,
                onPressed: () {},
                icon: Icon(Icons.edit, size: 16),
                label: Text(
                  "New message",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 5),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.blue,
                onPressed: () {},
                icon: Icon(Icons.download, size: 16),
                label: Text(
                  "Get messages",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              // Menu Items
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: "assets/Icons/Inbox.svg",
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: "assets/Icons/Send.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: "assets/Icons/File.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key key,
    this.isActive,
    this.isHover = false,
    this.itemCount,
    this.showBorder = true,
    @required this.iconSrc,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final bool isActive, isHover, showBorder;
  final int itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover)
                ? Icon(
                    Icons.arrow_right,
                    size: 15,
                  )
                : SizedBox(width: 15),
            SizedBox(width: 1.2),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 20,
                      color: (isActive || isHover) ? Colors.grey : Colors.blue,
                    ),
                    SizedBox(width: 3.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: (isActive || isHover)
                                ? Colors.white
                                : Colors.blue,
                          ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
