import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomWebFontSize on TextTheme {
  // #region auth
  double get authWebTitle => 48;
  double get authWebUserInputFieldDecoration => 20;
  double get authWebForgotPassword => 16;
  double get authWebPolicyAndTaC => 14;
  double get authWebGetStartedText => 20;
  double get authWebSwitchPrimary => 16;
  double get authWebSwitchSecondary => 16;
  // #endregion
}

extension CustomMobileFontSize on TextTheme {
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
  double get authPolicyAndTaC => 14;
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
  double get settingsBoxTextTitle => 20;
  double get settingsBoxText => 16;
  // #endregion
}
