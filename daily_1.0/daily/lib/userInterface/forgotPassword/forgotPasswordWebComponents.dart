import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';
import 'package:daily/userInterface/auth/authWebComponents.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();

void forgotPasswordWebDispose() {
  isSent = false;
  forgotPasswordWebFormKey.currentState.reset();
}

Widget forgotPasswordWebCard(BuildContext context, State state) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: forgotPasswordWebTitle(context),
      ),
      forgotPasswordWebUserInputField(context, state),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: forgotPasswordWebSwitchBack(context, state),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: forgotPasswordWebSend(context, state),
      ),
      isSent
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: forgotPasswordWebResend(context),
            )
          : Container(),
    ],
  );
}

Widget forgotPasswordWebTitle(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        getTranslated(context, "forgotPasswordTitle"),
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
        getTranslated(context, "forgotPasswordSubtitle"),
        softWrap: true,
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

String userEmail;
GlobalKey<FormFieldState> forgotPasswordWebFormKey =
    GlobalKey<FormFieldState>();
Widget forgotPasswordWebUserInputField(BuildContext context, State state) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: getDimension(
          context,
          true,
          Theme.of(context)
              .visualDensity
              .forgotPasswordWebUserInputFieldHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.forgotPasswordWebUserInputFieldWidth),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.forgotPasswordWebUserInputField,
      ),
      child: TextFormField(
        key: forgotPasswordWebFormKey,
        obscureText: false,
        onSaved: (email) => userEmail = email,
        onFieldSubmitted: (value) {
          forgotPasswordValidateSubmit(context, state);
        },
        autofocus: false,
        style: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordWebUserInputFieldText),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslated(context, "forgotPasswordFormEmail"),
          labelStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordWebUserInputFieldDecoration,
            fontSize: Theme.of(context)
                .textTheme
                .forgotPasswordWebUserInputFieldDecoration,
            fontWeight: Theme.of(context)
                .typography
                .forgotPasswordWebUserInputFieldDecoration,
          ),
          hintStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordWebUserInputFieldDecoration,
            fontSize: Theme.of(context)
                .textTheme
                .forgotPasswordWebUserInputFieldDecoration,
            fontWeight: Theme.of(context)
                .typography
                .forgotPasswordWebUserInputFieldDecoration,
          ),
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordWebUserInputFieldIconDecoration,
          ),
        ),
      ),
    ),
  );
}

Widget forgotPasswordWebSwitchBack(BuildContext context, State state) {
  return Container(
    width: getDimension(context, false,
        Theme.of(context).visualDensity.forgotPasswordWebRememberedWidth),
    child: GestureDetector(
      onTap: () {
        authWebForgotPasswordSwitchBack(context, state);
      },
      child: Text(
        getTranslated(context, "forgotPasswordAuthCallback"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.forgotPasswordWebRemembered,
          fontSize: Theme.of(context).textTheme.forgotPasswordWebRemembered,
          fontWeight: Theme.of(context).typography.forgotPasswordWebRemembered,
        ),
      ),
    ),
  );
}

bool isSent = false;
Widget forgotPasswordWebSend(BuildContext context, State state) {
  return Container(
    height: getDimension(context, true,
        Theme.of(context).visualDensity.forgotPasswordWebSendHeight),
    width: getDimension(context, false,
        Theme.of(context).visualDensity.forgotPasswordWebSendWidth),
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.forgotPasswordWebSend,
        borderRadius: BorderRadius.circular(30)),
    child: Material(
      color: Theme.of(context).colorScheme.materialTransparent,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.forgotPasswordWebSendInkWell,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onTap: () {
          forgotPasswordValidateSubmit(context, state);
        },
        child: Center(
          child: Text(
            getTranslated(context, "forgotPasswordSend"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.forgotPasswordWebSendText,
              fontSize: Theme.of(context).textTheme.forgotPasswordWebSendText,
              fontWeight:
                  Theme.of(context).typography.forgotPasswordWebSendText,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget forgotPasswordWebResend(BuildContext context) {
  return GestureDetector(
    onTap: () {
      forgotPasswordWebFormKey.currentState.save();
      firebaseAccounts.sendPasswordReset(context, userEmail);
    },
    child: RichText(
      text: TextSpan(
        text: getTranslated(context, "forgotPasswordResendPrimary"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.forgotPasswordWebResendPrimary,
          fontSize: Theme.of(context).textTheme.forgotPasswordWebResendPrimary,
          fontWeight:
              Theme.of(context).typography.forgotPasswordWebResendPrimary,
        ),
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(context, "forgotPasswordResendSecondary"),
            style: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .forgotPasswordWebResendSecondary,
              fontSize:
                  Theme.of(context).textTheme.forgotPasswordWebResendSecondary,
              fontWeight:
                  Theme.of(context).typography.forgotPasswordWebResendSecondary,
            ),
          ),
        ],
      ),
    ),
  );
}

void forgotPasswordValidateSubmit(BuildContext context, State state) {
  forgotPasswordWebFormKey.currentState.save();
  firebaseAccounts.sendPasswordReset(context, userEmail).then((_isSent) => {
        if (_isSent)
          {
            state.setState(() {
              isSent = true;
            })
          }
      });
}
