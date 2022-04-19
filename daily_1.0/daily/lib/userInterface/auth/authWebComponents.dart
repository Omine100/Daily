import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/datastructures/structures.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/constraints.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';
import 'package:daily/userInterface/forgotPassword/forgotPasswordWebComponents.dart';
import 'package:daily/userInterface/verify/verifyWebComponents.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
AuthControls _authControls = AuthControls.signUp;

Widget authWebCenterPiece(BuildContext context) {
  return Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authWebCenterPieceHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.authWebCenterPieceWidth),
      child: Image(
          fit: BoxFit.cover,
          image: isDark.value
              ? AssetImage("lib/assets/auth/web/auth_centerPiece_dark.jpg")
              : AssetImage("lib/assets/auth/web/auth_centerPiece_light.jpg")));
}

Widget authWebCardContainer(BuildContext context, State state, bool isSmall) {
  return SingleChildScrollView(
      child: Container(
          constraints: Theme.of(context).bottomAppBarTheme.authWebCardContainer,
          height: getDimension(context, true,
              Theme.of(context).visualDensity.authWebCardContainerHeight),
          width: getDimension(context, false,
              Theme.of(context).visualDensity.authWebCardContainerWidth),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.authWebCardContainer,
              borderRadius: isSmall
                  ? BorderRadius.all(Radius.circular(50))
                  : BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
          child: authWebCardPick(context, state, isSmall)));
}

Widget authWebCardPick(BuildContext context, State state, bool isSmall) {
  switch (_authControls) {
    case AuthControls.welcome:
      return Container();
    case AuthControls.signIn:
      return authWebCard(context, state, isSmall, true);
    case AuthControls.signUp:
      return authWebCard(context, state, isSmall, false);
    case AuthControls.forgotPassword:
      return forgotPasswordWebCard(context, state);
    case AuthControls.verify:
      return verifyWebCard(context, state, _userEmail, _userPass);
    default:
      return Container();
  }
}

Widget authWebCard(
    BuildContext context, State state, bool isSmall, bool isSignIn) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: authWebTitle(context, isSignIn),
          ),
          authWebUserInput(context, state, isSmall, isSignIn),
          isSignIn
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: authWebForgotPassword(context, state, isSmall),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: authWebPolicyAndTaC(context),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: authWebGetStarted(context, state, isSmall, isSignIn),
          ),
        ],
      ),
      Positioned(
        bottom: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.authWebSwitchBottom),
        child: authWebSwitch(context, state, isSignIn),
      ),
    ],
  );
}

Widget authWebTitle(BuildContext context, bool isSignIn) {
  return Center(
    child: AdaptiveText(
      getTranslated(context, isSignIn ? "authTitleSignIn" : "authTitleSignUp"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.authWebTitle,
        fontSize: Theme.of(context).textTheme.authWebTitle,
        fontWeight: Theme.of(context).typography.authWebTitle,
      ),
    ),
  );
}

String _userName = "", _userEmail = "", _userPass = "", _userPassVerify = "";
GlobalKey<FormState> _authWebFormKey = GlobalKey<FormState>();
Widget authWebUserInput(
    BuildContext context, State state, bool isSmall, bool isSignIn) {
  return Form(
      key: _authWebFormKey,
      child: Center(
        child: Column(
          children: [
            isSignIn
                ? Container()
                : authWebUserInputField(
                    context,
                    state,
                    (name) => {_userName = name},
                    "authFormName",
                    false,
                    isSignIn),
            authWebUserInputField(
                context,
                state,
                (email) => {_userEmail = email},
                "authFormEmail",
                false,
                isSignIn),
            authWebUserInputField(context, state, (pass) => {_userPass = pass},
                "authFormPass", true, isSignIn),
            isSignIn
                ? Container()
                : authWebUserInputField(
                    context,
                    state,
                    (passVerify) => {_userPassVerify = passVerify},
                    "authFormPassVerify",
                    true,
                    isSignIn),
          ],
        ),
      ));
}

bool _isVisible = false;
Widget authWebUserInputField(BuildContext context, State state,
    Function onSaved, String authForm, bool isVariable, bool isSignIn) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      constraints: Theme.of(context).bottomAppBarTheme.authWebUserInputField,
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authWebUserInputFieldHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.authWebUserInputFieldWidth),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.authWebUserInputField,
      ),
      child: TextFormField(
        obscureText: isVariable ? !_isVisible : false,
        onSaved: onSaved,
        onFieldSubmitted: (value) {
          authWebValidateSubmit(context, state, isSignIn);
        },
        autofocus: false,
        style: TextStyle(
            color: Theme.of(context).colorScheme.authWebUserInputFieldText),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslated(context, authForm),
          labelStyle: TextStyle(
            color:
                Theme.of(context).colorScheme.authWebUserInputFieldDecoration,
            fontSize:
                Theme.of(context).textTheme.authWebUserInputFieldDecoration,
            fontWeight:
                Theme.of(context).typography.authWebUserInputFieldDecoration,
          ),
          hintStyle: TextStyle(
            color:
                Theme.of(context).colorScheme.authWebUserInputFieldDecoration,
            fontSize:
                Theme.of(context).textTheme.authWebUserInputFieldDecoration,
            fontWeight:
                Theme.of(context).typography.authWebUserInputFieldDecoration,
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
                .authWebUserInputFieldIconDecoration,
          ),
          suffixIcon: isVariable
              ? IconButton(
                  splashColor:
                      Theme.of(context).colorScheme.materialTransparent,
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                    currentFocus.canRequestFocus = false;
                    _isVisible = !_isVisible;
                    Future.delayed(Duration(milliseconds: 100), () {
                      currentFocus.canRequestFocus = true;
                    });
                  },
                  icon: Icon(
                    _isVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Theme.of(context)
                        .colorScheme
                        .authWebUserInputFieldIconDecoration,
                  ),
                )
              : null,
        ),
      ),
    ),
  );
}

