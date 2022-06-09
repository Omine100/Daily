import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/base/profile/profileWebComponents.dart';
import 'package:daily/userInterface/base/profile/profileMobileComponents.dart';

_profileSmall(BuildContext context, State state, String userId) {
  return Adaptive(
      iOS: _profileMobileSmall(context, state, false, userId),
      android: _profileMobileSmall(context, state, true, userId),
      web: _profileWebSmall(context, state, userId));
}

_profileLarge(BuildContext context, State state, String userId) {
  return Adaptive(
      iOS: _profileMobileLarge(context, state, false, userId),
      android: _profileMobileLarge(context, state, true, userId),
      web: _profileWebLarge(context, state, userId));
}

_profileWebSmall(BuildContext context, State state, String userId) {
  return profileWebCard(context, state, true, userId);
}

_profileWebLarge(BuildContext context, State state, String userId) {
  return profileWebCard(context, state, false, userId);
}

_profileMobileSmall(
    BuildContext context, State state, bool isAndroid, String userId) {
  return Container();
}

_profileMobileLarge(
    BuildContext context, State state, bool isAndroid, String userId) {
  return Container();
}

Widget profileBody(
    BuildContext context, State state, bool isSmall, String userId) {
  return isSmall
      ? _profileSmall(context, state, userId)
      : _profileLarge(context, state, userId);
}
