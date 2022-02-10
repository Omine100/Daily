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

homeMainMobile(BuildContext context, State state) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(child: homeMainCamera(context)),
      Positioned(
          top: 50, right: 25, child: homeMainSwitchCamera(context, state)),
      Positioned(bottom: 115, child: homeMainPictureButton(context))
    ],
  );
}

Widget homeMainBody(BuildContext context, State state) {
  return Responsive(
      mobile: homeMainMobile(context, state),
      tablet: homeMainTablet(context),
      desktop: homeMainDesktop(context));
}
