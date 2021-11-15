import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/userInterface/authComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';

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
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.welcomeBackground,
          ),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  constraints: BoxConstraints.expand(height: double.maxFinite),
                  child: Responsive(
                    desktop: AuthScreenDesktop(context, this, widget.isSignIn),
                    tablet: AuthScreenTablet(context, this, widget.isSignIn),
                    mobile: AuthScreenMobile(context, this, widget.isSignIn),
                  )))),
    );
  }
}

AuthScreenDesktop(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
      Positioned(
        top: 200,
        left: 400,
        child: AuthUserInput(isSignIn),
      )
    ],
  );
}

AuthScreenTablet(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
      Positioned(
        top: 200,
        left: 400,
        child: AuthUserInput(isSignIn),
      )
    ],
  );
}

AuthScreenMobile(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
      Positioned(
        top: 400,
        child: AuthUserInput(isSignIn),
      )
    ],
  );
}
