import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/home/global/homeGlobalWebComponents.dart';
import 'package:daily/userInterface/home/global/homeGlobalMobileComponents.dart';

globalSmall(BuildContext context) {
  return Adaptive(
      iOS: globalMobileSmall(context, false),
      android: globalMobileSmall(context, true),
      web: globalWebSmall(context));
}

globalLarge(BuildContext context) {
  return Adaptive(
      iOS: globalMobileLarge(context, false),
      android: globalMobileLarge(context, true),
      web: globalWebLarge(context));
}

globalWebSmall(BuildContext context) {
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

globalWebLarge(BuildContext context) {
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

globalMobileSmall(BuildContext context, bool isAndroid) {
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

globalMobileLarge(BuildContext context, bool isAndroid) {
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
    small: globalSmall(context),
    large: globalLarge(context),
  );
}
