import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/dimensions.dart';
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
      AdaptiveText(getTranslated(context, "forgotPasswordTitle"),
          style: Theme.of(context).textTheme.titleLarge),
      Padding(
        padding: EdgeInsets.all(10),
      ),
      Text(getTranslated(context, "forgotPasswordSubtitle"),
          softWrap: true,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium),
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
        color: Theme.of(context).colorScheme.secondaryContainer,
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
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslated(context, "forgotPasswordFormEmail"),
          labelStyle: Theme.of(context).textTheme.labelMedium,
          hintStyle: Theme.of(context).textTheme.labelMedium,
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
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
      child: Text(getTranslated(context, "forgotPasswordAuthCallback"),
          style: Theme.of(context).textTheme.bodyMedium),
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
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(30)),
    child: Material(
        color: Colors.transparent,
        child: _formComplete
            ? InkWell(
                splashColor: _formComplete
                    ? Theme.of(context).colorScheme.surfaceTint
                    : Colors.transparent,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onTap: () {
                  _formComplete
                      ? _forgotPasswordValidateSubmit(context, state)
                      : null;
                },
                child: Center(
                  child: Text(getTranslated(context, "forgotPasswordSend"),
                      style: Theme.of(context).textTheme.displaySmall),
                ),
              )
            : Container(
                child: Center(
                  child: Text(getTranslated(context, "forgotPasswordSend"),
                      style: Theme.of(context).textTheme.displaySmall),
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
        style: Theme.of(context).textTheme.headlineSmall,
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(context, "forgotPasswordResendSecondary"),
            style: Theme.of(context).textTheme.labelSmall,
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