Widget authWebForgotPassword(BuildContext context, State state, bool isSmall) {
  return Container(
    width: getDimension(context, false,
        Theme.of(context).visualDensity.authWebForgotPasswordWidth),
    alignment: Alignment.centerLeft,
    child: GestureDetector(
      onTap: () {
        state.setState(() {
          _authControls = AuthControls.forgotPassword;
        });
      },
      child: Text(
        getTranslated(context, "authForgotPassword"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.authWebForgotPassword,
          fontSize: Theme.of(context).textTheme.authWebForgotPassword,
          fontWeight: Theme.of(context).typography.authWebForgotPassword,
        ),
      ),
    ),
  );
}

Widget authWebPolicyAndTaC(BuildContext context) {
  return Container(
    width: getDimension(context, false,
        Theme.of(context).visualDensity.authWebPolicyAndTacWidth),
    alignment: Alignment.center,
    child: Center(
        child: Text.rich(TextSpan(
            text: getTranslated(context, "authPolicyAndTaCPrimary") + " ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.authWebPolicyAndTaC,
              fontSize: Theme.of(context).textTheme.authWebPolicyAndTaC,
              fontWeight: Theme.of(context).typography.authWebPolicyAndTaC,
            ),
            children: <TextSpan>[
          TextSpan(
              text: getTranslated(context, "authPolicyAndTaCPrivacy") + " ",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.authWebPolicyAndTaC,
                  fontSize: Theme.of(context).textTheme.authWebPolicyAndTaC,
                  fontWeight: Theme.of(context).typography.authWebPolicyAndTaC,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  routeNavigation.routeTextViewer(context, getPolicyFilePath());
                }),
          TextSpan(
              text: getTranslated(context, "authPolicyAndTaCSeconday") + " ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.authWebPolicyAndTaC,
                fontSize: Theme.of(context).textTheme.authWebPolicyAndTaC,
                fontWeight: Theme.of(context).typography.authWebPolicyAndTaC,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: getTranslated(context, "authPolicyAndTaCConditions"),
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.authWebPolicyAndTaC,
                        fontSize:
                            Theme.of(context).textTheme.authWebPolicyAndTaC,
                        fontWeight:
                            Theme.of(context).typography.authWebPolicyAndTaC,
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

Widget authWebGetStarted(
    BuildContext context, State state, bool isSmall, bool isSignIn) {
  return Center(
    child: Container(
      constraints: Theme.of(context).bottomAppBarTheme.authWebGetStarted,
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authWebGetStartedHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.authWebGetStartedWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.authWebGetStarted,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Theme.of(context).colorScheme.materialTransparent,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.authWebGetStartedInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            authWebValidateSubmit(context, state, isSignIn);
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, isSignIn ? "authSignIn" : "authSignUp"),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.authWebGetStartedText,
                  fontSize: Theme.of(context).textTheme.authWebGetStartedText,
                  fontWeight:
                      Theme.of(context).typography.authWebGetStartedText,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget authWebSwitch(BuildContext context, State state, bool isSignIn) {
  return GestureDetector(
    onTap: () {
      isSignIn
          ? _authControls = AuthControls.signUp
          : _authControls = AuthControls.signIn;
      state.setState(() {});
    },
    child: RichText(
      text: TextSpan(
        text: getTranslated(context,
            isSignIn ? "authSwitchSignUpPrimary" : "authSwitchSignInPrimary"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.authWebSwitchPrimary,
          fontSize: Theme.of(context).textTheme.authWebSwitchPrimary,
          fontWeight: Theme.of(context).typography.authWebSwitchPrimary,
        ),
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(
                context,
                isSignIn
                    ? "authSwitchSignUpSecondary"
                    : "authSwitchSignInSecondary"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.authWebSwitchSecondary,
              fontSize: Theme.of(context).textTheme.authWebSwitchSecondary,
              fontWeight: Theme.of(context).typography.authWebSwitchSecondary,
            ),
          ),
        ],
      ),
    ),
  );
}

void authWebValidateSubmit(
    BuildContext context, State state, bool isSignIn) async {
  _authWebFormKey.currentState.save();
  if (isSignIn)
    _firebaseAccounts
        .signInEmailAndPassword(context, _userEmail, _userPass)
        .then((value) {
      if (value) {
        _firebaseAccounts.getEmailVerified().then((isVerified) {
          if (!isVerified) {
            showToastMessage(context, "_errorEmailNotVerified", true);
            _firebaseAccounts.sendEmailVerification(context);
            _authControls = AuthControls.verify;
            state.setState(() {});
            _firebaseAccounts.signOut();
          } else {
            context.router.replaceAll([HomeScreen()]);
          }
          _authWebFormKey.currentState.reset();
        });
      }
    });
  else
    _firebaseAccounts
        .signUpEmailAndPassword(
            context, _userEmail, _userPass, _userPassVerify, _userName)
        .then((value) {
      if (value) {
        _authControls = AuthControls.verify;
        state.setState(() {});
        _firebaseAccounts.signOut();
        _authWebFormKey.currentState.reset();
      }
    });
  _firebaseAccounts.setCurrentUserProfilePicURL(state);
}

void authWebForgotPasswordSwitchBack(BuildContext context, State state) {
  state.setState(() {
    _authControls = AuthControls.signIn;
  });
}

void authWebVerifySwitchBack(BuildContext context, State state) {
  state.setState(() {
    _authControls = AuthControls.signIn;
  });
}
