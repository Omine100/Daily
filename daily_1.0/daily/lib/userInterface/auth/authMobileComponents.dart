import 'package:daily/standards/userIStandards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/datastructures/enums.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/constraints.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
RouteNavigation _routeNavigation = new RouteNavigation();
AuthControls _authControls = AuthControls.welcome;

Widget authMobileTitle(BuildContext context) {
  return Text(getTranslated(context, "authTitle"),
      style: Theme.of(context).textTheme.titleLarge);
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
          color: Theme.of(context).colorScheme.primaryContainer,
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
              child: authMobileUserInput(context, state),
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
      Text(getTranslated(context, "authCardText"),
          style: Theme.of(context).textTheme.headlineMedium),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(getTranslated(context, "authCardSubText"),
            softWrap: true,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
    ],
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
GlobalKey<FormState> _authMobileFormKey = GlobalKey<FormState>();
Widget authMobileUserInput(BuildContext context, State state) {
  return Form(
    key: _authMobileFormKey,
    onChanged: () {
      _updateFormProgress(
          state,
          _authControls == AuthControls.signIn
              ? [_userEmail, _userPass]
              : [_userName, _userEmail, _userPass, _userPassVerify]);
    },
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
Widget authMobileUserInputField(BuildContext context, Function onChanged,
    String authForm, bool isVariable) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authMobileUserInputFieldHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.authMobileUserInputFieldWidth),
      alignment: Alignment.center,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: isVariable ? !_isVisible : false,
        onChanged: onChanged,
        autofocus: false,
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          hintText: getTranslated(context, authForm),
          labelStyle: Theme.of(context).textTheme.labelSmall,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          prefixIcon: Icon(
            authForm != "authFormEmail"
                ? (authForm == "authFormPass" ||
                        authForm == "authFormPassVerify"
                    ? Icons.lock
                    : Icons.person)
                : Icons.email,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
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
        style: Theme.of(context).textTheme.titleSmall,
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
            style: Theme.of(context).textTheme.titleSmall,
            children: <TextSpan>[
          TextSpan(
              text: getTranslated(context, "authPolicyAndTaCPrivacy"),
              style: Theme.of(context).textTheme.titleSmall,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _routeNavigation.routeTextViewer(
                      context, getPolicyFilePath());
                }),
          TextSpan(
              text: "\n" +
                  getTranslated(context, "authPolicyAndTaCSeconday") +
                  " ",
              style: Theme.of(context).textTheme.titleSmall,
              children: <TextSpan>[
                TextSpan(
                    text: getTranslated(context, "authPolicyAndTaCConditions"),
                    style: Theme.of(context).textTheme.labelMedium,
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
                  _formComplete ? _authValidateSubmit(context, state) : null;
                },
                child: Container(
                  child: Center(
                    child: Text(
                      getTranslated(
                          context,
                          _authControls == AuthControls.signIn
                              ? "authSignIn"
                              : "authSignUp"),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
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
                    style: Theme.of(context).textTheme.displaySmall,
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
        _authControls == AuthControls.signUp
            ? _authControls = AuthControls.signIn
            : _authControls = AuthControls.signUp;
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
        style: Theme.of(context).textTheme.headlineSmall,
        children: <TextSpan>[
          TextSpan(
            text: getTranslated(
                context,
                _authControls == AuthControls.welcome
                    ? "authSwitchSignInSecondary"
                    : (_authControls == AuthControls.signIn
                        ? "authSwitchSignUpSecondary"
                        : "authSwitchSignInSecondary")),
            style: Theme.of(context).textTheme.labelSmall,
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
      _authVerifiedHandling(context, value);
    });
  else
    _firebaseAccounts
        .signUpEmailAndPassword(
            context, _userEmail, _userPass, _userPassVerify, _userName)
        .then((value) {
      _authVerifiedHandling(context, value);
    });
  _firebaseAccounts.setCurrentUserProfilePicURL(state);
}

void _authVerifiedHandling(BuildContext context, bool value) {
  if (value) {
    if (!_firebaseAccounts.getEmailVerified(context)) {
      showToastMessage(context, "_errorEmailNotVerified", true);
      context.router.push(VerifyScreen(email: _userEmail, pass: _userPass));
      _firebaseAccounts.signOut();
    } else {
      context.router.replaceAll([BaseScreen()]);
    }
    _authMobileFormKey.currentState.reset();
  }
}
