import 'package:daily/servicesLocal/adaptive.dart';
import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';
import 'package:daily/userInterface/auth/authWebComponents.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

void forgotPasswordWebDispose() {
  _isSent = false;
  _forgotPasswordWebFormKey.currentState.reset();
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
      _isSent
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
      AdaptiveText(
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

bool _formComplete = false;
void _updateFormProgress(State state) {
  _formComplete = false;
  if (!_userEmail.isEmpty) _formComplete = true;
  state.setState(() {
    _formComplete;
  });
}

String _userEmail = "";
GlobalKey<FormFieldState> _forgotPasswordWebFormKey =
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
        textAlignVertical: TextAlignVertical.center,
        key: _forgotPasswordWebFormKey,
        obscureText: false,
        onChanged: (email) {
          _userEmail = email;
          _updateFormProgress(state);
        },
        onSaved: (email) => {_userEmail = email},
        onFieldSubmitted: (value) {
          _forgotPasswordValidateSubmit(context, state);
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
  ).showClickOnHover;
}

bool _isSent = false;
Widget forgotPasswordWebSend(BuildContext context, State state) {
  return Container(
    height: getDimension(context, true,
        Theme.of(context).visualDensity.forgotPasswordWebSendHeight),
    width: getDimension(context, false,
        Theme.of(context).visualDensity.forgotPasswordWebSendWidth),
    decoration: BoxDecoration(
        color: _formComplete
            ? Theme.of(context).colorScheme.forgotPasswordWebSend
            : Theme.of(context).colorScheme.forgotPasswordWebSendDeactived,
        borderRadius: BorderRadius.circular(30)),
    child: Material(
        color: Theme.of(context).colorScheme.materialTransparent,
        child: _formComplete
            ? InkWell(
                splashColor: _formComplete
                    ? Theme.of(context).colorScheme.forgotPasswordWebSendInkWell
                    : Theme.of(context)
                        .colorScheme
                        .forgotPasswordWebSendInkWellDeactivated,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onTap: () {
                  _formComplete
                      ? _forgotPasswordValidateSubmit(context, state)
                      : null;
                },
                child: Center(
                  child: Text(
                    getTranslated(context, "forgotPasswordSend"),
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .forgotPasswordWebSendText,
                      fontSize:
                          Theme.of(context).textTheme.forgotPasswordWebSendText,
                      fontWeight: Theme.of(context)
                          .typography
                          .forgotPasswordWebSendText,
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text(
                    getTranslated(context, "forgotPasswordSend"),
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .forgotPasswordWebSendText,
                      fontSize:
                          Theme.of(context).textTheme.forgotPasswordWebSendText,
                      fontWeight: Theme.of(context)
                          .typography
                          .forgotPasswordWebSendText,
                    ),
                  ),
                ),
              )),
  );
}

Widget forgotPasswordWebResend(BuildContext context) {
  return GestureDetector(
    onTap: () {
      _forgotPasswordWebFormKey.currentState.save();
      _firebaseAccounts.sendPasswordReset(context, _userEmail);
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
  ).showClickOnHover;
}

void _forgotPasswordValidateSubmit(BuildContext context, State state) {
  _forgotPasswordWebFormKey.currentState.save();
  _firebaseAccounts.sendPasswordReset(context, _userEmail).then((_isSent) => {
        if (_isSent)
          {
            state.setState(() {
              _isSent = true;
            })
          }
      });
}
