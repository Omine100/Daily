import 'package:flutter/material.dart';
import 'dart:math';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/userInterface/home.dart';
import 'package:daily/utilities/managementUtil/validation.dart';

Widget authTitle(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    width: getDimension(
        context, false, Theme.of(context).visualDensity.authTitleWidth),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, "authTitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.authTitle,
            fontSize: Theme.of(context).textTheme.authTitle,
            fontWeight: Theme.of(context).typography.authTitle,
          ),
        ),
        Text(
          getTranslated(context, "authSubtitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.authSubtitle,
            fontSize: Theme.of(context).textTheme.authSubtitle,
            fontWeight: Theme.of(context).typography.authSubtitle,
          ),
        ),
      ],
    ),
  );
}

String userName = "", userEmail = "", userPass = "";
Column authUserInput(BuildContext context, bool isSignIn) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      isSignIn
          ? Container(
              height: 0,
            )
          : authUserInputField(context, (name) {
              if (!isEmail(name))
                return getTranslated(context, 'authValidatorNameFormat');
              return null;
            }, (name) => userName, "authFormName", false),
      authUserInputField(context, (email) {
        if (!isEmail(email))
          return getTranslated(context, 'authValidatorEmailFormat');
        return null;
      }, (email) => userEmail, "authFormEmail", false),
      authUserInputField(
        context,
        (pass) {
          if (!isPassword(pass))
            return getTranslated(context, 'authValidatorPassFormat');
          return null;
        },
        (pass) => userPass,
        "authFormPass",
        true,
      )
    ],
  );
}

bool isVisible = false;
Widget authUserInputField(BuildContext context, Function validator,
    Function onSaved, String authForm, bool isVariable) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 60,
      width: 350,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        obscureText: isVisible,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslated(context, authForm),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.authUserInputDecoration,
            fontSize: Theme.of(context).textTheme.authUserInputDecoration,
            fontWeight: Theme.of(context).typography.authUserInputDecoration,
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.authUserInputDecoration,
            fontSize: Theme.of(context).textTheme.authUserInputDecoration,
            fontWeight: Theme.of(context).typography.authUserInputDecoration,
          ),
          prefixIcon: Icon(
            authForm != "authFormEmail"
                ? (authForm == "authFormPass" ? Icons.lock : Icons.person)
                : Icons.email,
            color: Theme.of(context).colorScheme.userIStandardsTextInputIcon,
          ),
          suffixIcon: isVariable
              ? IconButton(
                  onPressed: () {
                    isVisible = !isVisible;
                  },
                  icon: Icon(Icons.lock),
                )
              : null,
        ),
      ),
    ),
  );
}

Widget authForgotPassword(BuildContext context) {
  return GestureDetector(
    onTap: () {
      RouteNavigation().routePage(context, HomeScreen());
    },
    child: Text(
      getTranslated(context, "authForgotPassword"),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget authGetStarted(BuildContext context, bool isSignIn) {
  return Center(
    child: Container(
      height: getDimension(
          context, true, Theme.of(context).visualDensity.authGetStartedHeight),
      width: getDimension(
          context, false, Theme.of(context).visualDensity.authGetStartedWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.authGetStarted,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.authGetStartedInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            RouteNavigation().routePage(context, HomeScreen());
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, isSignIn ? "authSignIn" : "authSignUp"),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.authGetStartedText,
                  fontSize: Theme.of(context).textTheme.authGetStartedText,
                  fontWeight: Theme.of(context).typography.authGetStartedText,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget authSwitch(BuildContext context, bool isSignIn) {
  return RichText(
    text: TextSpan(
      text: getTranslated(context,
          isSignIn ? "authSwitchSignUpPrimary" : "authSwitchSignInPrimary"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.authSwitchPrimary,
        fontSize: Theme.of(context).textTheme.authSwitchPrimary,
        fontWeight: Theme.of(context).typography.authSwitchPrimary,
      ),
      children: <TextSpan>[
        TextSpan(
          text: getTranslated(
              context,
              isSignIn
                  ? "authSwitchSignUpSecondary"
                  : "authSwitchSignInSecondary"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.authSwitchSecondary,
            fontSize: Theme.of(context).textTheme.authSwitchSecondary,
            fontWeight: Theme.of(context).typography.authSwitchSecondary,
          ),
        ),
      ],
    ),
  );
}

List<Image> _images = [
  Image(image: AssetImage("lib/assets/auth/auth_carouselOne.png")),
  Image(image: AssetImage("lib/assets/auth/auth_carouselTwo.png")),
  Image(image: AssetImage("lib/assets/auth/auth_carouselThree.png")),
];
Widget authCenterPiece(BuildContext context, State state) {
  return Container(
      height: 330, child: _images[Random().nextInt(_images.length)]);
}
