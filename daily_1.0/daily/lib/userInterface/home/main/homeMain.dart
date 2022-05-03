import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/home/main/homeMainWebComponents.dart';
import 'package:daily/userInterface/home/main/homeMainMobileComponents.dart';

_mainSmall(BuildContext context, State state) {
  return Adaptive(
      iOS: _mainMobileSmall(context, state, false),
      android: _mainMobileSmall(context, state, true),
      web: _mainWebSmall(context, state));
}

_mainLarge(BuildContext context, State state) {
  return Adaptive(
      iOS: _mainMobileLarge(context, state, false),
      android: _mainMobileLarge(context, state, true),
      web: _mainWebLarge(context, state));
}

bool isInteracting = false;
_mainWebSmall(BuildContext context, State state) {
  return Container(
    child: Center(
      child: GestureDetector(
        onHorizontalDragEnd: (value) {
          state.setState(() {
            isInteracting = false;
          });
        },
        onHorizontalDragStart: (value) {
          state.setState(() {
            isInteracting = true;
          });
        },
        child: Planet(
          interactive: isInteracting,
        ),
      ),
    ),
  );
}

_mainWebLarge(BuildContext context, State state) {
  return Container(
    child: Center(
      child: GestureDetector(
        onTap: () {
          state.setState(() {
            isInteracting = !isInteracting;
          });
        },
        child: !isInteracting
            ? Planet(
                interactive: false,
              )
            : Planet(
                interactive: true,
              ),
      ),
    ),
  );
}

_mainMobileSmall(BuildContext context, State state, bool isAndroid) {
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

_mainMobileLarge(BuildContext context, State state, bool isAndroid) {
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
    small: _mainSmall(context, state),
    large: _mainLarge(context, state),
  );
}
