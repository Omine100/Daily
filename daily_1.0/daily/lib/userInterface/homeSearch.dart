import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeSearchComponents.dart';

searchDesktop(BuildContext context) {
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

searchTablet(BuildContext context) {
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

searchMobile(BuildContext context) {
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

Widget searchBody(BuildContext context) {
  return Responsive(
      mobile: searchMobile(context),
      tablet: searchTablet(context),
      desktop: searchDesktop(context));
}
