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
  double get forgotPasswordMobileTitleTop => isSmall ? 0.1 : 0.1;
  double get forgotPasswordMobileCenterPieceTop => isSmall ? 0.15 : 0.15;
  double get forgotPasswordMobileUserInputTop => isSmall ? 0.65 : 0.65;
  double get forgotPasswordMobileSendTop => isSmall ? 0.835 : 0.835;
  double get forgotPasswordMobileResendTop => isSmall ? 0.93 : 0.93;
  // #endregion

  // #region settings
  double get settingsMobileTitleTop => isSmall ? 0.075 : 0.075;
  double get settingsMobileProfileTop => isSmall ? 0.15 : 0.15;
  double get settingsMobileCardTop => isSmall ? 0.15 : 0.15;
  // #endregion
}

double getPosition(BuildContext context, bool isHeight, double value) {
  return isHeight
      ? MediaQuery.of(context).size.height * value
      : MediaQuery.of(context).size.width * value;
}
