import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';
import 'package:daily/userInterface/auth/authWebComponents.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();

Widget verifyWebCard(BuildContext context, State state) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: verifyWebTitle(context),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: verifyWebLogin(context, state),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verifyWebResend(context),
            verifyWebSwitchBack(context, state),
          ],
        ),
      ),
    ],
  );
}

Widget verifyWebTitle(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        getTranslated(context, "verifyTitle"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.verifyWebTitle,
          fontSize: Theme.of(context).textTheme.verifyWebTitle,
          fontWeight: Theme.of(context).typography.verifyWebTitle,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
      ),
      Text(
        getTranslated(context, "verifySubtitle"),
        textAlign: TextAlign.center,
        softWrap: true,
        style: TextStyle(
          color: Theme.of(context).colorScheme.verifyWebSubtitle,
          fontSize: Theme.of(context).textTheme.verifyWebSubtitle,
          fontWeight: Theme.of(context).typography.verifyWebSubtitle,
        ),
      ),
    ],
  );
}

Widget verifyWebLogin(BuildContext context, State state) {
  return Container(
    constraints: Theme.of(context).bottomAppBarTheme.verifyWebLogin,
    height: getDimension(
        context, true, Theme.of(context).visualDensity.verifyWebLoginHeight),
    width: getDimension(
        context, false, Theme.of(context).visualDensity.verifyWebLoginWidth),
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.verifyWebLogin,
        borderRadius: BorderRadius.circular(30)),
    child: Material(
      color: Theme.of(context).colorScheme.materialTransparent,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.verifyWebLoginInkWell,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onTap: () {
          firebaseAccounts.signInEmailAndPassword(context, userEmail, userPass);
        },
        child: Center(
          child: Text(
            getTranslated(context, "verifyLogin"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.verifyWebLoginText,
              fontSize: Theme.of(context).textTheme.verifyWebLoginText,
              fontWeight: Theme.of(context).typography.verifyWebLoginText,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget verifyWebResend(BuildContext context) {
  return GestureDetector(
    onTap: () {
      firebaseAccounts.sendEmailVerification(context, userEmail);
    },
    child: RichText(
      text: TextSpan(
        text: getTranslated(context, "verifyResendPrimary"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.verifyWebResendPrimary,
          fontSize: Theme.of(context).textTheme.verifyWebResendPrimary,
          fontWeight: Theme.of(context).typography.verifyWebResendPrimary,
        ),
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(context, "verifyResendSecondary"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.verifyWebResendSecondary,
              fontSize: Theme.of(context).textTheme.verifyWebResendSecondary,
              fontWeight: Theme.of(context).typography.verifyWebResendSecondary,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget verifyWebSwitchBack(BuildContext context, State state) {
  return GestureDetector(
    onTap: () {
      authWebVerifySwitchBack(context, state);
    },
    child: Text(
      getTranslated(context, "verifyAuthCallback"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.verifyWebSwitchBack,
        fontSize: Theme.of(context).textTheme.verifyWebSwitchBack,
        fontWeight: Theme.of(context).typography.verifyWebSwitchBack,
      ),
    ),
  );
}
