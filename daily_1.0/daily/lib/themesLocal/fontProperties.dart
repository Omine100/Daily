import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomFontSize on TextTheme {
  // #region userIStandards
  double get userIStandardsToastMessageContent => 18.0;
  double get userIStandardsTextInputContent => 22.0;
  // #endregion

  // #region welcome
  double get welcomeTitle => 48;
  double get welcomeSubtitle => 32;
  double get welcomeGetStartedText => 20;
  double get welcomeAccountAlready => 16;
  double get welcomeAccountAlreadyLogin => 16;
  // #endregion

  // #region auth
  double get authTitle => 48;
  double get authSubtitle => 32;
  double get authUserInputFieldDecoration => 20;
  double get authForgotPassword => 16;
  double get authGetStartedText => 20;
  double get authSwitchPrimary => 16;
  double get authSwitchSecondary => 16;
  // #endregion
}

extension CustomFontWeight on Typography {
  // #region userIStandards
  FontWeight get userIStandardsToastMessageContent => FontWeight.w400;
  FontWeight get userIStandardsTextInputContent => FontWeight.w300;
  // #endregion

  // #region welcome
  FontWeight get welcomeTitle => FontWeight.w500;
  FontWeight get welcomeSubtitle => FontWeight.w300;
  FontWeight get welcomeGetStartedText => FontWeight.w500;
  FontWeight get welcomeAccountAlready => FontWeight.w400;
  FontWeight get welcomeAccountAlreadyLogin => FontWeight.w500;
  // #endregion

  // #region auth
  FontWeight get authTitle => FontWeight.w500;
  FontWeight get authSubtitle => FontWeight.w300;
  FontWeight get authUserInputFieldDecoration => FontWeight.w300;
  FontWeight get authForgotPassword => FontWeight.w400;
  FontWeight get authGetStartedText => FontWeight.w500;
  FontWeight get authSwitchPrimary => FontWeight.w400;
  FontWeight get authSwitchSecondary => FontWeight.w500;
  // #endregion
}
