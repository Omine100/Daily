import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';

//Install extension '#region folding for VS Code'

extension CustomColorScheme on ColorScheme {
  // #region essential
  Color get materialTransparent =>
      Color(isDark.value ? 0x00FFFFFF : 0x00FFFFFF);
  // #endregion

  // #region gradients
  Color get gradientsBackgroundTopRight =>
      Color(isDark.value ? 0xFF102449 : 0xFFFF99D1);
  Color get gradientsBackgroundBottomLeft =>
      Color(isDark.value ? 0xFF1B1B2D : 0xFFFFAB5F);
  // #endregion

  // #region userIStandards
  Color get userIStandardsDialogBackground =>
      Color(isDark.value ? 0xFF424242 : 0xFFFBFAF5);
  Color get userIStandardsDialogText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get userIStandardsDialogIcon =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get userIStandardsCameraButton =>
      Color(isDark.value ? 0xFFFFAB58 : 0xFFFFFFFF);
  Color get userIStandardsShareButton =>
      Color(isDark.value ? 0xFFFFFFFF : 0xFFBDBDBD);
  Color get userIStandardsSocialButton =>
      Color(isDark.value ? 0xFFFFFFFF : 0xFFFFFFFF);
  Color get userIStandardsToastMessageBackground =>
      Color(isDark.value ? 0xFFFF4350 : 0xFFFF4350);
  Color get userIStandardsToastMessageContent =>
      Color(isDark.value ? 0xFFFFFFFF : 0xFFFFFFFF);
  Color get userIStandardsTextInputContent =>
      Color(isDark.value ? 0xFFFFFFFF : 0xFFFFFFFF);
  Color get userIStandardsTextInputLine =>
      Color(isDark.value ? 0xFFFFAB58 : 0xFFFFFFFF);
  Color get userIStandardsTextInputIcon =>
      Color(isDark.value ? 0xFFFFAB58 : 0xFFFFFFFF);
  // #endregion

  // #region userXStandards
  Color get userXStandardsProgressIndicator =>
      Color(isDark.value ? 0xFFFFAB58 : 0xFFFFFFFF);
  // #endregion

  // #region welcome
  Color get welcomeBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get welcomeTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get welcomeSubtitle => Color(isDark.value ? 0xFFAAAAAA : 0xFF111111);
  Color get welcomeCarouselCurrent =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFEF5350);
  Color get welcomeCarouselNotCurrent =>
      Color(isDark.value ? 0xFFAAAAAA : 0xFFDDDDDD);
  Color get welcomeGetStarted => Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get welcomeGetStartedInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get welcomeGetStartedText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get welcomeAccountAlready =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get welcomeAccountAlreadyLogin =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region auth
  Color get authBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get authUserInputField => Color(isDark.value ? 0xFF333333 : 0xFFEEEEEE);
  Color get authUserInputFieldText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get authUserInputFieldDecoration =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get authUserInputFieldIconDecoration =>
      Color(isDark.value ? 0xFF555555 : 0xFF888888);
  Color get authForgotPassword => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authGetStarted => Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get authGetStartedInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get authGetStartedText => Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get authSwitchPrimary => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authSwitchSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region forgotPass
  Color get forgotPasswordBackground =>
      Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get forgotPasswordTitle =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordSubtitle =>
      Color(isDark.value ? 0xFF999999 : 0xFF999999);
  Color get forgotPasswordUserInputField =>
      Color(isDark.value ? 0xFF333333 : 0xFFEEEEEE);
  Color get forgotPasswordUserInputFieldText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordUserInputFieldDecoration =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get forgotPasswordUserInputFieldIconDecoration =>
      Color(isDark.value ? 0xFF555555 : 0xFF888888);
  Color get forgotPasswordSend => Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get forgotPasswordSendInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get forgotPasswordSendText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordResendPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordResendSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region settings
  Color get settingsBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get settingsTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get settingsProfileBackground =>
      Color(isDark.value ? 0xFF666666 : 0xFF999999);
  Color get settingsProfileIcon =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get settingsProfileName =>
      Color(isDark.value ? 0xFFAAAAAA : 0xFF444444);
  Color get settingsProfileEmail =>
      Color(isDark.value ? 0xFFBBBBBB : 0xFF555555);
  Color get settingsCard => Color(isDark.value ? 0xFF323232 : 0xFFEDEDED);
  Color get settingsGroupTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get settingsRowText => Color(isDark.value ? 0xFF888888 : 0xFF555555);
  Color get settingSwitchActiveThumb =>
      Color(isDark.value ? 0xFFFF4350 : 0xFFFF4350);
  Color get settingSwitchActiveTrack =>
      Color(isDark.value ? 0xFFFF4350 : 0xFFFF8390);
  Color get settingSwitchInactiveThumb =>
      Color(isDark.value ? 0xFF939393 : 0xFF939393);
  Color get settingSwitchInactiveTrack =>
      Color(isDark.value ? 0xFFD3D3D3 : 0xFFD3D3D3);
  Color get settingDropdownBackground =>
      Color(isDark.value ? 0xFF666666 : 0xFFFFFFFF);
  Color get settingDropdownText =>
      Color(isDark.value ? 0xFFBBBBBB : 0xFF555555);
  Color get settingsSignOut => Color(isDark.value ? 0xFFFF4350 : 0xFFFF4350);
  // #endregion
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
