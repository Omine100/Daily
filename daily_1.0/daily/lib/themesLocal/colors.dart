import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';

//Install extension '#region folding for VS Code'

extension CustomColorScheme on ColorScheme {
  // #region essential
  Color get materialTransparent => Color(isDark ? 0x00FFFFFF : 0x00FFFFFF);
  // #endregion

  // #region gradients
  Color get gradientsBackgroundTopRight =>
      Color(isDark ? 0xFF102449 : 0xFFFF99D1);
  Color get gradientsBackgroundBottomLeft =>
      Color(isDark ? 0xFF1B1B2D : 0xFFFFAB5F);
  // #endregion

  // #region userIStandards
  Color get userIStandardsCameraButton =>
      Color(isDark ? 0xFFFFAB58 : 0xFFFFFFFF);
  Color get userIStandardsShareButton =>
      Color(isDark ? 0xFFFFFFFF : 0xFFBDBDBD);
  Color get userIStandardsSocialButton =>
      Color(isDark ? 0xFFFFFFFF : 0xFFFFFFFF);
  Color get userIStandardsToastMessageContent =>
      Color(isDark ? 0xFFFFFFFF : 0xFFBDBDBD);
  Color get userIStandardsToastMessageBackground =>
      Color(isDark ? 0xFFFFAB58 : 0xFFFFFFFF);
  Color get userIStandardsTextInputContent =>
      Color(isDark ? 0xFFFFFFFF : 0xFFFFFFFF);
  Color get userIStandardsTextInputLine =>
      Color(isDark ? 0xFFFFAB58 : 0xFFFFFFFF);
  Color get userIStandardsTextInputIcon =>
      Color(isDark ? 0xFFFFAB58 : 0xFFFFFFFF);
  // #endregion

  // #region userXStandards
  Color get userXStandardsProgressIndicator =>
      Color(isDark ? 0xFFFFAB58 : 0xFFFFFFFF);
  // #endregion

  // #region welcome
  Color get welcomeBackground => Color(isDark ? 0xFFFBFAF5 : 0xFFFBFAF5);
  Color get welcomeTitle => Color(isDark ? 0xFF333333 : 0xFF333333);
  Color get welcomeSubtitle => Color(isDark ? 0xFF333333 : 0xFF333333);
  Color get welcomeCarouselCurrent => Color(isDark ? 0xFFEF5350 : 0xFFEF5350);
  Color get welcomeCarouselNotCurrent =>
      Color(isDark ? 0xFFDDDDDD : 0xFFDDDDDD);
  Color get welcomeGetStartedText => Color(isDark ? 0xFFFFFFFF : 0xFFFFFFFF);
  Color get welcomeGetStartedInkWell => Color(isDark ? 0xFFFF5350 : 0xFFFF9999);
  Color get welcomeGetStarted => Color(isDark ? 0xFFEF5350 : 0xFFFF4350);
  Color get welcomeAccountAlready => Color(isDark ? 0xFF333333 : 0xFF333333);
  Color get welcomeAccountAlreadyLogin =>
      Color(isDark ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region auth
  Color get authBackground => Color(isDark ? 0xFFFBFAF5 : 0xFFFBFAF5);
  Color get authTitle => Color(isDark ? 0xFF333333 : 0xFF333333);
  Color get authSubtitle => Color(isDark ? 0xFF333333 : 0xFF333333);
  Color get authUserInputField => Color(isDark ? 0xFFEEEEEE : 0xFFEEEEEE);
  Color get authUserInputFieldDecoration =>
      Color(isDark ? 0xFF000000 : 0xFF000000);
  Color get authUserInputFieldIconDecoration =>
      Color(isDark ? 0xFF888888 : 0xFF888888);
  Color get authForgotPassword => Color(isDark ? 0xFF333333 : 0xFF333333);
  Color get authGetStartedText => Color(isDark ? 0xFFFFFFFF : 0xFFFFFFFF);
  Color get authGetStartedInkWell => Color(isDark ? 0xFFFF5350 : 0xFFFF9999);
  Color get authGetStarted => Color(isDark ? 0xFFEF5350 : 0xFFFF4350);
  Color get authSwitchPrimary => Color(isDark ? 0xFF333333 : 0xFF333333);
  Color get authSwitchSecondary => Color(isDark ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region settings
  Color get settingsBackground => Color(isDark ? 0xFFBFAF5 : 0xFFFBFAF5);
  // #endregion
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
