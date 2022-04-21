import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

void forgotPasswordMobileDispose() {
  _isSent = false;
  _forgotPasswordMobileFormKey.currentState.reset();
}

Widget forgotPasswordMobileTitle(BuildContext context) {
  return Column(
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
        padding: EdgeInsets.all(10),
      ),
      Text(
        getTranslated(context, "forgotPasswordSubtitle"),
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.forgotPasswordMobileSubtitle,
          fontSize: Theme.of(context).textTheme.forgotPasswordMobileSubtitle,
          fontWeight: Theme.of(context).typography.forgotPasswordMobileSubtitle,
        ),
      ),
    ],
  );
}

String _userEmail;
GlobalKey<FormFieldState> _forgotPasswordMobileFormKey =
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
      key: _forgotPasswordMobileFormKey,
      obscureText: false,
      onSaved: (email) => _userEmail = email,
      onFieldSubmitted: (value) {
        _forgotPasswordValidateSubmit(context, state);
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

bool _isSent = false;
Widget forgotPasswordMobileSend(BuildContext context, State state) {
  return Container(
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
          _forgotPasswordValidateSubmit(context, state);
        },
        child: Center(
          child: Text(
            getTranslated(context, "forgotPasswordSend"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.forgotPasswordMobileSendText,
              fontSize:
                  Theme.of(context).textTheme.forgotPasswordMobileSendText,
              fontWeight:
                  Theme.of(context).typography.forgotPasswordMobileSendText,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget forgotPasswordMobileResend(BuildContext context) {
  return _isSent
      ? GestureDetector(
          onTap: () {
            _forgotPasswordMobileFormKey.currentState.save();
            _firebaseAccounts.sendPasswordReset(context, _userEmail);
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

void _forgotPasswordValidateSubmit(BuildContext context, State state) {
  _forgotPasswordMobileFormKey.currentState.save();
  _firebaseAccounts.sendPasswordReset(context, _userEmail).then((_isSent) => {
        if (_isSent)
          {
            state.setState(() {
              _isSent = true;
            })
          }
      });
}
