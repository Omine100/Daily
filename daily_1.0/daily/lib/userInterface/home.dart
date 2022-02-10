import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/homeComponents.dart';
import 'package:daily/userInterface/homeMainComponents.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    setupCamera(this);
  }

  @override
  void dispose() {
    disposeCamera();
    super.dispose();
  }

  homeScreenDesktop() {
    return homeBody(context);
  }

  homeScreenTablet() {
    return homeBody(context);
  }

  homeScreenMobile() {
    return homeBody(context);
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
