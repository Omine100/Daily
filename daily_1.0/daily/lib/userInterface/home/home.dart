import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/cameraManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/home/homeWebComponents.dart';
import 'package:daily/userInterface/home/homeMobileComponents.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setupPageController();
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
      onResume(this);
      setupCamera(this);
    }
  }

  homeScreenSmall() {
    return Adaptive(
        iOS: homeScreenMobileSmall(false),
        android: homeScreenMobileSmall(true),
        web: homeScreenWebSmall());
  }

  homeScreenLarge() {
    return Adaptive(
        iOS: homeScreenMobileLarge(false),
        android: homeScreenMobileLarge(true),
        web: homeScreenWebLarge());
  }

  homeScreenWebSmall() {
    return homeBody(context, this);
  }

  homeScreenWebLarge() {
    return homeBody(context, this);
  }

  homeScreenMobileSmall(bool isAndroid) {
    return homeBody(context, this);
  }

  homeScreenMobileLarge(bool isAndroid) {
    return homeBody(context, this);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        body: Container(
          color: Theme.of(context).colorScheme.homeBackground,
          constraints: BoxConstraints.expand(height: double.maxFinite),
          child: Responsive(
            small: homeScreenSmall(),
            large: homeScreenLarge(),
          ),
        ),
        bottomNavigationBar: homeNavigationBar(context, this),
      ),
    );
  }
}
