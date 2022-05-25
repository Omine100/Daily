import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/auth/authWebComponents.dart';
import 'package:daily/userInterface/auth/authMobileComponents.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void initState() {
    super.initState();
  }

  Widget _authScreenSmall() {
    return Adaptive(
        iOS: _authScreenMobileSmall(false),
        android: _authScreenMobileSmall(true),
        web: _authScreenWebSmall());
  }

  Widget _authScreenLarge() {
    return Adaptive(
        iOS: _authScreenMobileLarge(false),
        android: _authScreenMobileLarge(true),
        web: _authScreenWebLarge());
  }

  Widget _authScreenWebSmall() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            left: getPosition(context, false,
                Theme.of(context).materialTapTargetSize.authWebCenterPieceLeft),
            child: authWebCenterPiece(context)),
        Positioned(
            child: Align(
          alignment: Alignment.center,
          child: authWebCardContainer(context, this, true),
        )),
      ],
    );
  }

  Widget _authScreenWebLarge() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: getPosition(context, false,
              Theme.of(context).materialTapTargetSize.authWebCenterPieceLeft),
          child: authWebCenterPiece(context),
        ),
        Positioned(
          right: getPosition(context, false,
              Theme.of(context).materialTapTargetSize.authWebCardRight),
          child: authWebCardContainer(context, this, false),
        ),
      ],
    );
  }

  Widget _authScreenMobileSmall(bool isAndroid) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: getPosition(
              context,
              false,
              Theme.of(context)
                  .materialTapTargetSize
                  .authMobileCenterPieceLeft),
          child: authMobileCenterPiece(context, this),
        ),
        Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authMobileTitleTop),
          child: authMobileTitle(context),
        ),
        Positioned(
          bottom: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authMobileCardBottom),
          child: authMobileCardContainer(context, this, true),
        ),
      ],
    );
  }

  Widget _authScreenMobileLarge(bool isAndroid) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: getPosition(
              context,
              false,
              Theme.of(context)
                  .materialTapTargetSize
                  .authMobileCenterPieceLeft),
          child: authMobileCenterPiece(context, this),
        ),
        Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authMobileTitleTop),
          child: authMobileTitle(context),
        ),
        Positioned(
          bottom: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authMobileCardBottom),
          child: authMobileCardContainer(context, this, false),
        ),
      ],
    );
  }

  void checkLoggedInStatus() async {
    await FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) context.router.replaceAll([BaseScreen()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    setResponsiveState(context);
    checkLoggedInStatus();
    FocusNode _textFieldFocus = new FocusNode();
    return Material(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.authBackground,
      body: SingleChildScrollView(
        child: Container(
            constraints: BoxConstraints(
                maxHeight: _textFieldFocus.hasFocus
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
              small: _authScreenSmall(),
              large: _authScreenLarge(),
            )),
      ),
    ));
  }
}
