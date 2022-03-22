import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();

Widget forgotPasswordMobileTitle(BuildContext context) {
  return Container(
    width: getDimension(context, false,
        Theme.of(context).visualDensity.forgotPasswordMobileTitleWidth),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          getTranslated(context, "forgotPasswordTitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.forgotPasswordMobileTitle,
            fontSize: Theme.of(context).textTheme.forgotPasswordMobileTitle,
            fontWeight: Theme.of(context).typography.forgotPasswordMobileTitle,
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
            fontSize: Theme.of(context).textTheme.forgotPasswordMobileSubtitle,
            fontWeight:
                Theme.of(context).typography.forgotPasswordMobileSubtitle,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPasswordMobileCenterPiece(BuildContext context) {
  return Container(
      height: getDimension(
          context,
          true,
          Theme.of(context)
              .visualDensity
              .forgotPasswordMobileCenterPieceHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.forgotPasswordMobileCenterPieceWidth),
      child: Image(
          image: AssetImage(
              "lib/assets/forgotPassword/mobile/forgotPassword_centerPiece.png")));
}

String userEmail;
GlobalKey<FormFieldState> forgotPasswordMobileFormKey =
    GlobalKey<FormFieldState>();
Widget forgotPasswordMobileUserInputField(BuildContext context, State state) {
  return Container(
    height: getDimension(
        context,
        true,
        Theme.of(context)
            .visualDensity
            .forgotPasswordMobileUserInputFieldHeight),
    width: getDimension(
        context,
        false,
        Theme.of(context)
            .visualDensity
            .forgotPasswordMobileUserInputFieldWidth),
    alignment: Alignment.center,
    child: TextFormField(
      key: forgotPasswordMobileFormKey,
      obscureText: false,
      onSaved: (email) => userEmail = email,
      onFieldSubmitted: (value) {
        forgotPasswordValidateSubmit(context, state);
      },
      autofocus: false,
      style: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .forgotPasswordMobileUserInputFieldText),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordMobileUserInputFieldBorder,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .forgotPasswordMobileUserInputFieldBorder,
          ),
        ),
        hintText: getTranslated(context, "forgotPasswordFormEmail"),
        labelStyle: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .forgotPasswordMobileUserInputFieldDecoration,
          fontSize: Theme.of(context)
              .textTheme
              .forgotPasswordMobileUserInputFieldDecoration,
          fontWeight: Theme.of(context)
              .typography
              .forgotPasswordMobileUserInputFieldDecoration,
        ),
        hintStyle: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .forgotPasswordMobileUserInputFieldDecoration,
          fontSize: Theme.of(context)
              .textTheme
              .forgotPasswordMobileUserInputFieldDecoration,
          fontWeight: Theme.of(context)
              .typography
              .forgotPasswordMobileUserInputFieldDecoration,
        ),
        prefixIcon: Icon(
          Icons.email,
          color: Theme.of(context)
              .colorScheme
              .forgotPasswordMobileUserInputFieldIconDecoration,
        ),
      ),
    ),
  );
}

bool isSent = false;
Widget forgotPasswordMobileSend(BuildContext context, State state) {
  return Center(
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.forgotPasswordMobileSendHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.forgotPasswordMobileSendWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.forgotPasswordMobileSend,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Theme.of(context).colorScheme.materialTransparent,
        child: InkWell(
          splashColor:
              Theme.of(context).colorScheme.forgotPasswordMobileSendInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            forgotPasswordValidateSubmit(context, state);
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, "forgotPasswordSend"),
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .forgotPasswordMobileSendText,
                  fontSize:
                      Theme.of(context).textTheme.forgotPasswordMobileSendText,
                  fontWeight:
                      Theme.of(context).typography.forgotPasswordMobileSendText,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void forgotPasswordValidateSubmit(BuildContext context, State state) {
  forgotPasswordMobileFormKey.currentState.save();
  firebaseAccounts.sendPasswordReset(context, userEmail).then((_isSent) => {
        if (_isSent)
          {
            state.setState(() {
              isSent = true;
            })
          }
      });
}

Widget forgotPasswordMobileResend(BuildContext context) {
  return isSent
      ? GestureDetector(
          onTap: () {
            forgotPasswordMobileFormKey.currentState.save();
            firebaseAccounts.sendPasswordReset(context, userEmail);
          },
          child: RichText(
            text: TextSpan(
              text: getTranslated(context, "forgotPasswordResendPrimary"),
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .forgotPasswordMobileResendPrimary,
                fontSize: Theme.of(context)
                    .textTheme
                    .forgotPasswordMobileResendPrimary,
                fontWeight: Theme.of(context)
                    .typography
                    .forgotPasswordMobileResendPrimary,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: getTranslated(context, "forgotPasswordResendSecondary"),
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .forgotPasswordMobileResendSecondary,
                    fontSize: Theme.of(context)
                        .textTheme
                        .forgotPasswordMobileResendSecondary,
                    fontWeight: Theme.of(context)
                        .typography
                        .forgotPasswordMobileResendSecondary,
                  ),
                ),
              ],
            ),
          ),
        )
      : Container();
}

void forgotPasswordMobileDispose() {
  isSent = false;
}
