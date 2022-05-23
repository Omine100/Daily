import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/home/search/searchWebComponents.dart';
import 'package:daily/userInterface/home/search/searchMobileComponents.dart';

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
  return Container();
}

_searchWebLarge(BuildContext context) {
  return Container();
}

_searchMobileSmall(BuildContext context, bool isAndroid) {
  return Container();
}

_searchMobileLarge(BuildContext context, bool isAndroid) {
  return Container();
}

Widget searchBody(BuildContext context) {
  return Responsive(
    small: _searchSmall(context),
    large: _searchLarge(context),
  );
}
