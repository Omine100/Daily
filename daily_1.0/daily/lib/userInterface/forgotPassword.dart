import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/forgotPasswordComponents.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  forgotPasswordScreenDesktop() {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordDesktopTitleTop),
        child: forgotPasswordTitle(context),
      ),
      Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .forgotPasswordDesktopCenterPieceTop),
          child: forgotPasswordCenterPiece(context)),
      Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .forgotPasswordDesktopUserInputTop),
          child: forgotPasswordUserInputField(context)),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordDesktopSendTop),
        child: forgotPasswordSend(context, this),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordDesktopResendTop),
        child: forgotPasswordResend(context),
      )
    ]);
  }

  forgotPasswordScreenTablet() {
    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordTabletTitleTop),
        child: forgotPasswordTitle(context),
      ),
      Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .forgotPasswordTabletCenterPieceTop),
          child: forgotPasswordCenterPiece(context)),
      Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .forgotPasswordTabletUserInputTop),
          child: forgotPasswordUserInputField(context)),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordTabletSendTop),
        child: forgotPasswordSend(context, this),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordTabletResendTop),
        child: forgotPasswordResend(context),
      )
    ]);
  }

  forgotPasswordScreenMobile() {
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
          child: forgotPasswordUserInputField(context)),
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
        color: Theme.of(context).colorScheme.forgotPasswordBackground,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
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
                  desktop: forgotPasswordScreenDesktop(),
                  tablet: forgotPasswordScreenTablet(),
                  mobile: forgotPasswordScreenMobile(),
                )),
          ),
        ));
  }
}
