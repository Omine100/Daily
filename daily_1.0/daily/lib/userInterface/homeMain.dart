import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeMainComponents.dart';

homeMainDesktop(BuildContext context) {
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

homeMainTablet(BuildContext context) {
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

homeMainMobile(BuildContext context) {
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

Widget homeMainBody(BuildContext context) {
  return Responsive(
      mobile: homeMainMobile(context),
      tablet: homeMainTablet(context),
      desktop: homeMainDesktop(context));
}
