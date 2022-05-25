import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomConnectedFontSize on Typography {
  // #region userIStandards
  FontWeight get userIStandardsToastMessageContent => FontWeight.w400;
  FontWeight get userIStandardsTextInputContent => FontWeight.w300;
  // #endregion
}

extension CustomWebFontWeight on Typography {
  // #region textViewer
  FontWeight get textViewerWebText => FontWeight.w300;
  // #endregion

  // #region error
  FontWeight get errorWebTitle => FontWeight.w800;
  FontWeight get errorWebSubtitle => FontWeight.w600;
  FontWeight get errorWebText => FontWeight.w300;
  // #endregion

  // #region auth
  FontWeight get authWebTitle => FontWeight.w500;
  FontWeight get authWebUserInputFieldDecoration => FontWeight.w300;
  FontWeight get authWebForgotPassword => FontWeight.w400;
  FontWeight get authWebPolicyAndTaC => FontWeight.w400;
  FontWeight get authWebGetStartedText => FontWeight.w500;
  FontWeight get authWebSwitchPrimary => FontWeight.w400;
  FontWeight get authWebSwitchSecondary => FontWeight.w500;
  FontWeight get authMobileCardText => FontWeight.w500;
  FontWeight get authMobileCardSubText => FontWeight.w300;
  // #endregion

  // #region forgotPassword
  FontWeight get forgotPasswordWebTitle => FontWeight.w500;
  FontWeight get forgotPasswordWebSubtitle => FontWeight.w300;
  FontWeight get forgotPasswordWebUserInputFieldDecoration => FontWeight.w300;
  FontWeight get forgotPasswordWebSendText => FontWeight.w500;
  FontWeight get forgotPasswordWebResendPrimary => FontWeight.w400;
  FontWeight get forgotPasswordWebResendSecondary => FontWeight.w500;
  FontWeight get forgotPasswordWebRemembered => FontWeight.w300;
  // #endregion

  // #region verify
  FontWeight get verifyWebTitle => FontWeight.w500;
  FontWeight get verifyWebSubtitle => FontWeight.w300;
  FontWeight get verifyWebLoginText => FontWeight.w500;
  FontWeight get verifyWebResendPrimary => FontWeight.w400;
  FontWeight get verifyWebResendSecondary => FontWeight.w500;
  FontWeight get verifyWebSwitchBack => FontWeight.w300;
  // #endregion

  // #region base
  FontWeight get baseWebProfileName => FontWeight.w500;
  FontWeight get baseWebProfileEmail => FontWeight.w300;
  // #endregion
}

extension CustomMobileFontWeight on Typography {
  // #region textViewer
  FontWeight get textViewerMobileText => FontWeight.w300;
  // #endregion

  // #region auth
  FontWeight get authMobileTitle => FontWeight.w500;
  FontWeight get authMobileSubtitle => FontWeight.w300;
  FontWeight get authMobileUserInputFieldDecoration => FontWeight.w300;
  FontWeight get authMobileForgotPassword => FontWeight.w400;
  FontWeight get authMobilePolicyAndTaC => FontWeight.w400;
  FontWeight get authMobileGetStartedText => FontWeight.w500;
  FontWeight get authMobileSwitchPrimary => FontWeight.w400;
  FontWeight get authMobileSwitchSecondary => FontWeight.w500;
  // #endregion

  // #region forgotPassword
  FontWeight get forgotPasswordMobileTitle => FontWeight.w500;
  FontWeight get forgotPasswordMobileSubtitle => FontWeight.w300;
  FontWeight get forgotPasswordMobileUserInputFieldDecoration =>
      FontWeight.w300;
  FontWeight get forgotPasswordMobileSendText => FontWeight.w500;
  FontWeight get forgotPasswordMobileResendPrimary => FontWeight.w400;
  FontWeight get forgotPasswordMobileResendSecondary => FontWeight.w500;
  // #endregion

  // #region verify
  FontWeight get verifyMobileTitle => FontWeight.w500;
  FontWeight get verifyMobileSubtitle => FontWeight.w300;
  FontWeight get verifyMobileLoginText => FontWeight.w500;
  FontWeight get verifyMobileResendPrimary => FontWeight.w400;
  FontWeight get verifyMobileResendSecondary => FontWeight.w500;
  // #endregion

  // #region settings
  FontWeight get settingsTitle => FontWeight.w500;
  FontWeight get settingsProfileName => FontWeight.w500;
  FontWeight get settingsProfileEmail => FontWeight.w300;
  FontWeight get settingsGroupTitle => FontWeight.w500;
  FontWeight get settingsRowText => FontWeight.w400;
  FontWeight get settingsSignOut => FontWeight.w400;
  FontWeight get settingsBoxTextTitle => FontWeight.w600;
  FontWeight get settingsBoxText => FontWeight.w300;
  // #endregion
}
