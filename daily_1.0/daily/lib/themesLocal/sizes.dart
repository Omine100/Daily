import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomWebSizes on MaterialTapTargetSize {}

extension CustomMobileSizes on MaterialTapTargetSize {
  // #region settings
  double get settingsSheetMinSize => 0.87;
  double get settingsSheetSize => 1.0;
  // #endregion
}
