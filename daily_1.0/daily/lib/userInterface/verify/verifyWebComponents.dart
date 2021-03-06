import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/constraints.dart';
import 'package:daily/userInterface/auth/authWebComponents.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

Widget verifyWebCard(
    BuildContext context, State state, String userEmail, String userPass) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: verifyWebTitle(context),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: verifyWebLogin(context, state, userEmail, userPass),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: verifyWebSwitchBack(context, state),
      ),
    ],
  );
}

Widget verifyWebTitle(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(getTranslated(context, "verifyTitle"),
          style: Theme.of(context).textTheme.titleLarge),
      Padding(
        padding: EdgeInsets.all(10),
      ),
      Text(getTranslated(context, "verifySubtitle"),
          textAlign: TextAlign.center,
          softWrap: true,
          style: Theme.of(context).textTheme.titleMedium),
    ],
  );
}

Widget verifyWebLogin(
    BuildContext context, State state, String userEmail, String userPass) {
  return Container(
    constraints: Theme.of(context).bottomAppBarTheme.verifyWebLogin,
    height: getDimension(
        context, true, Theme.of(context).visualDensity.verifyWebLoginHeight),
    width: getDimension(
        context, false, Theme.of(context).visualDensity.verifyWebLoginWidth),
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
          child: Text(getTranslated(context, "verifyLogin"),
              style: Theme.of(context).textTheme.displaySmall),
        ),
      ),
    ),
  );
}

Widget verifyWebSwitchBack(BuildContext context, State state) {
  return GestureDetector(
    onTap: () {
      authWebVerifySwitchBack(context, state);
    },
    child: Text(getTranslated(context, "verifyAuthCallback"),
            style: Theme.of(context).textTheme.bodyMedium)
        .showClickOnHover,
  );
}
