import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/home/profile/profileWebComponents.dart';
import 'package:daily/userInterface/home/profile/profileMobileComponents.dart';

_profileSmall(BuildContext context, State state) {
  return Adaptive(
      iOS: _profileMobileSmall(context, state, false),
      android: _profileMobileSmall(context, state, true),
      web: _profileWebSmall(context, state));
}

_profileLarge(BuildContext context, State state) {
  return Adaptive(
      iOS: _profileMobileLarge(context, state, false),
      android: _profileMobileLarge(context, state, true),
      web: _profileWebLarge(context, state));
}

_profileWebSmall(BuildContext context, State state) {
  return Container();
}

_profileWebLarge(BuildContext context, State state) {
  return Container();
}

_profileMobileSmall(BuildContext context, State state, bool isAndroid) {
  return Container();
}

_profileMobileLarge(BuildContext context, State state, bool isAndroid) {
  return Container();
}

Widget profileBody(BuildContext context, State state) {
  return Responsive(
    small: _profileSmall(context, state),
    large: _profileLarge(context, state),
  );
}
