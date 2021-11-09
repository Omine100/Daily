import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomPositions on MaterialTapTargetSize {
  // #region welcomeDesktop
  double get welcomeDesktopTitleTop => 0.065;
  double get welcomeDesktopCarouselTop => 0.22;
  double get welcomeDesktopGetStartedTop => 0.815;
  double get welcomeDesktopAccountAlreadyTop => 0.93;
  // #endregion

  // #region welcomeTablet
  double get welcomeTabletTitleTop => 0.065;
  double get welcomeTabletCarouselTop => 0.22;
  double get welcomeTabletGetStartedTop => 0.815;
  double get welcomeTabletAccountAlreadyTop => 0.93;
  // #endregion

  // #region welcomeMobile
  double get welcomeMobileTitleTop => 0.065;
  double get welcomeMobileCarouselTop => 0.22;
  double get welcomeMobileGetStartedTop => 0.815;
  double get welcomeMobileAccountAlreadyTop => 0.93;
  // #endregion
}

double getPosition(BuildContext context, bool isHeight, double value) {
  return isHeight ? 
    MediaQuery.of(context).size.height * value :
    MediaQuery.of(context).size.width * value;
}
