import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomFontSize on TextTheme {
  // #region userIStandards
  double get userIStandardsToastMessageContent => 18.0;
  double get userIStandardsTextInputContent => 22.0;
  // #endregion

  // #region textViewer
  double get textViewerText => 14.0;
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
  double get authPolicyAndTaC => 16;
  double get authGetStartedText => 20;
  double get authSwitchPrimary => 16;
  double get authSwitchSecondary => 16;
  // #endregion

  // #region forgotPassword
  double get forgotPasswordTitle => 30;
  double get forgotPasswordSubtitle => 18;
  double get forgotPasswordUserInputFieldDecoration => 20;
  double get forgotPasswordSendText => 20;
  double get forgotPasswordResendPrimary => 16;
  double get forgotPasswordResendSecondary => 16;
  // #endregion

  // #region settings
  double get settingsTitle => 30;
  double get settingsProfileName => 26;
  double get settingsProfileEmail => 18;
  double get settingsGroupTitle => 22;
  double get settingsRowText => 18;
  double get settingDropdownText => 18;
  double get settingsSignOut => 18;
  // #endregion
}

extension CustomFontWeight on Typography {
  // #region userIStandards
  FontWeight get userIStandardsToastMessageContent => FontWeight.w400;
  FontWeight get userIStandardsTextInputContent => FontWeight.w300;
  // #endregion

  // #region textViewer
  FontWeight get textViewerText => FontWeight.w300;
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
  FontWeight get authPolicyAndTaC => FontWeight.w400;
  FontWeight get authGetStartedText => FontWeight.w500;
  FontWeight get authSwitchPrimary => FontWeight.w400;
  FontWeight get authSwitchSecondary => FontWeight.w500;
  // #endregion

  // #region forgotPassword
  FontWeight get forgotPasswordTitle => FontWeight.w500;
  FontWeight get forgotPasswordSubtitle => FontWeight.w300;
  FontWeight get forgotPasswordUserInputFieldDecoration => FontWeight.w300;
  FontWeight get forgotPasswordSendText => FontWeight.w500;
  FontWeight get forgotPasswordResendPrimary => FontWeight.w400;
  FontWeight get forgotPasswordResendSecondary => FontWeight.w500;
  // #endregion

  // #region settings
  FontWeight get settingsTitle => FontWeight.w500;
  FontWeight get settingsProfileName => FontWeight.w500;
  FontWeight get settingsProfileEmail => FontWeight.w300;
  FontWeight get settingsGroupTitle => FontWeight.w500;
  FontWeight get settingsRowText => FontWeight.w400;
  FontWeight get settingsSignOut => FontWeight.w400;
  // #endregion
}
