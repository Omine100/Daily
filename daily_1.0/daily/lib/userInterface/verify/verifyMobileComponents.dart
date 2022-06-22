import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/userInterface/auth/authMobileComponents.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

Widget verifyMobileTitle(BuildContext context) {
  return Container(
    width: getDimension(
        context, false, Theme.of(context).visualDensity.verifyMobileTitleWidth),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(getTranslated(context, "verifyTitle"),
            style: Theme.of(context).textTheme.titleSmall),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(getTranslated(context, "verifySubtitle"),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1),
      ],
    ),
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
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30)),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.surfaceTint,
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
              context.router.replaceAll([BaseScreen()]);
            }
          });
        },
        child: Center(
          child: Text(
            getTranslated(context, "verifyLogin"),
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    ),
  );
}
