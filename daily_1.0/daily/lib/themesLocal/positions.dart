import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomPositions on MaterialTapTargetSize {
  // #region welcomeDesktop
  double get welcomeDesktopTitleTop => 0.065;
  double get welcomeDesktopGetStartedTop => 0.75;
  double get welcomeDesktopAccountAlreadyTop => 0.925;
  // #endregion

  // #region welcomeTablet
  double get welcomeTabletTitleTop => 0.065;
  double get welcomeTabletGetStartedTop => 0.75;
  double get welcomeTabletAccountAlreadyTop => 0.925;
  // #endregion

  // #region welcomeMobile
  double get welcomeMobileTitleTop => 0.065;
  double get welcomeMobileGetStartedTop => 0.75;
  double get welcomeMobileAccountAlreadyTop => 0.925;
  // #endregion
}

double getPosition(BuildContext context, bool isHeight, double value) {
  return isHeight ? 
    MediaQuery.of(context).size.height * value :
    MediaQuery.of(context).size.width * value;
}
