import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeMainComponents.dart';

homeMainDesktop(BuildContext context) {
  return getBody(context);
}

homeMainTablet(BuildContext context) {
  return getBody(context);
}

homeMainMobile(BuildContext context) {
  return cameraPreview(context);
}

Widget homeMainBody(BuildContext context) {
  return Responsive(
      mobile: homeMainMobile(context),
      tablet: homeMainTablet(context),
      desktop: homeMainDesktop(context));
}
