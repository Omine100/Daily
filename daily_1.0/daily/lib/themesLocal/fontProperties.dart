import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomFontSize on TextTheme {
  // #region userIStandards
  double get userIStandardsToastMessageContent => 18.0;
  double get userIStandardsTitleContent => 30.0;
  double get userIStandardsTextInputContent => 22.0;
  // #endregion

  // #region welcome
  double get welcomeTitle => 48;
  double get welcomeSubtitle => 32;
  double get welcomeAccounAlready => 16;
  double get welcomeGetStarted => 20;
  // #endregion
}

extension CustomFontWeight on Typography {
  // #region userIStandards
  FontWeight get userIStandardsToastMessageContent => FontWeight.w400;
  FontWeight get userIStandardsTitleContent => FontWeight.w600;
  FontWeight get userIStandardsTextInputContent => FontWeight.w300;
  // #endregion

  // #region welcome
  FontWeight get welcomeTitle => FontWeight.w500;
  FontWeight get welcomeSubtitle => FontWeight.w300;
  FontWeight get welcomeAccountAlready => FontWeight.w400;
  FontWeight get welcomeGetStarted => FontWeight.w400;
  // #endregion
}