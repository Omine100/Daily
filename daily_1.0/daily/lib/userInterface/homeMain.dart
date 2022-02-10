import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeMainComponents.dart';

homeMainDesktop(BuildContext context) {
  return cameraPreview(context);
}

homeMainTablet(BuildContext context) {
  return cameraPreview(context);
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
