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
  bool isSent = false;

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
        child: GestureDetector(
          onTap: () {
            isSent = true;
          },
          child: forgotPasswordSend(context),
        ),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordDesktopResendTop),
        child: isSent ? forgotPasswordResend(context) : Container(),
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
        child: GestureDetector(
          onTap: () {
            isSent = true;
          },
          child: forgotPasswordSend(context),
        ),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordTabletResendTop),
        child: isSent ? forgotPasswordResend(context) : Container(),
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
        child: GestureDetector(
          onTap: () {
            isSent = true;
          },
          child: forgotPasswordSend(context),
        ),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .forgotPasswordMobileResendTop),
        child: isSent ? forgotPasswordResend(context) : Container(),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.forgotPasswordBackground,
        child: SingleChildScrollView(
          child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 1.1),
              child: Responsive(
                desktop: forgotPasswordScreenDesktop(),
                tablet: forgotPasswordScreenTablet(),
                mobile: forgotPasswordScreenMobile(),
              )),
        ));
  }
}
