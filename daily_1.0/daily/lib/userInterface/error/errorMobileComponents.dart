import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/constraints.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

Widget errorWebCenterPiece(BuildContext context, State state) {
  return Container(
      height: getDimension(context, true, 1.0),
      width: getDimension(context, false, 1.0),
      child: Image(
          fit: BoxFit.contain,
          image: AssetImage("lib/assets/error/web/error_centerPiece.png")));
}
