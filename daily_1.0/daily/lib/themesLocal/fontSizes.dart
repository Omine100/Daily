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

  // #region error
  double get errorWebTitle => 96;
  double get errorWebSubtitle => 30;
  double get errorWebText => 18;
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

  // #region forgotPassword
  double get forgotPasswordWebTitle => 48;
  double get forgotPasswordWebSubtitle => 18;
  double get forgotPasswordWebUserInputFieldDecoration => 20;
  double get forgotPasswordWebSendText => 20;
  double get forgotPasswordWebResendPrimary => 16;
  double get forgotPasswordWebResendSecondary => 16;
  double get forgotPasswordWebRemembered => 16;
  // #endregion

  // #region verify
  double get verifyWebTitle => 48;
  double get verifyWebSubtitle => 18;
  double get verifyWebLoginText => 20;
  double get verifyWebResendPrimary => 16;
  double get verifyWebResendSecondary => 16;
  double get verifyWebSwitchBack => 16;
  // #endregion

  // #region home
  double get homeWebProfileName => 20;
  double get homeWebProfileEmail => 12;
  // #endregion
}

extension CustomMobileFontSize on TextTheme {
  // #region textViewer
  double get textViewerMobileText => 14.0;
  // #endregion

  // #region auth
  double get authMobileTitle => 48;
  double get authMobileUserInputFieldDecoration => 20;
  double get authMobileForgotPassword => 16;
  double get authMobilePolicyAndTaC => 14;
  double get authMobileGetStartedText => 20;
  double get authMobileSwitchPrimary => 16;
  double get authMobileSwitchSecondary => 16;
  double get authMobileCardText => 32;
  double get authMobileCardSubText => 18;
  // #endregion

  // #region forgotPassword
  double get forgotPasswordMobileTitle => 30;
  double get forgotPasswordMobileSubtitle => 18;
  double get forgotPasswordMobileUserInputFieldDecoration => 20;
  double get forgotPasswordMobileSendText => 20;
  double get forgotPasswordMobileResendPrimary => 16;
  double get forgotPasswordMobileResendSecondary => 16;
  // #endregion

  // #region verify
  double get verifyMobileTitle => 48;
  double get verifyMobileSubtitle => 18;
  double get verifyMobileLoginText => 20;
  double get verifyMobileResendPrimary => 16;
  double get verifyMobileResendSecondary => 16;
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
