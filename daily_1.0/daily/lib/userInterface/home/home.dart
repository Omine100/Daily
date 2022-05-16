import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/cameraManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/constraints.dart';
import 'package:daily/userInterface/home/homeWebComponents.dart';
import 'package:daily/userInterface/home/homeMobileComponents.dart';
import 'package:daily/userInterface/home/sideMenu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (kIsWeb)
      setupWebPageController();
    else
      setupMobilePageController();
    setupCamera(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      controllerDispose();
    } else if (state == AppLifecycleState.resumed) {
      if (kIsWeb)
        onWebResume(this);
      else
        onMobileResume(this);
      setupCamera(this);
    }
  }

  _homeScreenSmall() {
    return Adaptive(
        iOS: _homeScreenMobileSmall(false),
        android: _homeScreenMobileSmall(true),
        web: _homeScreenWebSmall());
  }

  _homeScreenLarge() {
    return Adaptive(
        iOS: _homeScreenMobileLarge(false),
        android: _homeScreenMobileLarge(true),
        web: _homeScreenWebLarge());
  }

  _homeScreenWebSmall() {
    return homeWebCardContainer(context, this, true, _scaffoldKey);
  }

  _homeScreenWebLarge() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: SideMenu(),
          ),
          Expanded(
              flex: 15,
              child: homeWebCardContainer(context, this, false, _scaffoldKey)),
        ],
      ),
    );
  }

  _homeScreenMobileSmall(bool isAndroid) {
    return homeMobileBody(context, this);
  }

  _homeScreenMobileLarge(bool isAndroid) {
    return homeMobileBody(context, this);
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (!_firebaseAccounts.getSignedInStatus())
      context.router.replaceAll([AuthScreen()]);
    return Material(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: kIsWeb
              ? getIsSmall(context)
                  ? Drawer(
                      child: SideMenu(),
                    )
                  : null
              : null,
          extendBody: true,
          body: Container(
            color: Theme.of(context).colorScheme.homeBackground,
            constraints: Theme.of(context).bottomAppBarTheme.homeConstraints,
            child: Responsive(
              small: _homeScreenSmall(),
              large: _homeScreenLarge(),
            ),
          ),
          bottomNavigationBar:
              kIsWeb ? null : homeMobileNavigationBar(context, this)),
    );
  }
}
