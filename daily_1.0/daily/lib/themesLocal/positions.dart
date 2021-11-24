import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomPositions on MaterialTapTargetSize {
  // #region welcomeDesktop
  double get welcomeDesktopTitleTop => 0.065;
  double get welcomeDesktopCarouselTop => 0.22;
  double get welcomeDesktopCornerTop => 0;
  double get welcomeDesktopCornerRight => -0.01;
  double get welcomeDesktopGetStartedTop => 0.815;
  double get welcomeDesktopAccountAlreadyTop => 0.93;
  // #endregion

  // #region welcomeTablet
  double get welcomeTabletTitleTop => 0.065;
  double get welcomeTabletCarouselTop => 0.22;
  double get welcomeTabletCornerTop => 0;
  double get welcomeTabletCornerRight => -0.01;
  double get welcomeTabletGetStartedTop => 0.815;
  double get welcomeTabletAccountAlreadyTop => 0.93;
  // #endregion

  // #region welcomeMobile
  double get welcomeMobileTitleTop => 0.065;
  double get welcomeMobileCarouselTop => 0.22;
  double get welcomeMobileCornerTop => 0;
  double get welcomeMobileCornerRight => -0.01;
  double get welcomeMobileGetStartedTop => 0.815;
  double get welcomeMobileAccountAlreadyTop => 0.93;
  // #endregion

  // #region authDesktop
  double get authDesktopCenterPieceTop => 0.06;
  double get authDesktopUserInputTop => 0.5;
  double get authDesktopForgotPasswordTop => 0.685;
  double get authDesktopForgotPasswordLeft => 0.1;
  double get authDesktopGetStartedTop => 0.8;
  double get authDesktopSwitchTop => 0.93;
  // #endregion

  // #region authTablet
  double get authTabletCenterPieceTop => 0.06;
  double get authTabletUserInputTop => 0.5;
  double get authTabletForgotPasswordTop => 0.685;
  double get authTabletForgotPasswordLeft => 0.1;
  double get authTabletGetStartedTop => 0.815;
  double get authTabletSwitchTop => 0.93;
  // #endregion

  // #region authMobile
  double get authMobileCenterPieceTop => 0.06;
  double get authMobileUserInputTop => 0.5;
  double get authMobileForgotPasswordTop => 0.685;
  double get authMobileForgotPasswordLeft => 0.1;
  double get authMobileGetStartedTop => 0.815;
  double get authMobileSwitchTop => 0.93;
  // #endregion
}

double getPosition(BuildContext context, bool isHeight, double value) {
  return isHeight
      ? MediaQuery.of(context).size.height * value
      : MediaQuery.of(context).size.width * value;
}
