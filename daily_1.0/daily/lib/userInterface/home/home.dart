import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/cameraManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/homeComponents.dart';

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

  homeScreenWeb() {
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
            web: homeScreenWeb(),
            tablet: homeScreenTablet(),
            mobile: homeScreenMobile(),
          ),
        ),
        bottomNavigationBar: homeNavigationBar(context, this),
      ),
    );
  }
}
