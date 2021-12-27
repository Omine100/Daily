import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeComponents.dart';
import 'package:daily/utilities/designUtil/neumorphism/neumorphism.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  homeScreenDesktop() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 50,
          child: homeTitle(context),
        ),
      ],
    );
  }

  homeScreenTablet() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 50,
          child: homeTitle(context),
        ),
      ],
    );
  }

  homeScreenMobile() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 50,
          child: homeTitle(context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        constraints: BoxConstraints.expand(height: double.maxFinite),
        child: Responsive(
          desktop: homeScreenDesktop(),
          tablet: homeScreenTablet(),
          mobile: homeScreenMobile(),
        ),
      ),
    );
  }
}
