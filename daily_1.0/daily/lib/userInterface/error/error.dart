import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/error/errorWebComponents.dart';
import 'package:daily/userInterface/error/errorMobileComponents.dart';

class ErrorScreen extends StatefulWidget {
  final String filePath;
  ErrorScreen({this.filePath});

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  errorScreenSmall() {
    return Adaptive(
        iOS: errorScreenMobileSmall(false),
        android: errorScreenMobileSmall(true),
        web: errorScreenWebSmall());
  }

  errorScreenLarge() {
    return Adaptive(
        iOS: errorScreenMobileLarge(false),
        android: errorScreenMobileLarge(true),
        web: errorScreenWebLarge());
  }

  errorScreenWebSmall() {
    return errorWebCenterPiece(context, this);
  }

  errorScreenWebLarge() {
    return errorWebCenterPiece(context, this);
  }

  //Should stay like this cause we should never be able to get
  //to a page that does not exist on both mobile versions anyway
  errorScreenMobileSmall(bool isAndroid) {
    return Container();
  }

  errorScreenMobileLarge(bool isAndroid) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => true,
      child: Material(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.errorBackground,
          body: SingleChildScrollView(
            child: Responsive(
              small: errorScreenSmall(),
              large: errorScreenLarge(),
            ),
          ),
        ),
      ),
    );
  }
}
