import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/forgotPasswordComponents.dart';

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
                  .authDesktopCenterPieceTop),
          child: forgotPassword_centerPiece(context, this)),
      Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authDesktopUserInputTop),
          child: forgotPasswordUserInputField(context)),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.authDesktopSend),
        child: forgotPasswordSend(context),
      ),
      Positioned(
        top: getPosition(
          context,
          true,
          Theme.of(context).materialTapTargetSize.forgotPasswordDesktopResend,
        ),
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
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authTabletCenterPieceTop),
          child: forgotPassword_centerPiece(context, this)),
      Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authTabletUserInputTop),
          child: forgotPasswordUserInputField(context)),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.authTabletSend),
        child: forgotPasswordSend(context),
      ),
      Positioned(
        top: getPosition(
          context,
          true,
          Theme.of(context).materialTapTargetSize.forgotPasswordTabletResend,
        ),
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
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authMobileCenterPieceTop),
          child: forgotPassword_centerPiece(context, this)),
      Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.authMobileUserInputTop),
          child: forgotPasswordUserInputField(context)),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.authMobileSend),
        child: forgotPasswordSend(context),
      ),
      Positioned(
        top: getPosition(
          context,
          true,
          Theme.of(context).materialTapTargetSize.forgotPasswordMobileResend,
        ),
        child: forgotPasswordResend(context),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.forgotPasswordBackground,
        child: Container(
            constraints: BoxConstraints.expand(height: double.maxFinite),
            child: Responsive(
              desktop: forgotPasswordScreenDesktop(),
              tablet: forgotPasswordScreenTablet(),
              mobile: forgotPasswordScreenMobile(),
            )));
  }
}
