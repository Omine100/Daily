import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeProfileComponents.dart';

homeProfileDesktop(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        left: 340,
        top: 37,
        child: homeProfileSettings(context),
      ),
    ],
  );
}

homeProfileTablet(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        left: 340,
        top: 37,
        child: homeProfileSettings(context),
      ),
    ],
  );
}

homeProfileMobile(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        left: 340,
        top: 37,
        child: homeProfileSettings(context),
      ),
    ],
  );
}

Widget homeProfileBody(BuildContext context) {
  return Responsive(
      mobile: homeProfileMobile(context),
      tablet: homeProfileTablet(context),
      desktop: homeProfileDesktop(context));
}
