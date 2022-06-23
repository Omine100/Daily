import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/datastructures/enums.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/constraints.dart';
import 'package:daily/userInterface/forgotPassword/forgotPasswordWebComponents.dart';
import 'package:daily/userInterface/verify/verifyWebComponents.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
RouteNavigation _routeNavigation = new RouteNavigation();
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
              color: Theme.of(context).colorScheme.primaryContainer,
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
      return authWebCard(context, state, isSmall);
    case AuthControls.signUp:
      return authWebCard(context, state, isSmall);
    case AuthControls.forgotPassword:
      return forgotPasswordWebCard(context, state);
    case AuthControls.verify:
      return verifyWebCard(context, state, _userEmail, _userPass);
    default:
      return Container();
  }
}

Widget authWebCard(BuildContext context, State state, bool isSmall) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: authWebTitle(context),
          ),
          authWebUserInput(context, state, isSmall),
          _authControls == AuthControls.signIn
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
            child: authWebGetStarted(context, state, isSmall),
          ),
        ],
      ),
      Positioned(
        bottom: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.authWebSwitchBottom),
        child: authWebSwitch(context, state),
      ),
    ],
  );
}

Widget authWebTitle(BuildContext context) {
  return Center(
    child: AdaptiveText(
      getTranslated(
          context,
          _authControls == AuthControls.signIn
              ? "authTitleSignIn"
              : "authTitleSignUp"),
      style: Theme.of(context).textTheme.titleSmall,
    ),
  );
}

bool _formComplete = false;
void _updateFormProgress(State state, List<String> strings) {
  _formComplete = true;
  for (int i = 0; i < strings.length; i++)
    if (strings[i].isEmpty) {
      _formComplete = false;
      break;
    }
  state.setState(() {
    _formComplete;
  });
}

String _userName = "", _userEmail = "", _userPass = "", _userPassVerify = "";
GlobalKey<FormState> _authWebFormKey = GlobalKey<FormState>();
Widget authWebUserInput(BuildContext context, State state, bool isSmall) {
  return Form(
      key: _authWebFormKey,
      onChanged: () {
        _updateFormProgress(
            state,
            _authControls == AuthControls.signIn
                ? [_userEmail, _userPass]
                : [_userName, _userEmail, _userPass, _userPassVerify]);
      },
      child: Center(
        child: Column(
          children: [
            _authControls == AuthControls.signIn
                ? Container()
                : authWebUserInputField(context, state,
                    (name) => {_userName = name}, "authFormName", false),
            authWebUserInputField(context, state,
                (email) => {_userEmail = email}, "authFormEmail", false),
            authWebUserInputField(context, state, (pass) => {_userPass = pass},
                "authFormPass", true),
            _authControls == AuthControls.signIn
                ? Container()
                : authWebUserInputField(
                    context,
                    state,
                    (passVerify) => {_userPassVerify = passVerify},
                    "authFormPassVerify",
                    true),
          ],
        ),
      ));
}

bool _isVisible = false;
Widget authWebUserInputField(BuildContext context, State state,
    Function onChanged, String authForm, bool isVariable) {
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
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: isVariable ? !_isVisible : false,
        onChanged: onChanged,
        onFieldSubmitted: (value) {
          _authWebValidateSubmit(context, state);
        },
        autofocus: false,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslated(context, authForm),
          labelStyle: customTextThemes.inputField,
          hintStyle: customTextThemes.inputField,
          prefixIcon: Icon(
            authForm != "authFormEmail"
                ? (authForm == "authFormPass" ||
                        authForm == "authFormPassVerify"
                    ? Icons.lock
                    : Icons.person)
                : Icons.email,
            color: customColors.icon,
          ),
          suffixIcon: isVariable
              ? IconButton(
                  splashColor: Colors.transparent,
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
                    color: customColors.icon,
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
      child: Text(getTranslated(context, "authForgotPassword"),
          style: Theme.of(context).textTheme.bodyText1),
    ),
  ).showClickOnHover;
}

