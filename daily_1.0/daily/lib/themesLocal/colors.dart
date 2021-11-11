import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';

//Install extension '#region folding for VS Code'

extension CustomColorScheme on ColorScheme {
  // #region essential
  Color get materialTransparent =>
      isDark ? Color(0x00FFFFFF) : Color(0x00FFFFFF);
  // #endregion

  // #region gradients
  Color get gradientsBackgroundTopRight =>
      isDark ? Color(0xFF102449) : Color(0xFFFF99D1);
  Color get gradientsBackgroundBottomLeft =>
      isDark ? Color(0xFF1B1B2D) : Color(0xFFFFAB5F);
  // #endregion

  // #region userIStandards
  Color get userIStandardsCameraButton =>
      isDark ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsShareButton =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFBDBDBD);
  Color get userIStandardsSocialButton =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  Color get userIStandardsToastMessageContent =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFBDBDBD);
  Color get userIStandardsToastMessageBackground =>
      isDark ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsTextInputContent =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  Color get userIStandardsTextInputLine =>
      isDark ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsTextInputIcon =>
      isDark ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  // #endregion

  // #region userXStandards
  Color get userXStandardsProgressIndicator =>
      isDark ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  // #endregion

  // #region welcome
  Color get welcomeBackground => isDark ? Color(0xFFFBFAF5) : Color(0xFFFBFAF5);
  Color get welcomeTitle => isDark ? Color(0xFF333333) : Color(0xFF333333);
  Color get welcomeSubtitle => isDark ? Color(0xFF333333) : Color(0xFF333333);
  Color get welcomeCarouselCurrent =>
      isDark ? Color(0xFFEF5350) : Color(0xFFEF5350);
  Color get welcomeCarouselNotCurrent =>
      isDark ? Color(0xFFDDDDDD) : Color(0xFFDDDDDD);
  Color get welcomeAccountAlready =>
      isDark ? Color(0xFF333333) : Color(0xFF333333);
  Color get welcomeAccountAlreadyLogin =>
      isDark ? Color(0xFFEF5350) : Color(0xFFFF4350);
  Color get welcomeGetStartedText =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  Color get welcomeGetStartedInkWell =>
      isDark ? Color(0xFFFF5350) : Color(0xFFFF9999);
  Color get welcomeGetStarted => isDark ? Color(0xFFEF5350) : Color(0xFFFF4350);
  // #endregion

  // #region auth
  Color get authBackground => isDark ? Color(0xFFFBFAF5) : Color(0xFFFBFAF5);
  Color get authTitle => isDark ? Color(0xFF333333) : Color(0xFF333333);
  Color get authSubtitle => isDark ? Color(0xFF333333) : Color(0xFF333333);
  Color get authGetStartedText =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  Color get authGetStartedInkWell =>
      isDark ? Color(0xFFFF5350) : Color(0xFFFF9999);
  Color get authGetStarted => isDark ? Color(0xFFEF5350) : Color(0xFFFF4350);
  // #endregion
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
