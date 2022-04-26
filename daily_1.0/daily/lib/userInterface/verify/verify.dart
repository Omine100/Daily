import 'package:daily/themesLocal/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/verify/verifyWebComponents.dart';
import 'package:daily/userInterface/verify/verifyMobileComponents.dart';

class VerifyScreen extends StatefulWidget {
  final String email;
  final String pass;
  VerifyScreen({this.email, this.pass});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  _verifyScreenSmall() {
    return Adaptive(
        iOS: _verifyScreenMobileSmall(false),
        android: _verifyScreenMobileSmall(true),
        web: _verifyScreenWebSmall());
  }

  _verifyScreenLarge() {
    return Adaptive(
        iOS: _verifyScreenMobileLarge(false),
        android: _verifyScreenMobileLarge(true),
        web: _verifyScreenWebLarge());
  }

  _verifyScreenWebSmall() {
    return Container();
  }

  _verifyScreenWebLarge() {
    return Container();
  }

  _verifyScreenMobileSmall(bool isAndroid) {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.verifyMobileTitleTop),
        child: verifyMobileTitle(context),
      ),
      Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.verifyMobileLoginTop),
          child: verifyMobileLogin(context, this, widget.email, widget.pass)),
    ]);
  }

  _verifyScreenMobileLarge(bool isAndroid) {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.verifyMobileTitleTop),
        child: verifyMobileTitle(context),
      ),
      Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.verifyMobileLoginTop),
          child: verifyMobileLogin(context, this, widget.email, widget.pass)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => true,
      child: Material(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.verifyBackground,
          body: Responsive(
            small: _verifyScreenSmall(),
            large: _verifyScreenLarge(),
          ),
        ),
      ),
    );
  }
}
