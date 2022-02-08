import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeGlobalComponents.dart';

homeGlobalDesktop(BuildContext context) {
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

homeGlobalTablet(BuildContext context) {
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

homeGlobalMobile(BuildContext context) {
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

Widget homeGlobalBody(BuildContext context) {
  return Responsive(
      mobile: homeGlobalMobile(context),
      tablet: homeGlobalTablet(context),
      desktop: homeGlobalDesktop(context));
}
