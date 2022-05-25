import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/base/home/homeWebComponents.dart';
import 'package:daily/userInterface/base/home/homeMobileComponents.dart';

_homeSmall(BuildContext context, State state) {
  return Adaptive(
      iOS: _homeMobileSmall(context, state, false),
      android: _homeMobileSmall(context, state, true),
      web: _homeWebSmall(context, state));
}

_homeLarge(BuildContext context, State state) {
  return Adaptive(
      iOS: _homeMobileLarge(context, state, false),
      android: _homeMobileLarge(context, state, true),
      web: _homeWebLarge(context, state));
}

_homeWebSmall(BuildContext context, State state) {
  return homeWebCard(context, state, true);
}

_homeWebLarge(BuildContext context, State state) {
  return homeWebCard(context, state, false);
}

_homeMobileSmall(BuildContext context, State state, bool isAndroid) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(child: homeCamera(context, state)),
      Positioned(
          top: 40, right: 15, child: homeCameraComponentCard(context, state)),
      Positioned(bottom: 90, child: homePictureButton(context, state)),
      homeFocusCircle(context),
    ],
  );
}

_homeMobileLarge(BuildContext context, State state, bool isAndroid) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(child: homeCamera(context, state)),
      Positioned(
          top: 40, right: 15, child: homeCameraComponentCard(context, state)),
      Positioned(bottom: 90, child: homePictureButton(context, state)),
      homeFocusCircle(context),
    ],
  );
}

Widget homeBody(BuildContext context, State state, bool isSmall) {
  return isSmall ? _homeSmall(context, state) : _homeLarge(context, state);
}
