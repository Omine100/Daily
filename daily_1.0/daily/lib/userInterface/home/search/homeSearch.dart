import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/home/search/homeSearchWebComponents.dart';
import 'package:daily/userInterface/home/search/homeSearchMobileComponents.dart';

searchSmall(BuildContext context) {
  return Adaptive(
      iOS: searchMobileSmall(context, false),
      android: searchMobileSmall(context, true),
      web: searchWebSmall(context));
}

searchLarge(BuildContext context) {
  return Adaptive(
      iOS: searchMobileLarge(context, false),
      android: searchMobileLarge(context, true),
      web: searchWebLarge(context));
}

searchWebSmall(BuildContext context) {
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

searchWebLarge(BuildContext context) {
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

searchMobileSmall(BuildContext context, bool isAndroid) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: 45,
        child: searchSearchBar(context),
      ),
    ],
  );
}

searchMobileLarge(BuildContext context, bool isAndroid) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: 45,
        child: searchSearchBar(context),
      ),
    ],
  );
}

Widget searchBody(BuildContext context) {
  return Responsive(
    small: searchSmall(context),
    large: searchLarge(context),
  );
}
