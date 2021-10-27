import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomDimensions on VisualDensity {
  // #region userIStandards
  double get userIStandardsSocialButtonHeight => 0.05;
  double get userIStandardsSocialButtonWidth => 0.05;
  // #endregion

  // #region welcomeDesktop
  double get welcomeDesktopTitleWidth => 1.0;
  double get welcomeDesktopUserInputTop => 0.75;
  double get welcomeDesktopAccountAlreadyTop => 0.925;
  // #endregion

  // #region welcomeTablet
  double get welcomeTabletTitleWidth => 1.0;
  double get welcomeTabletUserInputTop => 0.75;
  double get welcomeTabletAccountAlreadyTop => 0.925;
  // #endregion

  // #region welcomeMobile
  double get welcomeMobileTitleWidth => 1.0;
  double get welcomeMobileUserInputTop => 0.75;
  double get welcomeMobileAccountAlreadyTop => 0.925;
  // #endregion
}

double getDimension(BuildContext context, bool isHeight, double value) {
  return isHeight ? 
    MediaQuery.of(context).size.height * value :
    MediaQuery.of(context).size.width * value;
}