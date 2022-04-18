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
  VerifyScreen({this.email});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  verifyScreenSmall() {
    return Adaptive(
        iOS: verifyScreenMobileSmall(false),
        android: verifyScreenMobileSmall(true),
        web: verifyScreenWebSmall());
  }

  verifyScreenLarge() {
    return Adaptive(
        iOS: verifyScreenMobileLarge(false),
        android: verifyScreenMobileLarge(true),
        web: verifyScreenWebLarge());
  }

  verifyScreenWebSmall() {
    return Container();
  }

  verifyScreenWebLarge() {
    return Container();
  }

  verifyScreenMobileSmall(bool isAndroid) {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.verifyMobileTitleTop),
        child: verifyMobileTitle(context),
      ),
      Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.verifyMobileLoginTop),
          child: verifyMobileLogin(context, this)),
    ]);
  }

  verifyScreenMobileLarge(bool isAndroid) {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.verifyMobileTitleTop),
        child: verifyMobileTitle(context),
      ),
      Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.verifyMobileLoginTop),
          child: verifyMobileLogin(context, this)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => true,
      child: Material(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.verifyBackground,
          body: SingleChildScrollView(
            child: Responsive(
              small: verifyScreenSmall(),
              large: verifyScreenLarge(),
            ),
          ),
        ),
      ),
    );
  }
}
