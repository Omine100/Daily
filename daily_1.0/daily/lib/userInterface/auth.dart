import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/userInterface/authComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/utilities/managementUtil/validation.dart';

class AuthScreen extends StatefulWidget {
  final bool isSignIn;
  AuthScreen({this.isSignIn});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.welcomeBackground,
          ),
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 1.5),
          child: Responsive(
            desktop: AuthScreenDesktop(context, this, widget.isSignIn),
            tablet: AuthScreenTablet(context, this, widget.isSignIn),
            mobile: AuthScreenMobile(context, this, widget.isSignIn),
          )),
    ));
  }
}

AuthScreenDesktop(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
    ],
  );
}

AuthScreenTablet(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
    ],
  );
}

String userName = "", userEmail = "", userPass = "";
AuthScreenMobile(BuildContext context, State state, bool isSignIn) {
  return Stack(
    children: [
      Positioned(top: 100, left: 100, child: authProfilePicker(context, state)),
      Positioned(
        top: 400,
        child: isSignIn
            ? Container(
                height: 0,
              )
            : authUserInputField(context, (name) {
                if (!isEmail(name))
                  return getTranslated(context, 'authValidatorNameFormat');
                return null;
              }, (name) => userName, "authFormName", false),
      ),
      Positioned(
        top: 475,
        child: authUserInputField(context, (email) {
          if (!isEmail(email))
            return getTranslated(context, 'authValidatorEmailFormat');
          return null;
        }, (email) => userEmail, "authFormEmail", false),
      ),
      Positioned(
          top: 550,
          child: authUserInputField(
            context,
            (pass) {
              if (!isPassword(pass))
                return getTranslated(context, 'authValidatorPassFormat');
              return null;
            },
            (pass) => userPass,
            "authFormPass",
            true,
          ))
    ],
  );
}
