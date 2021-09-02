import 'package:flutter/material.dart'; 

//Install extension '#region folding for VS Code'

extension CustomColorScheme on ColorScheme {
  // #region essential
  Color materialTransparent() {
    return IsDark() ? Color(0x00FFFFFF) : Color(0x00FFFFFF);
  }
  // #endregion

  // #region gradients
  Color gradientsBackgroundTopRight() {
    return IsDark() ? Color(0xFF102449) : Color(0xFFFF99D1);
  }

  Color gradientsBackgroundBottomLeft() {
    return IsDark() ? Color(0xFF1B1B2D) : Color(0xFFFFAB5F);
  }
  // #endregion

  // #region userIStandards
  Color userIStandardsCameraButton() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }

  Color userIStandardsThemeSelector() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }

  Color userIStandardsLanguageSelectorBackground() {
    return IsDark() ? Color(0xFF102457) : Color(0xFFFFFFFF);
  }

  Color userIStandardsLanguageSelectorContent() {
    return IsDark() ? Color(0xFFFFFFFF) : Color(0xFF000000);
  }

  Color userIStandardsLanguageSelectorIcon() {
    return IsDark() ? Color(0xFFFFFFFF) : Color(0xFF000000);
  }

  Color userIStandardsShareButton() {
    return IsDark() ? Color(0xFFFFFFFF) : Color(0xFFBDBDBD);
  }

  Color userIStandardsSocialButton() {
    return IsDark() ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  }

  Color userIStandardsToastMessageContent() {
    return IsDark() ? Color(0xFFFFFFFF) : Color(0xFFBDBDBD);
  }

  Color userIStandardsToastMessageBackground() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }

  Color userIStandardsBackButton() {
    return IsDark() ? Color(0xFFFFFFFF) : Color(0xFF000000);
  }

  Color userIStandardsTitleContent() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }

  Color userIStandardsTextInputContent() {
    return IsDark() ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  }

  Color userIStandardsTextInputLine() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }

  Color userIStandardsTextInputIcon() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }
  // #endregion

  // #region userXStandards
  Color userXStandardsProgressIndicator() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }
  // #endregion
}