Widget authWebPolicyAndTaC(BuildContext context) {
  return Container(
    width: getDimension(context, false,
        Theme.of(context).visualDensity.authWebPolicyAndTacWidth),
    alignment: Alignment.center,
    child: Center(
        child: Text.rich(TextSpan(
            text: getTranslated(context, "authPolicyAndTaCPrimary") + " ",
            style: Theme.of(context).textTheme.subtitle2,
            children: <TextSpan>[
          TextSpan(
              text: getTranslated(context, "authPolicyAndTaCPrivacy") + " ",
              style: customTextThemes.subtitle2Underlined,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _routeNavigation.routeTextViewer(
                      context, getPolicyFilePath());
                }),
          TextSpan(
              text: getTranslated(context, "authPolicyAndTaCSeconday") + " ",
              style: Theme.of(context).textTheme.subtitle2,
              children: <TextSpan>[
                TextSpan(
                    text: getTranslated(context, "authPolicyAndTaCConditions"),
                    style: customTextThemes.subtitle2Underlined,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _routeNavigation.routeTextViewer(
                            context, getTaCFilePath());
                      })
              ])
        ]))),
  );
}

Widget authWebGetStarted(BuildContext context, State state, bool isSmall) {
  return Center(
    child: Container(
      constraints: Theme.of(context).bottomAppBarTheme.authWebGetStarted,
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authWebGetStartedHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.authWebGetStartedWidth),
      decoration: BoxDecoration(
          color: _authControls != AuthControls.welcome
              ? (_formComplete
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.surfaceVariant)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Colors.transparent,
        child: _formComplete
            ? InkWell(
                splashColor: _authControls != AuthControls.welcome
                    ? (_formComplete
                        ? Theme.of(context).colorScheme.surfaceTint
                        : Colors.transparent)
                    : Theme.of(context).colorScheme.surfaceTint,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onTap: () {
                  _formComplete ? _authWebValidateSubmit(context, state) : null;
                },
                child: Container(
                  child: Center(
                    child: Text(
                        getTranslated(
                            context,
                            _authControls == AuthControls.signIn
                                ? "authSignIn"
                                : "authSignUp"),
                        style: Theme.of(context).textTheme.button),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text(
                      getTranslated(
                          context,
                          _authControls == AuthControls.signIn
                              ? "authSignIn"
                              : "authSignUp"),
                      style: Theme.of(context).textTheme.button),
                ),
              ),
      ),
    ),
  );
}

Widget authWebSwitch(BuildContext context, State state) {
  return GestureDetector(
    onTap: () {
      _authControls == AuthControls.signIn
          ? _authControls = AuthControls.signUp
          : _authControls = AuthControls.signIn;
      state.setState(() {});
    },
    child: RichText(
      text: TextSpan(
        text: getTranslated(
            context,
            _authControls == AuthControls.signIn
                ? "authSwitchSignUpPrimary"
                : "authSwitchSignInPrimary"),
        style: Theme.of(context).textTheme.headlineSmall,
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(
                context,
                _authControls == AuthControls.signIn
                    ? "authSwitchSignUpSecondary"
                    : "authSwitchSignInSecondary"),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ),
  ).showClickOnHover;
}

void _authWebValidateSubmit(BuildContext context, State state) async {
  _authWebFormKey.currentState.save();
  if (_authControls == AuthControls.signIn)
    _firebaseAccounts
        .signInEmailAndPassword(context, _userEmail, _userPass)
        .then((value) {
      _authVerifiedHandling(context, state, value);
    });
  else
    _firebaseAccounts
        .signUpEmailAndPassword(
            context, _userEmail, _userPass, _userPassVerify, _userName)
        .then((value) {
      _authVerifiedHandling(context, state, value);
    });
}

void _authVerifiedHandling(BuildContext context, State state, bool value) {
  if (value) {
    if (!_firebaseAccounts.getEmailVerified(context)) {
      showToastMessage(context, "_errorEmailNotVerified", true);
      _authControls = AuthControls.verify;
      state.setState(() {});
      _firebaseAccounts.signOut();
    } else {
      context.router.replaceAll([BaseScreen()]);
    }
    _authWebFormKey.currentState.reset();
  }
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
