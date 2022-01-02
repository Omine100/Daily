import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomDimensions on VisualDensity {
  // #region userIStandards
  double get userIStandardsSocialButtonHeight => 0.05;
  double get userIStandardsSocialButtonWidth => 0.05;
  // #endregion

  // #region welcome
  double get welcomeTitleWidth => 1.0;
  double get welcomeCarouselHeight => 0.50;
  double get welcomeCarouselWidth => 1.0;
  double get welcomeCornerHeight => 0.22;
  double get welcomeGetStartedHeight => 0.07;
  double get welcomeGetStartedWidth => 0.45;
  // #endregion

  // #region auth
  double get authTitleWidth => 1.0;
  double get authBoxConstraintFocused => 1.2;
  double get authBoxConstraintUnfocused => 1.0;
  double get authCenterPieceHeight => 0.42;
  double get authUserInputFieldHeight => 0.07;
  double get authUserInputFieldWidth => 0.875;
  double get authGetStartedHeight => 0.07;
  double get authGetStartedWidth => 0.45;
  // #endregion

  // #region forgotPassword
  double get forgotPasswordTitleWidth => 1.0;
  double get forgotPasswordBoxConstraintFocused => 1.1;
  double get forgotPasswordBoxConstraintUnfocused => 1.0;
  double get forgotPasswordCenterPieceHeight => 0.6;
  double get forgotPasswordCenterPieceWidth => 0.6;
  double get forgotPasswordUserInputFieldHeight => 0.07;
  double get forgotPasswordUserInputFieldWidth => 0.875;
  double get forgotPasswordSendHeight => 0.07;
  double get forgotPasswordSendWidth => 0.45;
  // #endregion

  // #region settings
  double get settingsTitleWidth => 1.0;
  double get settingDropdownHeight => 0.4;
  // #endregion
}

double getDimension(BuildContext context, bool isHeight, double value) {
  return isHeight
      ? MediaQuery.of(context).size.height * value
      : MediaQuery.of(context).size.width * value;
}
