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
                    desktop: AuthScreenDesktop(context, this),
                    tablet: AuthScreenTablet(context, this),
                    mobile: AuthScreenMobile(context, this),
                  )))),
    );
  }
}

AuthScreenDesktop(BuildContext context, State state) {
  return Stack(
    children: [Positioned(child: authProfilePicker(context, state))],
  );
}

AuthScreenTablet(BuildContext context, State state) {
  return Stack(
    children: [Positioned(child: authProfilePicker(context, state))],
  );
}

AuthScreenMobile(BuildContext context, State state) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state))
    ],
  );
}
