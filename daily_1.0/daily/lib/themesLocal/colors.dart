import 'package:flutter/material.dart'; 

//Install extension '#region folding for VS Code'

extension CustomColorScheme on ColorScheme {
  // #region essential
  Color get materialTransparent => IsDark() ? Color(0x00FFFFFF) : Color(0x00FFFFFF);
  // #endregion

  // #region gradients
  Color get gradientsBackgroundTopRight => IsDark() ? Color(0xFF102449) : Color(0xFFFF99D1);
  Color get gradientsBackgroundBottomLeft => IsDark() ? Color(0xFF1B1B2D) : Color(0xFFFFAB5F);
  // #endregion

  // #region userIStandards
  Color get userIStandardsCameraButton => IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsThemeSelector => IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsLanguageSelectorBackground => IsDark() ? Color(0xFF102457) : Color(0xFFFFFFFF);
  Color get userIStandardsLanguageSelectorContent => IsDark() ? Color(0xFFFFFFFF) : Color(0xFF000000);
  Color get userIStandardsLanguageSelectorIcon => IsDark() ? Color(0xFFFFFFFF) : Color(0xFF000000);
  Color get userIStandardsShareButton => IsDark() ? Color(0xFFFFFFFF) : Color(0xFFBDBDBD);
  Color get userIStandardsSocialButton => IsDark() ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  Color get userIStandardsToastMessageContent() => IsDark() ? Color(0xFFFFFFFF) : Color(0xFFBDBDBD);
  Color get userIStandardsToastMessageBackground => IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsBackButton => IsDark() ? Color(0xFFFFFFFF) : Color(0xFF000000);
  Color get userIStandardsTitleContent => IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsTextInputContent => IsDark() ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  Color get userIStandardsTextInputLine => IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  Color get userIStandardsTextInputIcon => IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  // #endregion

  // #region userXStandards
  Color get userXStandardsProgressIndicator => IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  // #endregion
}
