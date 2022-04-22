import 'package:daily/standards/userIStandards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/datastructures/structures.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/constraints.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
RouteNavigation _routeNavigation = new RouteNavigation();
AuthControls _authControls = AuthControls.welcome;

Widget authMobileTitle(BuildContext context) {
  return Text(
    getTranslated(context, "authTitle"),
    style: TextStyle(
      color: Theme.of(context).colorScheme.authMobileTitle,
      fontSize: Theme.of(context).textTheme.authMobileTitle,
      fontWeight: Theme.of(context).typography.authMobileTitle,
    ),
  );
}

Widget authMobileCenterPiece(BuildContext context, State state) {
  return GestureDetector(
    onVerticalDragDown: (value) {
      state.setState(() {
        _authControls = AuthControls.welcome;
      });
    },
    child: Container(
        height: getDimension(context, true,
            Theme.of(context).visualDensity.authMobileCenterPieceHeight),
        child: Image(
            fit: BoxFit.fitHeight,
            image: isDark.value
                ? AssetImage("lib/assets/auth/mobile/auth_centerPiece_dark.jpg")
                : AssetImage(
                    "lib/assets/auth/mobile/auth_centerPiece_light.jpg"))),
  );
}

Widget authMobileCardContainer(
    BuildContext context, State state, bool isSmall) {
  return SingleChildScrollView(
    child: AnimatedContainer(
      constraints: Theme.of(context).bottomAppBarTheme.authMobileCardContainer,
      height: _authControls == AuthControls.welcome
          ? getDimension(
              context,
              true,
              Theme.of(context)
                  .visualDensity
                  .authMobileCardContainerWelcomeHeight)
          : getDimension(
              context,
              true,
              Theme.of(context)
                  .visualDensity
                  .authMobileCardContainerInputHeight),
      width: _authControls == AuthControls.welcome
          ? getDimension(
              context,
              false,
              Theme.of(context)
                  .visualDensity
                  .authMobileCardContainerWelcomeWidth)
          : getDimension(
              context,
              false,
              Theme.of(context)
                  .visualDensity
                  .authMobileCardContainerInputWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.authMobileCarContainer,
          borderRadius: BorderRadius.circular(20)),
      duration: const Duration(milliseconds: 1350),
      curve: Curves.fastOutSlowIn,
      child: authMobileCardPick(context, state, isSmall),
    ),
  );
}

Widget authMobileCardPick(BuildContext context, State state, bool isSmall) {
  switch (_authControls) {
    case AuthControls.welcome:
      return authMobileCardWelcome(context, state);
    case AuthControls.signIn:
      return authMobileCardInput(context, state, false);
    case AuthControls.signUp:
      return authMobileCardInput(context, state, false);
    default:
      return Container();
  }
}

Widget authMobileCardWelcome(BuildContext context, State state) {
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

Widget authMobileCardInput(BuildContext context, State state, bool isSmall) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: authMobileUserInput(context),
            ),
            _authControls == AuthControls.signIn
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
              padding: EdgeInsets.only(top: 30.0),
              child: authMobileSwitch(context, state),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget authMobileCardText(BuildContext context) {
  return Column(
    children: [
      Text(
        getTranslated(context, "authCardText"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.authMobileCardText,
          fontSize: Theme.of(context).textTheme.authMobileCardText,
          fontWeight: Theme.of(context).typography.authMobileCardText,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          getTranslated(context, "authCardSubText"),
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

String _userName = "", _userEmail = "", _userPass = "", _userPassVerify = "";
GlobalKey<FormState> _authMobileFormKey = GlobalKey<FormState>();
Widget authMobileUserInput(BuildContext context) {
  return Form(
    key: _authMobileFormKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _authControls == AuthControls.signIn
            ? Container()
            : authMobileUserInputField(
                context, (name) => {_userName = name}, "authFormName", false),
        authMobileUserInputField(
            context, (email) => {_userEmail = email}, "authFormEmail", false),
        authMobileUserInputField(
            context, (pass) => {_userPass = pass}, "authFormPass", true),
        _authControls == AuthControls.signIn
            ? Container()
            : authMobileUserInputField(
                context,
                (passVerify) => {_userPassVerify = passVerify},
                "authFormPassVerify",
                true),
      ],
    ),
  );
}

bool _isVisible = false;
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
        obscureText: isVariable ? !_isVisible : false,
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
                  _routeNavigation.routeTextViewer(
                      context, getPolicyFilePath());
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
                        _routeNavigation.routeTextViewer(
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
            if (_authControls == AuthControls.welcome) {
              _authControls = AuthControls.signUp;
            } else {
              _authValidateSubmit(context, state);
            }
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(
                    context,
                    _authControls == AuthControls.welcome
                        ? "authGetStarted"
                        : (_authControls == AuthControls.signIn
                            ? "authSignIn"
                            : "authSignUp")),
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
      if (_authControls == AuthControls.welcome) {
        _authControls = AuthControls.signIn;
        state.setState(() {});
      } else {
        _authControls = AuthControls.signUp;
        state.setState(() {});
      }
    },
    child: RichText(
      text: TextSpan(
        text: getTranslated(
            context,
            _authControls == AuthControls.welcome
                ? "authSwitchSignInPrimary"
                : (_authControls == AuthControls.signIn
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
                _authControls == AuthControls.welcome
                    ? "authSwitchSignInSecondary"
                    : (_authControls == AuthControls.signIn
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

void _authValidateSubmit(BuildContext context, State state) async {
  _authMobileFormKey.currentState.save();
  if (_authControls == AuthControls.signIn)
    _firebaseAccounts
        .signInEmailAndPassword(context, _userEmail, _userPass)
        .then((value) {
      if (value) {
        _firebaseAccounts.getEmailVerified().then((isVerified) {
          if (!isVerified) {
            showToastMessage(context, "errorEmailNotVerified", true);
            _firebaseAccounts.sendEmailVerification(context);
            context.router.push(VerifyScreen(email: _userEmail));
            _firebaseAccounts.signOut();
          } else {
            context.router.replaceAll([HomeScreen()]);
          }
          _authMobileFormKey.currentState.reset();
        });
      }
    });
  else
    _firebaseAccounts
        .signUpEmailAndPassword(
            context, _userEmail, _userPass, _userPassVerify, _userName)
        .then((value) {
      if (value) {
        context.router.push(VerifyScreen(email: _userEmail));
        _firebaseAccounts.signOut();
        _authMobileFormKey.currentState.reset();
      }
    });
  _firebaseAccounts.setCurrentUserProfilePicURL(state);
}
