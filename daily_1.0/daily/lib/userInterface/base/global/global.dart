import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';

_globalSmall(BuildContext context, State state) {
  return Adaptive(
      iOS: _globalMobileSmall(context, state, false),
      android: _globalMobileSmall(context, state, true),
      web: _globalWebSmall(context, state));
}

_globalLarge(BuildContext context, State state) {
  return Adaptive(
      iOS: _globalMobileLarge(context, state, false),
      android: _globalMobileLarge(context, state, true),
      web: _globalWebLarge(context, state));
}

_globalWebSmall(BuildContext context, State state) {
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

_globalWebLarge(BuildContext context, State state) {
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

_globalMobileSmall(BuildContext context, State state, bool isAndroid) {
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

_globalMobileLarge(BuildContext context, State state, bool isAndroid) {
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

Widget globalBody(BuildContext context, State state, bool isSmall) {
  return isSmall ? _globalSmall(context, state) : _globalLarge(context, state);
}
