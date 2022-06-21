import 'package:daily/themesLocal/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/error/errorWebComponents.dart';
import 'package:daily/userInterface/error/errorMobileComponents.dart';

class ErrorScreen extends StatefulWidget {
  final String filePath;
  ErrorScreen({this.filePath});

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  _errorScreenSmall() {
    return Adaptive(
        iOS: _errorScreenMobileSmall(false),
        android: _errorScreenMobileSmall(true),
        web: _errorScreenWebSmall());
  }

  _errorScreenLarge() {
    return Adaptive(
        iOS: _errorScreenMobileLarge(false),
        android: _errorScreenMobileLarge(true),
        web: _errorScreenWebLarge());
  }

  _errorScreenWebSmall() {
    return Container(
      height: getDimension(
          context, true, Theme.of(context).visualDensity.errorWebHeight),
      width: getDimension(
          context, false, Theme.of(context).visualDensity.errorWebWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          errorWebCardContainer(context),
        ],
      ),
    );
  }

  _errorScreenWebLarge() {
    return Container(
      height: getDimension(
          context, true, Theme.of(context).visualDensity.errorWebHeight),
      width: getDimension(
          context, false, Theme.of(context).visualDensity.errorWebWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          errorWebCardContainer(context),
        ],
      ),
    );
  }

  _errorScreenMobileSmall(bool isAndroid) {
    return Container();
  }

  _errorScreenMobileLarge(bool isAndroid) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => true,
      child: Material(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SingleChildScrollView(
            child: Responsive(
              small: _errorScreenSmall(),
              large: _errorScreenLarge(),
            ),
          ),
        ),
      ),
    );
  }
}
