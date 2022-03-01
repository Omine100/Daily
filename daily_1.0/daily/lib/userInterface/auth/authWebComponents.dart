import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();
RouteNavigation routeNavigation = new RouteNavigation();
bool isSignIn = true;

Widget authWebTitle(BuildContext context, bool isSignIn) {
  return Center(
    child: AdaptiveText(
      isSignIn ? "Login to Daily" : "Register for Daily",
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 45,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget authWebCard(BuildContext context, State state, bool isSmall) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: isSmall
        ? MediaQuery.of(context).size.width * 0.75
        : MediaQuery.of(context).size.width * 0.5,
    decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: isSmall
            ? BorderRadius.all(Radius.circular(50))
            : BorderRadius.only(
                topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: authWebTitle(context, isSignIn),
            ),
            authWebUserInput(context, isSmall),
            isSignIn
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: authWebForgotPassword(context, isSmall),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: authWebPolicyAndTaC(context),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: authWebGetStarted(context, isSmall, state),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          child: authWebSwitch(context, state),
        ),
      ],
    ),
  );
}

String userName = "", userEmail = "", userPass = "", userPassVerify = "";
final formKey = GlobalKey<FormState>();
Widget authWebUserInput(BuildContext context, bool isSmall) {
  return Form(
      key: formKey,
      child: Center(
        child: Container(
          width: getDimension(context, false, isSmall ? 0.5 : 0.35),
          child: Column(
            children: [
              isSignIn
                  ? Container()
                  : authWebUserInputField(context, (name) => {userName = name},
                      "authFormName", false),
              authWebUserInputField(context, (email) => {userEmail = email},
                  "authFormEmail", false),
              authWebUserInputField(
                  context, (pass) => {userPass = pass}, "authFormPass", true),
              isSignIn
                  ? Container()
                  : authWebUserInputField(
                      context,
                      (passVerify) => {userPassVerify = passVerify},
                      "authFormPassVerify",
                      true),
            ],
          ),
        ),
      ));
}

bool isVisible = false;
Widget authWebUserInputField(
    BuildContext context, Function onSaved, String authForm, bool isVariable) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authUserInputFieldHeight),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.authMobileUserInputField,
      ),
      child: TextFormField(
        obscureText: isVariable ? !isVisible : false,
        onSaved: onSaved,
        autofocus: false,
        style: TextStyle(
            color: Theme.of(context).colorScheme.authMobileUserInputFieldText),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslated(context, authForm),
          labelStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .authMobileUserInputFieldDecoration,
            fontSize: Theme.of(context).textTheme.authUserInputFieldDecoration,
            fontWeight:
                Theme.of(context).typography.authUserInputFieldDecoration,
          ),
          hintStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .authMobileUserInputFieldDecoration,
            fontSize: Theme.of(context).textTheme.authUserInputFieldDecoration,
            fontWeight:
                Theme.of(context).typography.authUserInputFieldDecoration,
          ),
          prefixIcon: Icon(
            authForm != "authFormEmail"
                ? (authForm == "authFormPass" ||
                        authForm == "authFormPassVerify"
                    ? Icons.lock
                    : Icons.person)
                : Icons.email,
            color: Theme.of(context)
                .colorScheme
                .authMobileUserInputFieldIconDecoration,
          ),
          suffixIcon: isVariable
              ? IconButton(
                  splashColor:
                      Theme.of(context).colorScheme.materialTransparent,
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                    currentFocus.canRequestFocus = false;
                    isVisible = !isVisible;
                    Future.delayed(Duration(milliseconds: 100), () {
                      currentFocus.canRequestFocus = true;
                    });
                  },
                  icon: Icon(
                    isVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Theme.of(context)
                        .colorScheme
                        .authMobileUserInputFieldIconDecoration,
                  ),
                )
              : null,
        ),
      ),
    ),
  );
}

Widget authWebForgotPassword(BuildContext context, bool isSmall) {
  return Container(
    width: getDimension(context, false, isSmall ? 0.47 : 0.33),
    alignment: Alignment.centerLeft,
    child: GestureDetector(
      onTap: () {
        context.router.push(ForgotPasswordScreen());
      },
      child: Text(
        getTranslated(context, "authForgotPassword"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.authMobileForgotPassword,
          fontSize: Theme.of(context).textTheme.authForgotPassword,
          fontWeight: Theme.of(context).typography.authForgotPassword,
        ),
      ),
    ),
  );
}

