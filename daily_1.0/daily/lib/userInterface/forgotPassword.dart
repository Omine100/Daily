import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/welcomeComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  forgotPasswordScreenDesktop() {
    return Container();
  }

  forgotPasswordScreenTablet() {
    return Container();
  }

  forgotPasswordScreenMobile() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.forgotPasswordBackground,
        child: Container(
            constraints: BoxConstraints.expand(height: double.maxFinite),
            child: Responsive(
              desktop: forgotPasswordScreenDesktop(),
              tablet: forgotPasswordScreenTablet(),
              mobile: forgotPasswordScreenMobile(),
            )));
  }
}
