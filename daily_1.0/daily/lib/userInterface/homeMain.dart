import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/homeMainComponents.dart';

mainDesktop(BuildContext context, State state) {
  return mainCamera(context, state);
}

mainTablet(BuildContext context, State state) {
  return mainCamera(context, state);
}

mainMobile(BuildContext context, State state) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(child: mainCamera(context, state)),
      Positioned(top: 50, right: 25, child: mainSwitchCamera(context, state)),
      Positioned(bottom: 115, child: mainPictureButton(context)),
      mainFocusCircle(context),
    ],
  );
}

Widget mainBody(BuildContext context, State state) {
  return Responsive(
      mobile: mainMobile(context, state),
      tablet: mainTablet(context, state),
      desktop: mainDesktop(context, state));
}