Widget authWebPolicyAndTaC(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Center(
        child: Text.rich(TextSpan(
            text: getTranslated(context, "authPolicyAndTaCPrimary") + " ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.authMobilePolicyAndTaC,
              fontSize: Theme.of(context).textTheme.authPolicyAndTaC,
              fontWeight: Theme.of(context).typography.authPolicyAndTaC,
            ),
            children: <TextSpan>[
          TextSpan(
              text: getTranslated(context, "authPolicyAndTaCPrivacy"),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.authMobilePolicyAndTaC,
                  fontSize: Theme.of(context).textTheme.authPolicyAndTaC,
                  fontWeight: Theme.of(context).typography.authPolicyAndTaC,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  routeNavigation.routeTextViewer(context, getPolicyFilePath());
                }),
          TextSpan(
              text: "\n" +
                  getTranslated(context, "authPolicyAndTaCSeconday") +
                  " ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.authMobilePolicyAndTaC,
                fontSize: Theme.of(context).textTheme.authPolicyAndTaC,
                fontWeight: Theme.of(context).typography.authPolicyAndTaC,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: getTranslated(context, "authPolicyAndTaCConditions"),
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .authMobilePolicyAndTaC,
                        fontSize: Theme.of(context).textTheme.authPolicyAndTaC,
                        fontWeight:
                            Theme.of(context).typography.authPolicyAndTaC,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        routeNavigation.routeTextViewer(
                            context, getTaCFilePath());
                      })
              ])
        ]))),
  );
}

Widget authWebGetStarted(BuildContext context, bool isSmall, State state) {
  return Center(
    child: Container(
      height: getDimension(
          context, true, Theme.of(context).visualDensity.authGetStartedHeight),
      width: getDimension(context, false,
              Theme.of(context).visualDensity.authGetStartedWidth) *
          0.45,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.authMobileGetStarted,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Theme.of(context).colorScheme.materialTransparent,
        child: InkWell(
          splashColor:
              Theme.of(context).colorScheme.authMobileGetStartedInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            authWebValidateSubmit(context, state);
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, isSignIn ? "authSignIn" : "authSignUp"),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.authMobileGetStartedText,
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

Widget authWebSwitch(BuildContext context, State state) {
  return GestureDetector(
    onTap: () {
      isSignIn = !isSignIn;
      state.setState(() {});
    },
    child: RichText(
      text: TextSpan(
        text: getTranslated(context,
            isSignIn ? "authSwitchSignUpPrimary" : "authSwitchSignInPrimary"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.authMobileSwitchPrimary,
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
              color: Theme.of(context).colorScheme.authMobileSwitchSecondary,
              fontSize: Theme.of(context).textTheme.authSwitchSecondary,
              fontWeight: Theme.of(context).typography.authSwitchSecondary,
            ),
          ),
        ],
      ),
    ),
  );
}

void authWebValidateSubmit(BuildContext context, State state) async {
  formKey.currentState.save();
  if (isSignIn)
    firebaseAccounts
        .signInEmailAndPassword(context, userEmail, userPass)
        .then((value) {
      if (value) context.router.push(HomeScreen());
      firebaseAccounts.setCurrentUserProfilePicURL(state);
    });
  else
    firebaseAccounts
        .signUpEmailAndPassword(
            context, userEmail, userPass, userPassVerify, userName)
        .then((value) {
      if (value) context.router.push(HomeScreen());
      firebaseAccounts.setCurrentUserProfilePicURL(state);
    });
}

Widget authWebCenterPiece(BuildContext context, State state, bool isSmall) {
  return Container(
      height: getDimension(context, true, 1.0),
      width: isSmall
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.6,
      child: Image(
          fit: BoxFit.cover,
          image: isDark.value
              ? AssetImage("lib/assets/auth/web/auth_centerPiece_dark.jpg")
              : AssetImage("lib/assets/auth/web/auth_centerPiece_light.jpg")));
}
