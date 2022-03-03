import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomWebPositions on MaterialTapTargetSize {
  // #region auth
  double get authWebCenterPieceLeft => 0;
  double get authWebCardRight => 0;
  // #endregion
}

extension CustomMobilePositions on MaterialTapTargetSize {
  // #region welcomeTablet
  double get welcomeTabletTitleTop => 0.065;
  double get welcomeTabletCarouselTop => 0.22;
  double get welcomeTabletCornerTop => 0;
  double get welcomeTabletCornerRight => -0.01;
  double get welcomeTabletGetStartedTop => 0.835;
  double get welcomeTabletAccountAlreadyTop => 0.93;
  // #endregion

  // #region welcomeMobile
  double get welcomeMobileTitleTop => 0.065;
  double get welcomeMobileCarouselTop => 0.22;
  double get welcomeMobileCornerTop => 0;
  double get welcomeMobileCornerRight => -0.01;
  double get welcomeMobileGetStartedTop => 0.835;
  double get welcomeMobileAccountAlreadyTop => 0.93;
  // #endregion

  // #region authTablet
  double get authTabletCenterPieceTop => 0.063;
  double get authTabletUserInputTop => 0.45;
  double get authTabletForgotPasswordTop => 0.62;
  double get authTabletPolicyAndTaCTop => 0.765;
  double get authTabletForgotPasswordPolicyAndTaCLeft => 0.1;
  double get authTabletGetStartedTop => 0.835;
  double get authTabletSwitchTop => 0.93;
  // #endregion

  // #region authMobile
  double get authMobileCenterPieceTop => 0.063;
  double get authMobileUserInputTop => 0.45;
  double get authMobileForgotPasswordTop => 0.62;
  double get authMobilePolicyAndTaCTop => 0.765;
  double get authMobileForgotPasswordPolicyAndTaCLeft => 0.1;
  double get authMobileGetStartedTop => 0.835;
  double get authMobileSwitchTop => 0.93;
  // #endregion

  // #region forgotPasswordTablet
  double get forgotPasswordTabletTitleTop => 0.1;
  double get forgotPasswordTabletCenterPieceTop => 0.06;
  double get forgotPasswordTabletUserInputTop => 0.5;
  double get forgotPasswordTabletSendTop => 0.835;
  double get forgotPasswordTabletResendTop => 0.93;
  // #endregion

  // #region forgotPasswordMobile
  double get forgotPasswordMobileTitleTop => 0.1;
  double get forgotPasswordMobileCenterPieceTop => 0.15;
  double get forgotPasswordMobileUserInputTop => 0.65;
  double get forgotPasswordMobileSendTop => 0.835;
  double get forgotPasswordMobileResendTop => 0.93;
  // #endregion

  // #region settingsTablet
  double get settingsTabletTitleTop => 0.1;
  double get settingsTabletProfileTop => 0.125;
  double get settingsTabletCardTop => 0.125;
  // #endregion

  // #region settingsMobile
  double get settingsMobileTitleTop => 0.075;
  double get settingsMobileProfileTop => 0.15;
  double get settingsMobileCardTop => 0.15;
  // #endregion
}

double getPosition(BuildContext context, bool isHeight, double value) {
  return isHeight
      ? MediaQuery.of(context).size.height * value
      : MediaQuery.of(context).size.width * value;
}
