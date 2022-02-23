import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/authComponents.dart';
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
    isSignIn = widget.isSignIn;
  }

  authScreenWeb() {
    return authPolicyAndTaC(context);
  }

  authScreenTablet() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authTabletCenterPieceTop),
            child: authCenterPiece(context, this)),
        Positioned(
            top: getPosition(context, true,
                Theme.of(context).materialTapTargetSize.authTabletUserInputTop),
            child: authUserInput(context, isSignIn)),
        Positioned(
          top: isSignIn
              ? getPosition(
                  context,
                  true,
                  Theme.of(context)
                      .materialTapTargetSize
                      .authTabletForgotPasswordTop)
              : getPosition(
                  context,
                  true,
                  Theme.of(context)
                      .materialTapTargetSize
                      .authTabletPolicyAndTaCTop),
          left: getPosition(
              context,
              false,
              Theme.of(context)
                  .materialTapTargetSize
                  .authTabletForgotPasswordPolicyAndTaCLeft),
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
                    .authTabletGetStartedTop),
            child: authGetStarted(context, isSignIn, this)),
        Positioned(
            top: getPosition(context, true,
                Theme.of(context).materialTapTargetSize.authTabletSwitchTop),
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

  authScreenMobile() {
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
              web: authScreenWeb(),
              tablet: authScreenTablet(),
              mobile: authScreenMobile(),
            )),
      ),
    ));
  }
}
