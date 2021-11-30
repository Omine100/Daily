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

Widget forgotPasswordInputField(BuildContext context) {
  return TextFormField();
}

Widget forgotPasswordSend(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.forgotPasswordSend,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      getTranslated(context, "forgotPasswordSend"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.forgotPasswordSendText,
        fontSize: Theme.of(context).textTheme.forgotPasswordSendText,
        fontWeight: Theme.of(context).typography.forgotPasswordSendText,
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
        text: getTranslated(context, "forgotPasswordResend"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.forgotPasswordResend,
          fontSize: Theme.of(context).textTheme.forgotPasswordResend,
          fontWeight: Theme.of(context).typography.forgotPasswordResend,
        ),
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(context, "forgotPasswordResendSend"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.forgotPasswordResendSend,
              fontSize: Theme.of(context).textTheme.forgotPasswordResendSend,
              fontWeight: Theme.of(context).typography.forgotPasswordResendSend,
            ),
          ),
        ],
      ),
    ),
  );
}
