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
      alignment: Alignment.center,
      constraints: Theme.of(context).bottomAppBarTheme.errorWebCardContainer,
      height: getDimension(context, true,
          Theme.of(context).visualDensity.errorWebCardContainerHeight),
      width: getDimension(context, true,
          Theme.of(context).visualDensity.errorWebCardContainerWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorWebCardContainer,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: errorWebCard(context),
    ),
  );
}

Widget errorWebCard(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 75.0),
          child: errorTitle(context),
        ),
        errorText(context),
      ],
    ),
  );
}

Widget errorTitle(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        getTranslated(context, "errorTitle"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.errorWebTitle,
          fontSize: Theme.of(context).textTheme.errorWebTitle,
          fontWeight: Theme.of(context).typography.errorWebTitle,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(5),
      ),
      Text(
        getTranslated(context, "errorSubtitle"),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.errorWebSubtitle,
          fontSize: Theme.of(context).textTheme.errorWebSubtitle,
          fontWeight: Theme.of(context).typography.errorWebSubtitle,
        ),
      ),
    ],
  );
}

Widget errorText(BuildContext context) {
  return Container(
    constraints: Theme.of(context).bottomAppBarTheme.errorWebText,
    width: getDimension(
        context, false, Theme.of(context).visualDensity.errorTextWidth),
    child: Text(
      getTranslated(context, "errorText"),
      softWrap: true,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Theme.of(context).colorScheme.errorWebText,
          fontSize: Theme.of(context).textTheme.errorWebText,
          fontWeight: Theme.of(context).typography.errorWebText),
    ),
  );
}
