import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension CustomColorScheme on ColorScheme {
  Color materialTransparent() {
    return IsDark() ? Color(0x00FFFFFF) : Color(0x00FFFFFF);
  }

  Color gradientsBackgroundTopRight() {
    return IsDark() ? Color(0xFF102449) : Color(0xFFFF99D1);
  }

  Color gradientsBackgroundBottomLeft() {
    return IsDark() ? Color(0xFF1B1B2D) : Color(0xFFFFAB5F);
  }

  Color userIStandardsCameraButton() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }

  Color userIStandardsThemeSelector() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }

  Color userIStandardsLanguageSelector() {
    return IsDark() ? Color(0xFF102457) : Color(0xFFFFFFFF);
  }

  Color userIStandardsBackButton() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }

  Color userXStandardsProgressIndicator() {
    return IsDark() ? Color(0xFFFFAB58) : Color(0xFFFFFFFF);
  }
}
