import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/base/search/searchWebComponents.dart';
import 'package:daily/userInterface/base/search/searchMobileComponents.dart';

_searchSmall(BuildContext context, State state) {
  return Adaptive(
      iOS: _searchMobileSmall(context, false),
      android: _searchMobileSmall(context, true),
      web: _searchWebSmall(context, state));
}

_searchLarge(BuildContext context, State state) {
  return Adaptive(
      iOS: _searchMobileLarge(context, false),
      android: _searchMobileLarge(context, true),
      web: _searchWebLarge(context, state));
}

_searchWebSmall(BuildContext context, State state) {
  return Container();
}

_searchWebLarge(BuildContext context, State state) {
  return Container();
}

_searchMobileSmall(BuildContext context, bool isAndroid) {
  return Container();
}

_searchMobileLarge(BuildContext context, bool isAndroid) {
  return Container();
}

Widget searchBody(BuildContext context, State state, bool isSmall) {
  return isSmall ? _searchSmall(context, state) : _searchLarge(context, state);
}
