import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/home/main/homeMainWebComponents.dart';
import 'package:daily/userInterface/home/main/homeMainMobileComponents.dart';

mainSmall(BuildContext context, State state) {
  return Adaptive(
      iOS: mainMobileSmall(context, state, false),
      android: mainMobileSmall(context, state, true),
      web: mainWebSmall(context));
}

mainLarge(BuildContext context, State state) {
  return Adaptive(
      iOS: mainMobileLarge(context, state, false),
      android: mainMobileLarge(context, state, true),
      web: mainWebLarge(context));
}

mainWebSmall(BuildContext context) {
  return Container();
}

mainWebLarge(BuildContext context) {
  return Container();
}

mainMobileSmall(BuildContext context, State state, bool isAndroid) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(child: mainCamera(context, state)),
      Positioned(
          top: 40, right: 15, child: mainCameraComponentCard(context, state)),
      Positioned(bottom: 90, child: mainPictureButton(context, state)),
      mainFocusCircle(context),
    ],
  );
}

mainMobileLarge(BuildContext context, State state, bool isAndroid) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(child: mainCamera(context, state)),
      Positioned(
          top: 40, right: 15, child: mainCameraComponentCard(context, state)),
      Positioned(bottom: 90, child: mainPictureButton(context, state)),
      mainFocusCircle(context),
    ],
  );
}

Widget mainBody(BuildContext context, State state) {
  return Responsive(
    small: mainSmall(context, state),
    large: mainLarge(context, state),
  );
}
