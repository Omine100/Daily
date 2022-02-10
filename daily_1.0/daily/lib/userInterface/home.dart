import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/homeComponents.dart';
import 'package:daily/userInterface/homeMainComponents.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setupCamera(this);
  }

  @override
  void dispose() {
    disposeCamera();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setupCamera(this);
    }
    if (state == AppLifecycleState.paused) {
      settingsToPrefs(settingsList);
      disposeCamera();
    }
  }

  homeScreenDesktop() {
    return homeBody(context, this);
  }

  homeScreenTablet() {
    return homeBody(context, this);
  }

  homeScreenMobile() {
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
            desktop: homeScreenDesktop(),
            tablet: homeScreenTablet(),
            mobile: homeScreenMobile(),
          ),
        ),
        bottomNavigationBar: homeNavigationBar(context, this),
      ),
    );
  }
}
