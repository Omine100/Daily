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
        Positioned(left: 0, child: authWebCenterPiece(context, this)),
        Positioned(
            child: Align(
          alignment: Alignment.center,
          child: authWebCard(context, this, true),
        )),
      ],
    );
  }

  Widget authScreenWebLarge() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: getPosition(context, false,
              Theme.of(context).materialTapTargetSize.authWebCenterPieceLeft),
          child: authWebCenterPiece(context, this),
        ),
        Positioned(
          right: getPosition(context, false,
              Theme.of(context).materialTapTargetSize.authWebCardRight),
          child: authWebCard(context, this, false),
        ),
      ],
    );
  }

  Widget authScreenMobileSmall(bool isAndroid) {
    setSignIn(isSignIn);

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
                Theme.of(context).materialTapTargetSize.authMobileCardTop),
            child: authMobileCard(context, this, true)),
        Positioned(
          bottom: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authMobileSwitchBottom),
          child: authMobileSwitch(context, this),
        ),
      ],
    );
  }

  Widget authScreenMobileLarge(bool isAndroid) {
    setSignIn(isSignIn);

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
                Theme.of(context).materialTapTargetSize.authMobileCardTop),
            child: authMobileCard(context, this, false)),
        Positioned(
          bottom: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authMobileSwitchBottom),
          child: authMobileSwitch(context, this),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    setResponsiveState(context);
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
