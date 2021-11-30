import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';

Widget forgotPasswordTitle(BuildContext context) {
  return Column(
    children: [
      Text("Forgot Password?"),
      Text("Enter your email below to recieve password reset instructions"),
    ],
  );
}

Widget forgotPasswordCenterPiece(BuildContext context) {
  return Image(
    image: AssetImage(""),
  );
}

Widget forgotPasswordUserInputField(BuildContext context) {
  return TextFormField();
}

Widget forgotPasswordSend(BuildContext context) {
  return Center(
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.forgotPasswordSendHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.forgotPasswordSendWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.forgotPasswordSend,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Theme.of(context).colorScheme.materialTransparent,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.forgotPasswordSendInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            //Event
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, "forgotPasswordSend"),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.forgotPasswordSendText,
                  fontSize: Theme.of(context).textTheme.forgotPasswordSendText,
                  fontWeight:
                      Theme.of(context).typography.forgotPasswordSendText,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget forgotPasswordResend(BuildContext context, String email) {
  return GestureDetector(
    onTap: () {
      FirebaseAccounts().sendPasswordReset(email);
    },
    child: RichText(
      text: TextSpan(
        text: getTranslated(context, "forgotPasswordResendPrimary"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.forgotPasswordResendPrimary,
          fontSize: Theme.of(context).textTheme.forgotPasswordResendPrimary,
          fontWeight: Theme.of(context).typography.forgotPasswordResendPrimary,
        ),
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(context, "forgotPasswordResendSecondary"),
            style: TextStyle(
              color:
                  Theme.of(context).colorScheme.forgotPasswordResendSecondary,
              fontSize:
                  Theme.of(context).textTheme.forgotPasswordResendSecondary,
              fontWeight:
                  Theme.of(context).typography.forgotPasswordResendSecondary,
            ),
          ),
        ],
      ),
    ),
  );
}
