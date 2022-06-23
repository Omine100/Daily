import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';

//Install extension '#region folding for VS Code'

extension CustomWebPositions on MaterialTapTargetSize {
  // #region auth
  double get authWebCenterPieceLeft => isSmall ? 0 : 0;
  double get authWebCardRight => isSmall ? 0 : 0;
  double get authWebSwitchBottom => isSmall ? 0.02 : 0.02;
  // #endregion
}

extension CustomMobilePositions on MaterialTapTargetSize {
  // #region auth
  double get authMobileTitleTop => isSmall ? 0.065 : 0.065;
  double get authMobileCenterPieceLeft => isSmall ? -0.25 : -0.25;
  double get authMobileCardBottom => isSmall ? 0.03 : 0.03;
  // #endregion

  // #region forgotPassword
  double get forgotPasswordMobileTitleTop => isSmall ? 0.3 : 0.3;
  double get forgotPasswordMobileUserInputTop => isSmall ? 0.475 : 0.475;
  double get forgotPasswordMobileSendTop => isSmall ? 0.560 : 0.560;
  double get forgotPasswordMobileResendTop => isSmall ? 0.70 : 0.70;
  // #endregion

  // #region settings
  double get settingsMobileTitleTop => isSmall ? 0.075 : 0.075;
  double get settingsMobileProfileTop => isSmall ? 0.15 : 0.15;
  double get settingsMobileCardTop => isSmall ? 0.15 : 0.15;
  // #endregion

  // #region verify
  double get verifyMobileTitleTop => isSmall ? 0.3 : 0.3;
  double get verifyMobileLoginTop => isSmall ? 0.560 : 0.560;
  double get verifyMobileResendTop => isSmall ? 0.70 : 0.70;
  // #endregion
}

double getPosition(BuildContext context, bool isHeight, double value) {
  return isHeight
      ? MediaQuery.of(context).size.height * value
      : MediaQuery.of(context).size.width * value;
}
