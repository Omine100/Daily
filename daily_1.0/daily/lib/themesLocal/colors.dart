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
  Color get userIStandardsThemeSelector =>
      isDark ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsLanguageSelectorBackground =>
      isDark ? Color(0xFF102457) : Color(0xFFFFFFFF);
  Color get userIStandardsLanguageSelectorContent =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFF000000);
  Color get userIStandardsLanguageSelectorIcon =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFF000000);
  Color get userIStandardsShareButton =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFBDBDBD);
  Color get userIStandardsSocialButton =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  Color get userIStandardsToastMessageContent =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFFBDBDBD);
  Color get userIStandardsToastMessageBackground =>
      isDark ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsBackButton =>
      isDark ? Color(0xFFFFFFFF) : Color(0xFF000000);
  Color get userIStandardsTitleContent =>
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
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
