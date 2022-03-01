import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/auth/authWebComponents.dart';
import 'package:daily/userInterface/auth/authMobileComponents.dart';

class AuthScreen extends StatefulWidget {
  final bool isSignIn;
  AuthScreen({this.isSignIn});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignIn;
  void initState() {
    super.initState();
    isSignIn = (widget.isSignIn != null ? widget.isSignIn : true);
    //Create method in mobile for assigning local variable isSignIn to value, then go from there
    //This way we dont have to send it everywhere
  }

  Widget authScreenSmall() {
    return Adaptive(
        iOS: authScreenMobileSmall(false),
        android: authScreenMobileSmall(true),
        web: authScreenWebSmall());
  }

  Widget authScreenLarge() {
    return Adaptive(
        iOS: authScreenMobileLarge(false),
        android: authScreenMobileLarge(true),
        web: authScreenWebLarge());
  }

  Widget authScreenWebSmall() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(left: 0, child: authWebCenterPiece(context, this, true)),
        Positioned(
            child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: authWebCard(context, this, true),
          ),
        )),
      ],
    );
  }

  Widget authScreenWebLarge() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          child: authWebCenterPiece(context, this, false),
        ),
        Positioned(
          right: 0,
          child: authWebCard(context, this, false),
        ),
      ],
    );
  }

  Widget authScreenMobileSmall(bool isAndroid) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authMobileCenterPieceTop),
            child: authCenterPiece(context, this)),
        Positioned(
            top: getPosition(context, true,
                Theme.of(context).materialTapTargetSize.authMobileUserInputTop),
            child: authUserInput(context, isSignIn)),
        Positioned(
          top: isSignIn
              ? getPosition(
                  context,
                  true,
                  Theme.of(context)
                      .materialTapTargetSize
                      .authMobileForgotPasswordTop)
              : getPosition(
                  context,
                  true,
                  Theme.of(context)
                      .materialTapTargetSize
                      .authMobilePolicyAndTaCTop),
          left: getPosition(
              context,
              false,
              Theme.of(context)
                  .materialTapTargetSize
                  .authMobileForgotPasswordPolicyAndTaCLeft),
          child: isSignIn
              ? authForgotPassword(context)
              : authPolicyAndTaC(context),
        ),
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authMobileGetStartedTop),
            child: authGetStarted(context, isSignIn, this)),
        Positioned(
            top: getPosition(context, true,
                Theme.of(context).materialTapTargetSize.authMobileSwitchTop),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                },
                child: authSwitch(context, isSignIn)))
      ],
    );
  }

  Widget authScreenMobileLarge(bool isAndroid) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authMobileCenterPieceTop),
            child: authCenterPiece(context, this)),
        Positioned(
            top: getPosition(context, true,
                Theme.of(context).materialTapTargetSize.authMobileUserInputTop),
            child: authUserInput(context, isSignIn)),
        Positioned(
          top: isSignIn
              ? getPosition(
                  context,
                  true,
                  Theme.of(context)
                      .materialTapTargetSize
                      .authMobileForgotPasswordTop)
              : getPosition(
                  context,
                  true,
                  Theme.of(context)
                      .materialTapTargetSize
                      .authMobilePolicyAndTaCTop),
          left: getPosition(
              context,
              false,
              Theme.of(context)
                  .materialTapTargetSize
                  .authMobileForgotPasswordPolicyAndTaCLeft),
          child: isSignIn
              ? authForgotPassword(context)
              : authPolicyAndTaC(context),
        ),
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authMobileGetStartedTop),
            child: authGetStarted(context, isSignIn, this)),
        Positioned(
            top: getPosition(context, true,
                Theme.of(context).materialTapTargetSize.authMobileSwitchTop),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                },
                child: authSwitch(context, isSignIn)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    FocusNode textFieldFocus = new FocusNode();
    return Material(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.authBackground,
      body: SingleChildScrollView(
        child: Container(
            constraints: BoxConstraints(
                maxHeight: textFieldFocus.hasFocus
                    ? getDimension(
                        context,
                        true,
                        Theme.of(context)
                            .visualDensity
                            .authBoxConstraintFocused)
                    : getDimension(
                        context,
                        true,
                        Theme.of(context)
                            .visualDensity
                            .authBoxConstraintUnfocused)),
            child: Responsive(
              small: authScreenSmall(),
              large: authScreenLarge(),
            )),
      ),
    ));
  }
}
