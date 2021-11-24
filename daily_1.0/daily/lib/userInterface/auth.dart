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
  bool isSignIn = false;
  void initState() {
    super.initState();
    isSignIn = widget.isSignIn;
  }

  authScreenDesktop() {
    return Stack(
      children: [
        Positioned(
            top: 100, left: 100, child: authProfilePicker(context, this)),
      ],
    );
  }

  authScreenTablet() {
    return Stack(
      children: [
        Positioned(
            top: 100, left: 100, child: authProfilePicker(context, this)),
      ],
    );
  }

  authScreenMobile() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(top: 50, left: 100, child: authTitle(context)),
        Positioned(
            top: 100, left: 100, child: authProfilePicker(context, this)),
        Positioned(top: 400, child: authUserInput(context, isSignIn)),
        Positioned(
          top: 560,
          left: 50,
          child: isSignIn ? authForgotPassword(context) : Container(),
        ),
        Positioned(top: 650, child: authGetStarted(context, isSignIn)),
        Positioned(
            top: 750,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    print("Testing");
                    isSignIn = !isSignIn;
                  });
                },
                child: authSwitch(context, isSignIn)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.welcomeBackground,
        child: SingleChildScrollView(
          child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 1.2),
              child: Responsive(
                desktop: authScreenDesktop(),
                tablet: authScreenTablet(),
                mobile: authScreenMobile(),
              )),
        ));
  }
}
