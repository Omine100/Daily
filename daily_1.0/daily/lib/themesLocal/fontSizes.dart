import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomConnectedFontSize on TextTheme {
  // #region userIStandards
  double get userIStandardsToastMessageContent => 18.0;
  double get userIStandardsTextInputContent => 22.0;
  // #endregion
}

extension CustomWebFontSize on TextTheme {
  // #region textViewer
  double get textViewerWebText => 14.0;
  // #endregion

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
  // #region textViewer
  double get textViewerMobileText => 14.0;
  // #endregion

  // #region welcome
  double get welcomeMobileTitle => 48;
  double get welcomeMobileSubtitle => 32;
  double get welcomeMobileGetStartedText => 20;
  double get welcomeMobileAccountAlready => 16;
  double get welcomeMobileAccountAlreadyLogin => 16;
  // #endregion

  // #region auth
  double get authMobileTitle => 48;
  double get authMobileSubtitle => 32;
  double get authMobileUserInputFieldDecoration => 20;
  double get authMobileForgotPassword => 16;
  double get authMobilePolicyAndTaC => 14;
  double get authMobileGetStartedText => 20;
  double get authMobileSwitchPrimary => 16;
  double get authMobileSwitchSecondary => 16;
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
