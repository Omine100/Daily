import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/home/search/homeSearchWebComponents.dart';
import 'package:daily/userInterface/home/search/homeSearchMobileComponents.dart';

_searchSmall(BuildContext context) {
  return Adaptive(
      iOS: _searchMobileSmall(context, false),
      android: _searchMobileSmall(context, true),
      web: _searchWebSmall(context));
}

_searchLarge(BuildContext context) {
  return Adaptive(
      iOS: _searchMobileLarge(context, false),
      android: _searchMobileLarge(context, true),
      web: _searchWebLarge(context));
}

_searchWebSmall(BuildContext context) {
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

_searchWebLarge(BuildContext context) {
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

_searchMobileSmall(BuildContext context, bool isAndroid) {
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

_searchMobileLarge(BuildContext context, bool isAndroid) {
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
    small: _searchSmall(context),
    large: _searchLarge(context),
  );
}
