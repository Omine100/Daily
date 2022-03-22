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

  Widget authScreenWebLarge() {
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

  Widget authScreenMobileSmall(bool isAndroid) {
    setSignIn(isSignIn);

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
          child: authMobileCardContainer(context, this),
        ),
      ],
    );
  }

  Widget authScreenMobileLarge(bool isAndroid) {
    return Container();
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
