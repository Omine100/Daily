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
import 'package:daily/userInterface/base/baseWebComponents.dart';
import 'package:daily/userInterface/base/baseMobileComponents.dart';
import 'package:daily/userInterface/base/sideMenu.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with WidgetsBindingObserver {
  FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (kIsWeb)
      setupWebPageController();
    else {
      setupMobilePageController();
      setupCamera(this);
    }
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
      else {
        onMobileResume(this);
        setupCamera(this);
      }
    }
  }

  _baseScreenSmall() {
    return Adaptive(
        iOS: _baseScreenMobileSmall(false),
        android: _baseScreenMobileSmall(true),
        web: _baseScreenWebSmall());
  }

  _baseScreenLarge() {
    return Adaptive(
        iOS: _baseScreenMobileLarge(false),
        android: _baseScreenMobileLarge(true),
        web: _baseScreenWebLarge());
  }

  _baseScreenWebSmall() {
    return baseWebCardContainer(context, this, true, _scaffoldKey);
  }

  _baseScreenWebLarge() {
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.167,
            child: SideMenu()),
        Container(
            width: MediaQuery.of(context).size.width * 0.833,
            child: baseWebCardContainer(context, this, false, _scaffoldKey))
      ],
    );
  }

  _baseScreenMobileSmall(bool isAndroid) {
    return baseMobileBody(context, this, true);
  }

  _baseScreenMobileLarge(bool isAndroid) {
    return baseMobileBody(context, this, false);
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (!_firebaseAccounts.getSignedInStatus())
      context.router.replaceAll([AuthScreen()]);
    return Material(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: Responsive(
            small: SideMenu(),
            large: null,
          ),
          extendBody: true,
          body: Container(
            color: Theme.of(context).colorScheme.baseBackground,
            constraints: Theme.of(context).bottomAppBarTheme.baseConstraints,
            child: Responsive(
              small: _baseScreenSmall(),
              large: _baseScreenLarge(),
            ),
          ),
          bottomNavigationBar:
              kIsWeb ? null : baseMobileNavigationBar(context, this)),
    );
  }
}
