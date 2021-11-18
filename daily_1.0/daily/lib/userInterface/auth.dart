import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/userInterface/authComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/utilities/managementUtil/validation.dart';

class AuthScreen extends StatefulWidget {
  final bool isSignIn;
  AuthScreen({this.isSignIn});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.welcomeBackground,
          ),
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 1.2),
          child: Responsive(
            desktop: AuthScreenDesktop(context, this, widget.isSignIn),
            tablet: AuthScreenTablet(context, this, widget.isSignIn),
            mobile: AuthScreenMobile(context, this, widget.isSignIn),
          )),
    ));
  }
}

AuthScreenDesktop(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
    ],
  );
}

AuthScreenTablet(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
    ],
  );
}

AuthScreenMobile(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 50, left: 100, child: authTitle(context)),
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
      Positioned(top: 400, child: authUserInput(context, isSignIn)),
      Positioned(
          top: isSignIn ? 550 : 600, child: authGetStarted(context, isSignIn)),
      Positioned(top: 700, child: authSwitch(context, isSignIn))
    ],
  );
}
