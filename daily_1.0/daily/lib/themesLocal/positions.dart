import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomPositions on SwitchTheme {
  // #region welcomeDesktop
  double get welcomeDesktopTitleTop => 0.065;
  double get welcomeDesktopTitleRight => 0.475;
  double get welcomeDesktopUserInputTop => 0.75;
  double get welcomeDesktopAccountAlreadyTop => 0.925;
  // #endregion

  // #region welcomeTablet
  double get welcomeTabletTitleTop => 0.065;
  double get welcomeTabletTitleRight => 0.475;
  double get welcomeTabletUserInputTop => 0.75;
  double get welcomeTabletAccountAlreadyTop => 0.925;
  // #endregion

  // #region welcomeMobile
  double get welcomeMobileTitleTop => 0.065;
  double get welcomeMobileTitleRight => 0.475;
  double get welcomeMobileUserInputTop => 0.75;
  double get welcomeMobileAccountAlreadyTop => 0.925;
  // #endregion
}
