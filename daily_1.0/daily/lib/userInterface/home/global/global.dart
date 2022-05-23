import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/home/global/globalWebComponents.dart';
import 'package:daily/userInterface/home/global/globalMobileComponents.dart';

_globalSmall(BuildContext context) {
  return Adaptive(
      iOS: _globalMobileSmall(context, false),
      android: _globalMobileSmall(context, true),
      web: _globalWebSmall(context));
}

_globalLarge(BuildContext context) {
  return Adaptive(
      iOS: _globalMobileLarge(context, false),
      android: _globalMobileLarge(context, true),
      web: _globalWebLarge(context));
}

_globalWebSmall(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        left: 340,
        top: 37,
        child: Container(),
      ),
    ],
  );
}

_globalWebLarge(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        left: 340,
        top: 37,
        child: Container(),
      ),
    ],
  );
}

_globalMobileSmall(BuildContext context, bool isAndroid) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        left: 340,
        top: 37,
        child: Container(),
      ),
    ],
  );
}

_globalMobileLarge(BuildContext context, bool isAndroid) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        left: 340,
        top: 37,
        child: Container(),
      ),
    ],
  );
}

Widget globalBody(BuildContext context) {
  return Responsive(
    small: _globalSmall(context),
    large: _globalLarge(context),
  );
}
