import 'package:flutter/material.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/dimensions.dart';

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
      Text(getTranslated(context, "forgotPasswordTitle"),
          style: Theme.of(context).textTheme.titleSmall),
      Padding(
        padding: EdgeInsets.all(10),
      ),
      Text(getTranslated(context, "forgotPasswordSubtitle"),
          softWrap: true,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1),
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
      textAlignVertical: TextAlignVertical.center,
      key: _forgotPasswordMobileFormKey,
      obscureText: false,
      onChanged: (email) {
        _userEmail = email;
        print(_userEmail);
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
        labelStyle: customTextThemes.inputField,
        hintStyle: customTextThemes.inputField,
        prefixIcon: Icon(
          Icons.email,
          color: customColors.icon,
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
                      style: Theme.of(context).textTheme.button),
                ),
              )
            : Container(
                child: Center(
                  child: Text(getTranslated(context, "forgotPasswordSend"),
                      style: Theme.of(context).textTheme.button),
                ),
              )),
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
