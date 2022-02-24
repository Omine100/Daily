import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();

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

Widget forgotPasswordCenterPiece(BuildContext context) {
  return Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.forgotPasswordCenterPieceHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.forgotPasswordCenterPieceWidth),
      child: Image(
          image: AssetImage(
              "lib/assets/forgotPassword/forgotPassword_centerPiece.png")));
}

String userEmail;
final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
Widget forgotPasswordUserInputField(BuildContext context) {
  return Container(
    height: getDimension(context, true,
        Theme.of(context).visualDensity.forgotPasswordUserInputFieldHeight),
    width: getDimension(context, false,
        Theme.of(context).visualDensity.forgotPasswordUserInputFieldWidth),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Theme.of(context).colorScheme.forgotPasswordMobileUserInputField,
    ),
    child: TextFormField(
      key: formKey,
      obscureText: false,
      onSaved: (email) => userEmail = email,
      autofocus: false,
      style: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .forgotPasswordMobileUserInputFieldText),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: getTranslated(context, "forgotPasswordFormEmail"),
        labelStyle: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .forgotPasswordMobileUserInputFieldDecoration,
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
              .forgotPasswordMobileUserInputFieldDecoration,
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
              .forgotPasswordMobileUserInputFieldIconDecoration,
        ),
      ),
    ),
  );
}

bool isSent = false;
Widget forgotPasswordSend(BuildContext context, State state) {
  return Center(
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.forgotPasswordSendHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.forgotPasswordSendWidth),
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
            formKey.currentState.save();
            firebaseAccounts
                .sendPasswordReset(context, userEmail)
                .then((_isSent) => {
                      if (_isSent)
                        {
                          state.setState(() {
                            isSent = true;
                          })
                        }
                    });
            formKey.currentState.reset();
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, "forgotPasswordSend"),
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .forgotPasswordMobileSendText,
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

Widget forgotPasswordResend(BuildContext context) {
  return isSent
      ? GestureDetector(
          onTap: () {
            formKey.currentState.save();
            firebaseAccounts.sendPasswordReset(context, userEmail);
          },
          child: RichText(
            text: TextSpan(
              text: getTranslated(context, "forgotPasswordResendPrimary"),
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .forgotPasswordMobileResendPrimary,
                fontSize:
                    Theme.of(context).textTheme.forgotPasswordResendPrimary,
                fontWeight:
                    Theme.of(context).typography.forgotPasswordResendPrimary,
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
                        .forgotPasswordResendSecondary,
                    fontWeight: Theme.of(context)
                        .typography
                        .forgotPasswordResendSecondary,
                  ),
                ),
              ],
            ),
          ),
        )
      : Container();
}

void forgotPasswordDispose() {
  isSent = false;
}
