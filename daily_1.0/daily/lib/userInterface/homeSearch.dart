import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeSearchComponents.dart';

searchWeb(BuildContext context) {
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
        top: 45,
        child: searchSearchBar(context),
      ),
    ],
  );
}

Widget searchBody(BuildContext context) {
  return Responsive(
      web: searchWeb(context),
      mobile: searchMobile(context),
      tablet: searchTablet(context));
}
