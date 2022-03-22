import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();
RouteNavigation routeNavigation = new RouteNavigation();
bool isWelcome = true, isSignIn;

void setSignIn(bool value) {
  isSignIn ??= value;
}

Widget authMobileTitle(BuildContext context) {
  return Text(
    getTranslated(context, "welcomeTitle"),
    style: TextStyle(
      color: Theme.of(context).colorScheme.authMobileTitle,
      fontSize: Theme.of(context).textTheme.authMobileTitle,
      fontWeight: Theme.of(context).typography.authMobileTitle,
    ),
  );
}

Widget authMobileCenterPiece(BuildContext context, State state) {
  return GestureDetector(
    onHorizontalDragDown: (value) {
      state.setState(() {
        isWelcome = true;
      });
    },
    child: Container(
        height: getDimension(context, true,
            Theme.of(context).visualDensity.authMobileCenterPieceHeight),
        child: Image(
            fit: BoxFit.fitHeight,
            image: isDark.value
                ? AssetImage("lib/assets/auth/web/auth_centerPiece_dark.jpg")
                : AssetImage(
                    "lib/assets/auth/web/auth_centerPiece_light.jpg"))),
  );
}

Widget authMobileCardContainer(BuildContext context, State state) {
  return SingleChildScrollView(
    child: AnimatedContainer(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.authWebCard),
      height: isWelcome
          ? getDimension(context, true,
              Theme.of(context).visualDensity.authMobileCardWelcomeHeight)
          : getDimension(context, true,
              Theme.of(context).visualDensity.authMobileCardInputHeight),
      width: isWelcome
          ? getDimension(context, false,
              Theme.of(context).visualDensity.authMobileCardWelcomeWidth)
          : getDimension(context, false,
              Theme.of(context).visualDensity.authMobileCardInputWidth),
      constraints: BoxConstraints(minHeight: 200, minWidth: 200),
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: isWelcome
          ? authMobileCard(context, state)
          : authMobileCardInput(context, state, false),
    ),
  );
}

Widget authMobileCard(BuildContext context, State state) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      authMobileCardText(context),
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: authMobileGetStarted(context, state),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: authMobileSwitch(context, state),
      )
    ],
  );
}

Widget authMobileCardText(BuildContext context) {
  return Column(
    children: [
      Text(
        getTranslated(context, "welcomeCardText"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.authMobileCardText,
          fontSize: Theme.of(context).textTheme.authMobileCardText,
          fontWeight: Theme.of(context).typography.authMobileCardText,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          getTranslated(context, "welcomeCardSubText"),
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.authMobileCardSubText,
            fontSize: Theme.of(context).textTheme.authMobileCardSubText,
            fontWeight: Theme.of(context).typography.authMobileCardSubText,
          ),
        ),
      ),
    ],
  );
}

Widget authMobileCardInput(BuildContext context, State state, bool isSmall) {
  return Stack(
    alignment: Alignment.center,
    children: [
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            authMobileUserInput(context),
            isSignIn
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: authMobileForgotPassword(context),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: authMobilePolicyAndTaC(context),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: authMobileGetStarted(context, state),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: authMobileSwitch(context, state),
            ),
          ],
        ),
      ),
    ],
  );
}

String userName = "", userEmail = "", userPass = "", userPassVerify = "";
GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
Widget authMobileUserInput(BuildContext context) {
  return Form(
    key: authFormKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isSignIn
            ? Container()
            : authMobileUserInputField(
                context, (name) => {userName = name}, "authFormName", false),
        authMobileUserInputField(
            context, (email) => {userEmail = email}, "authFormEmail", false),
        authMobileUserInputField(
            context, (pass) => {userPass = pass}, "authFormPass", true),
        isSignIn
            ? Container()
            : authMobileUserInputField(
                context,
                (passVerify) => {userPassVerify = passVerify},
                "authFormPassVerify",
                true),
      ],
    ),
  );
}

bool isVisible = false;
Widget authMobileUserInputField(
    BuildContext context, Function onSaved, String authForm, bool isVariable) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authMobileUserInputFieldHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.authMobileUserInputFieldWidth),
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: isVariable ? !isVisible : false,
        onSaved: onSaved,
        autofocus: false,
        style: TextStyle(
            color: Theme.of(context).colorScheme.authMobileUserInputFieldText),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.authMobileUserInputFieldBorder,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.authMobileUserInputFieldBorder,
            ),
          ),
          hintText: getTranslated(context, authForm),
          labelStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .authMobileUserInputFieldDecoration,
            fontSize:
                Theme.of(context).textTheme.authMobileUserInputFieldDecoration,
            fontWeight:
                Theme.of(context).typography.authMobileUserInputFieldDecoration,
          ),
          hintStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .authMobileUserInputFieldDecoration,
            fontSize:
                Theme.of(context).textTheme.authMobileUserInputFieldDecoration,
            fontWeight:
                Theme.of(context).typography.authMobileUserInputFieldDecoration,
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

