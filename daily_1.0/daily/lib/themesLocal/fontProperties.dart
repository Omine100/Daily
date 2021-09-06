import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomFontSize on TextTheme {
  // #region userIStandards
  double get userIStandardsToastMessageContent => 18.0;
  double get userIStandardsTitleContent => 30.0;
  double get userIStandardsTextInputContent => 22.0;
  // #endregion
}

extension CustomFontWeight on Typography {
  // #region userIStandards
  FontWeight get userIStandardsToastMessageContent => FontWeight.w400;
  FontWeight get userIStandardsTitleContent => FontWeight.w600;
  FontWeight get userIStandardsTextInputContent => FontWeight.w300;
  // #endregion
}