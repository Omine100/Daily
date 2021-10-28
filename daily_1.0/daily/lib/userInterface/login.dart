import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/userInterface/loginComponents.dart';
import 'package:daily/themesLocal/positions.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({this.isSignIn});

  final bool isSignIn;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(isDark
                      ? "lib/assets/welcome_backgroundDark.jpg"
                      : "lib/assets/welcome_background.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  constraints: BoxConstraints.expand(height: double.maxFinite),
                  child: Responsive(
                    desktop: loginScreenDesktop(context),
                    tablet: loginScreenTablet(context),
                    mobile: loginScreenMobile(context),
                  )))),
    );
  }
}

loginScreenDesktop(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
    ],
  );
}

loginScreenTablet(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
    ],
  );
}

loginScreenMobile(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
    ],
  );
}