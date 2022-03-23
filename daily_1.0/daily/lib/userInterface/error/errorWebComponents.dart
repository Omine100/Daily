import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/constraints.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

Widget errorWebCardContainer(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      constraints: Theme.of(context).bottomAppBarTheme.errorWebCardContainer,
      height: getDimension(context, true,
          Theme.of(context).visualDensity.errorWebCardContainerHeight),
      width: getDimension(context, true,
          Theme.of(context).visualDensity.errorWebCardContainerWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorWebCardContainer,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: errorWebCard(),
    ),
  );
}

Widget errorWebCard() {}

Widget errorTitle(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "404",
        // getTranslated(context, "errorTitle"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.forgotPasswordWebTitle,
          fontSize: Theme.of(context).textTheme.forgotPasswordWebTitle,
          fontWeight: Theme.of(context).typography.forgotPasswordWebTitle,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
      ),
      Text(
        "Page not found",
        //getTranslated(context, "errorSubtitle")
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.forgotPasswordWebSubtitle,
          fontSize: Theme.of(context).textTheme.forgotPasswordWebSubtitle,
          fontWeight: Theme.of(context).typography.forgotPasswordWebSubtitle,
        ),
      ),
    ],
  );
}

Widget errorText() {}
