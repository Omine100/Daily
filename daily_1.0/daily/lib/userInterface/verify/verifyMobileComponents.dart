import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';
import 'package:daily/userInterface/auth/authMobileComponents.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

Widget verifyMobileTitle(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        getTranslated(context, "verifyTitle"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.verifyMobileTitle,
          fontSize: Theme.of(context).textTheme.verifyMobileTitle,
          fontWeight: Theme.of(context).typography.verifyMobileTitle,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
      ),
      Text(
        getTranslated(context, "verifySubtitle"),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.verifyMobileSubtitle,
          fontSize: Theme.of(context).textTheme.verifyMobileSubtitle,
          fontWeight: Theme.of(context).typography.verifyMobileSubtitle,
        ),
      ),
    ],
  );
}

Widget verifyMobileLogin(
    BuildContext context, State state, String userEmail, String userPass) {
  return Container(
    height: getDimension(
        context, true, Theme.of(context).visualDensity.verifyMobileLoginHeight),
    width: getDimension(
        context, false, Theme.of(context).visualDensity.verifyMobileLoginWidth),
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.verifyMobileLogin,
        borderRadius: BorderRadius.circular(30)),
    child: Material(
      color: Theme.of(context).colorScheme.materialTransparent,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.verifyMobileLoginInkWell,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onTap: () {
          _firebaseAccounts
              .signInEmailAndPassword(context, userEmail, userPass)
              .then((value) {
            if (!_firebaseAccounts.getEmailVerified(context)) {
              showToastMessage(context, "_errorEmailNotVerified", true);
              _firebaseAccounts.signOut();
            } else {
              context.router.replaceAll([HomeScreen()]);
            }
          });
        },
        child: Center(
          child: Text(
            getTranslated(context, "verifyLogin"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.verifyMobileLoginText,
              fontSize: Theme.of(context).textTheme.verifyMobileLoginText,
              fontWeight: Theme.of(context).typography.verifyMobileLoginText,
            ),
          ),
        ),
      ),
    ),
  );
}
