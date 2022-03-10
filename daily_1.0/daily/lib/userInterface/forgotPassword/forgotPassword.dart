import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/forgotPassword/forgotPasswordWebComponents.dart';
import 'package:daily/userInterface/forgotPassword/forgotPasswordMobileComponents.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void dispose() {
    super.dispose();
    forgotPasswordMobileDispose();
    forgotPasswordWebDispose();
  }

  forgotPasswordScreenSmall() {
    return Adaptive(
        iOS: forgotPasswordScreenMobileSmall(false),
        android: forgotPasswordScreenMobileSmall(true),
        web: forgotPasswordScreenWebSmall());
  }

  forgotPasswordScreenLarge() {
    return Adaptive(
        iOS: forgotPasswordScreenMobileLarge(false),
        android: forgotPasswordScreenMobileLarge(true),
        web: forgotPasswordScreenWebLarge());
  }

  forgotPasswordScreenWebSmall() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(left: 0, child: authWebCenterPiece(context, this)),
        Positioned(
            child: Align(
          alignment: Alignment.center,
          child: forgotPasswordWebCard(context, this),
        )),
      ],
    );
  }

  forgotPasswordScreenWebLarge() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(left: 0, child: authWebCenterPiece(context, this)),
        Positioned(
            child: Align(
          alignment: Alignment.center,
          child: forgotPasswordWebCard(context, this),
        )),
      ],
    );
  }

  forgotPasswordScreenMobileSmall(bool isAndroid) {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordMobileTitleTop),
        child: forgotPasswordTitle(context),
      ),
      Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .forgotPasswordMobileCenterPieceTop),
          child: forgotPasswordCenterPiece(context)),
      Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .forgotPasswordMobileUserInputTop),
          child: forgotPasswordUserInputField(context, this)),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordMobileSendTop),
        child: forgotPasswordSend(context, this),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordMobileResendTop),
        child: forgotPasswordResend(context),
      )
    ]);
  }

  forgotPasswordScreenMobileLarge(bool isAndroid) {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordMobileTitleTop),
        child: forgotPasswordTitle(context),
      ),
      Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .forgotPasswordMobileCenterPieceTop),
          child: forgotPasswordCenterPiece(context)),
      Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .forgotPasswordMobileUserInputTop),
          child: forgotPasswordUserInputField(context, this)),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordMobileSendTop),
        child: forgotPasswordSend(context, this),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordMobileResendTop),
        child: forgotPasswordResend(context),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    FocusNode textFieldFocus = new FocusNode();
    return Material(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Theme.of(context).colorScheme.forgotPasswordBackground,
            constraints: BoxConstraints(
                maxHeight: textFieldFocus.hasFocus
                    ? getDimension(
                        context,
                        true,
                        Theme.of(context)
                            .visualDensity
                            .forgotPasswordBoxConstraintFocused)
                    : getDimension(
                        context,
                        true,
                        Theme.of(context)
                            .visualDensity
                            .forgotPasswordBoxConstraintUnfocused)),
            child: Responsive(
              small: forgotPasswordScreenSmall(),
              large: forgotPasswordScreenLarge(),
            )),
      ),
    ));
  }
}
