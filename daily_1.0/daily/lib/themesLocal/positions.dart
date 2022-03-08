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
  // #region welcome
  double get welcomeMobileTitleTop => isSmall ? 0.065 : 0.065;
  double get welcomeMobileCarouselTop => isSmall ? 0.22 : 0.22;
  double get welcomeMobileCornerTop => isSmall ? 0 : 0;
  double get welcomeMobileCornerRight => isSmall ? -0.01 : -0.01;
  double get welcomeMobileGetStartedTop => isSmall ? 0.835 : 0.835;
  double get welcomeMobileAccountAlreadyTop => isSmall ? 0.93 : 0.93;
  // #endregion

  // #region auth
  double get authMobileCenterPieceTop => isSmall ? 0.063 : 0.063;
  double get authMobileCardTop => isSmall ? 0.45 : 0.45;
  double get authMobileSwitchBottom => isSmall ? 0.03 : 0.03;
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
