import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeMainComponents.dart';

homeMainDesktop(BuildContext context) {
  return homeMainCamera(context);
}

homeMainTablet(BuildContext context) {
  return homeMainCamera(context);
}

homeMainMobile(BuildContext context, State state) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(child: homeMainCamera(context)),
      Positioned(top: 50, left: 100, child: homeSwitchCamera(context, state)),
    ],
  );
}

Widget homeMainBody(BuildContext context, State state) {
  return Responsive(
      mobile: homeMainMobile(context, state),
      tablet: homeMainTablet(context),
      desktop: homeMainDesktop(context));
}