Widget authMobileForgotPassword(BuildContext context) {
  return Container(
    width: getDimension(context, false,
        Theme.of(context).visualDensity.authMobileForgotPasswordWidth),
    alignment: Alignment.centerLeft,
    child: GestureDetector(
      onTap: () {
        context.router.push(ForgotPasswordScreen());
      },
      child: Text(
        getTranslated(context, "authForgotPassword"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.authMobileForgotPassword,
          fontSize: Theme.of(context).textTheme.authMobileForgotPassword,
          fontWeight: Theme.of(context).typography.authMobileForgotPassword,
        ),
      ),
    ),
  );
}

Widget authMobilePolicyAndTaC(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Center(
        child: Text.rich(TextSpan(
            text: getTranslated(context, "authPolicyAndTaCPrimary") + " ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.authMobilePolicyAndTaC,
              fontSize: Theme.of(context).textTheme.authMobilePolicyAndTaC,
              fontWeight: Theme.of(context).typography.authMobilePolicyAndTaC,
            ),
            children: <TextSpan>[
          TextSpan(
              text: getTranslated(context, "authPolicyAndTaCPrivacy"),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.authMobilePolicyAndTaC,
                  fontSize: Theme.of(context).textTheme.authMobilePolicyAndTaC,
                  fontWeight:
                      Theme.of(context).typography.authMobilePolicyAndTaC,
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
                fontSize: Theme.of(context).textTheme.authMobilePolicyAndTaC,
                fontWeight: Theme.of(context).typography.authMobilePolicyAndTaC,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: getTranslated(context, "authPolicyAndTaCConditions"),
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .authMobilePolicyAndTaC,
                        fontSize:
                            Theme.of(context).textTheme.authMobilePolicyAndTaC,
                        fontWeight:
                            Theme.of(context).typography.authMobilePolicyAndTaC,
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

Widget authMobileGetStarted(BuildContext context, State state) {
  return Center(
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authMobileGetStartedHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.authMobileGetStartedWidth),
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
            if (isWelcome) {
              state.setState(() {
                isWelcome = false;
                isSignIn = false;
              });
            } else {
              authValidateSubmit(context, state);
            }
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(
                    context,
                    isWelcome
                        ? "welcomeGetStarted"
                        : (isSignIn ? "authSignIn" : "authSignUp")),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.authMobileGetStartedText,
                  fontSize:
                      Theme.of(context).textTheme.authMobileGetStartedText,
                  fontWeight:
                      Theme.of(context).typography.authMobileGetStartedText,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget authMobileSwitch(BuildContext context, State state) {
  return GestureDetector(
    onTap: () {
      if (isWelcome) {
        isWelcome = false;
        isSignIn = true;
        state.setState(() {});
      } else {
        isSignIn = !isSignIn;
        state.setState(() {});
      }
    },
    child: RichText(
      text: TextSpan(
        text: getTranslated(
            context,
            isWelcome
                ? "authSwitchSignInPrimary"
                : (isSignIn
                    ? "authSwitchSignUpPrimary"
                    : "authSwitchSignInPrimary")),
        style: TextStyle(
          color: Theme.of(context).colorScheme.authMobileSwitchPrimary,
          fontSize: Theme.of(context).textTheme.authMobileSwitchPrimary,
          fontWeight: Theme.of(context).typography.authMobileSwitchPrimary,
        ),
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(
                context,
                isWelcome
                    ? "authSwitchSignInSecondary"
                    : (isSignIn
                        ? "authSwitchSignUpSecondary"
                        : "authSwitchSignInSecondary")),
            style: TextStyle(
              color: Theme.of(context).colorScheme.authMobileSwitchSecondary,
              fontSize: Theme.of(context).textTheme.authMobileSwitchSecondary,
              fontWeight:
                  Theme.of(context).typography.authMobileSwitchSecondary,
            ),
          ),
        ],
      ),
    ),
  );
}

void authValidateSubmit(BuildContext context, State state) async {
  authFormKey.currentState.save();
  if (isSignIn)
    firebaseAccounts
        .signInEmailAndPassword(context, userEmail, userPass)
        .then((value) {
      if (value) {
        context.router.push(HomeScreen());
        authFormKey.currentState.reset();
      }
    });
  else
    firebaseAccounts
        .signUpEmailAndPassword(
            context, userEmail, userPass, userPassVerify, userName)
        .then((value) {
      if (value) {
        context.router.push(HomeScreen());
        authFormKey.currentState.reset();
      }
    });
  firebaseAccounts.setCurrentUserProfilePicURL(state);
}
