import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/authComponents.dart';
import 'package:daily/themesLocal/colors.dart';
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

  authScreenDesktop() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authDesktopCenterPieceTop),
            child: authCenterPiece(context, this)),
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authDesktopUserInputTop),
            child: authUserInput(context, isSignIn)),
        Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .authDesktopForgotPasswordTop),
          left: getPosition(
              context,
              false,
              Theme.of(context)
                  .materialTapTargetSize
                  .authDesktopForgotPasswordLeft),
          child: isSignIn ? authForgotPassword(context) : Container(),
        ),
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authDesktopGetStartedTop),
            child: authGetStarted(context, isSignIn)),
        Positioned(
            top: getPosition(context, true,
                Theme.of(context).materialTapTargetSize.authDesktopSwitchTop),
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
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .authTabletForgotPasswordTop),
          left: getPosition(
              context,
              false,
              Theme.of(context)
                  .materialTapTargetSize
                  .authTabletForgotPasswordLeft),
          child: isSignIn ? authForgotPassword(context) : Container(),
        ),
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authTabletGetStartedTop),
            child: authGetStarted(context, isSignIn)),
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
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .authMobileForgotPasswordTop),
          left: getPosition(
              context,
              false,
              Theme.of(context)
                  .materialTapTargetSize
                  .authMobileForgotPasswordLeft),
          child: isSignIn ? authForgotPassword(context) : Container(),
        ),
        Positioned(
            top: getPosition(
                context,
                true,
                Theme.of(context)
                    .materialTapTargetSize
                    .authMobileGetStartedTop),
            child: authGetStarted(context, isSignIn)),
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
    return Material(
        color: Theme.of(context).colorScheme.welcomeBackground,
        child: SingleChildScrollView(
          child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 1.2),
              child: Responsive(
                desktop: authScreenDesktop(),
                tablet: authScreenTablet(),
                mobile: authScreenMobile(),
              )),
        ));
  }
}
