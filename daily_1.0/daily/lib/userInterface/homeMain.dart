import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeMainComponents.dart';

homeMainDesktop(BuildContext context) {
  return homeMainCamera(context);
}

homeMainTablet(BuildContext context) {
  return homeMainCamera(context);
}

homeMainMobile(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(child: homeMainCamera(context)),
      Positioned(top: 50, left: 100, child: homeSwitchCamera(context)),
    ],
  );
}

Widget homeMainBody(BuildContext context) {
  return Responsive(
      mobile: homeMainMobile(context),
      tablet: homeMainTablet(context),
      desktop: homeMainDesktop(context));
}
