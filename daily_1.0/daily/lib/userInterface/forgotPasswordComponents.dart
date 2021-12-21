import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/utilities/managementUtil/validation.dart';

Widget forgotPasswordTitle(BuildContext context) {
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
            color: Theme.of(context).colorScheme.forgotPasswordTitle,
            fontSize: Theme.of(context).textTheme.forgotPasswordTitle,
            fontWeight: Theme.of(context).typography.forgotPasswordTitle,
          ),
        ),
        Text(
          getTranslated(context, "forgotPasswordSubtitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.forgotPasswordSubtitle,
            fontSize: Theme.of(context).textTheme.forgotPasswordSubtitle,
            fontWeight: Theme.of(context).typography.forgotPasswordSubtitle,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPasswordCenterPiece(BuildContext context) {
  return Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.forgotPasswordCenterPieceHeight),
      child: Image(
          image: AssetImage(
              "lib/assets/forgotPassword/forgotPassword_centerPiece.png")));
}

String userEmail = "";
Widget forgotPasswordUserInputField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.forgotPasswordUserInputFieldHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.forgotPasswordUserInputFieldWidth),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.forgotPasswordUserInputField,
      ),
      child: TextFormField(
        obscureText: false,
        validator: (email) {
          if (!isEmail(email))
            return getTranslated(context, 'authValidatorEmailFormat');
          return null;
        },
        onSaved: (email) => userEmail,
        autofocus: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:
              getTranslated(context, 'forgotPasswordValidatorEmailFormat'),
          labelStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordUserInputFieldDecoration,
            fontSize: Theme.of(context)
                .textTheme
                .forgotPasswordUserInputFieldDecoration,
            fontWeight: Theme.of(context)
                .typography
                .forgotPasswordUserInputFieldDecoration,
          ),
          hintStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordUserInputFieldDecoration,
            fontSize: Theme.of(context)
                .textTheme
                .forgotPasswordUserInputFieldDecoration,
            fontWeight: Theme.of(context)
                .typography
                .forgotPasswordUserInputFieldDecoration,
          ),
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordUserInputFieldIconDecoration,
          ),
        ),
      ),
    ),
  );
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
