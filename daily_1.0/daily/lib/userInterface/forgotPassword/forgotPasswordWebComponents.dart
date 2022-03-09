import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

Widget forgotPasswordWebCard(BuildContext context) {
  return Container(
    height: getDimension(context, true,
        Theme.of(context).visualDensity.forgotPasswordWebCardHeight),
    width: getDimension(context, false,
        Theme.of(context).visualDensity.forgotPasswordWebCardWidth),
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.authWebCard,
        borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: forgotPasswordWebTitle(context),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget forgotPasswordWebTitle(BuildContext context) {
  return Container(
    width: getDimension(context, false,
        Theme.of(context).visualDensity.forgotPasswordTitleWidth),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          getTranslated(context, "forgotPasswordTitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.forgotPasswordMobileTitle,
            fontSize: Theme.of(context).textTheme.forgotPasswordTitle,
            fontWeight: Theme.of(context).typography.forgotPasswordTitle,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
        ),
        Text(
          getTranslated(context, "forgotPasswordSubtitlePrimary") +
              "\n" +
              getTranslated(context, "forgotPasswordSubtitleSecondary"),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.forgotPasswordMobileSubtitle,
            fontSize: Theme.of(context).textTheme.forgotPasswordSubtitle,
            fontWeight: Theme.of(context).typography.forgotPasswordSubtitle,
          ),
        ),
      ],
    ),
  );
}
