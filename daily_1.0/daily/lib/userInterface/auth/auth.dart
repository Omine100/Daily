import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/auth/authMobileComponents.dart';
import 'package:daily/userInterface/auth/authWebComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/positions.dart';

class AuthScreen extends StatefulWidget {
  final bool isSignIn;
  AuthScreen({this.isSignIn});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignIn = false;
  void initState() {
    super.initState();
    isSignIn = (widget.isSignIn != null ? widget.isSignIn : true);
  }

  authScreenSmall() {
    return Adaptive(
        iOS: authScreenMobileSmall(false),
        android: authScreenMobileSmall(true),
        web: authScreenWebSmall());
  }

  authScreenLarge() {
    return Adaptive(
        iOS: authScreenMobileLarge(false),
        android: authScreenMobileLarge(true),
        web: authScreenWebLarge());
  }

  authScreenWebSmall() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 175,
          child: Transform.scale(
            scale: 1.5,
            child: authCarousel(context, this),
          ),
        ),
        Positioned(
          right: 0,
          child: authWebCard(context, isSignIn),
        ),
      ],
    );
  }

  authScreenWebLarge() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 175,
          child: Transform.scale(
            scale: 1.5,
            child: authCarousel(context, this),
          ),
        ),
        Positioned(
          right: 0,
          child: authWebCard(context, isSignIn),
        ),
      ],
    );
  }

  authScreenMobileSmall(bool isAndroid) {
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

  authScreenMobileLarge(bool isAndroid) {
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
      body: SingleChildScrollView(
        child: Container(
            color: Theme.of(context).colorScheme.authBackground,
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
