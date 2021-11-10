import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/userInterface/authComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({this.isSignIn});

  final bool isSignIn;

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.welcomeBackground,
          ),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  constraints: BoxConstraints.expand(height: double.maxFinite),
                  child: Responsive(
                    desktop: AuthScreenDesktop(context),
                    tablet: AuthScreenTablet(context),
                    mobile: AuthScreenMobile(context),
                  )))),
    );
  }
}

AuthScreenDesktop(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [],
  );
}

AuthScreenTablet(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [],
  );
}

AuthScreenMobile(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [],
  );
}
