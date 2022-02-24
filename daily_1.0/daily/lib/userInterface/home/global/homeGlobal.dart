import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeGlobalComponents.dart';

globalWeb(BuildContext context) {
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

globalTablet(BuildContext context) {
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

globalMobile(BuildContext context) {
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

Widget globalBody(BuildContext context) {
  return Responsive(
      web: globalWeb(context),
      mobile: globalMobile(context),
      tablet: globalTablet(context));
}
