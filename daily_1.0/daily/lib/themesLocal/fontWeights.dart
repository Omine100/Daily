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

  // #region auth
  FontWeight get authWebTitle => FontWeight.w500;
  FontWeight get authWebUserInputFieldDecoration => FontWeight.w300;
  FontWeight get authWebForgotPassword => FontWeight.w400;
  FontWeight get authWebPolicyAndTaC => FontWeight.w400;
  FontWeight get authWebGetStartedText => FontWeight.w500;
  FontWeight get authWebSwitchPrimary => FontWeight.w400;
  FontWeight get authWebSwitchSecondary => FontWeight.w500;
  // #endregion
}

extension CustomMobileFontWeight on Typography {
  // #region textViewer
  FontWeight get textViewerMobileText => FontWeight.w300;
  // #endregion

  // #region welcome
  FontWeight get welcomeMobileTitle => FontWeight.w500;
  FontWeight get welcomeMobileCardText => FontWeight.w500;
  FontWeight get welcomeMobileCardSubText => FontWeight.w300;
  FontWeight get welcomeMobileGetStartedText => FontWeight.w500;
  FontWeight get welcomeMobileAccountAlready => FontWeight.w400;
  FontWeight get welcomeMobileAccountAlreadyLogin => FontWeight.w500;
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
  FontWeight get settingsBoxTextTitle => FontWeight.w600;
  FontWeight get settingsBoxText => FontWeight.w300;
  // #endregion
}
