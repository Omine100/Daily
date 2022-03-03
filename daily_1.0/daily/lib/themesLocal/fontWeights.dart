import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomConnectedFontSize on Typography {
  // #region userIStandards
  FontWeight get userIStandardsToastMessageContent => FontWeight.w400;
  FontWeight get userIStandardsTextInputContent => FontWeight.w300;
  // #endregion
}

extension CustomWebFontWeight on Typography {
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
  FontWeight get settingsBoxTextTitle => FontWeight.w600;
  FontWeight get settingsBoxText => FontWeight.w300;
  // #endregion
}
