import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomDimensions on VisualDensity {
  // #region userIStandards
  double get userIStandardsSocialButtonHeight => 0.05;
  double get userIStandardsSocialButtonWidth => 0.05;
  // #endregion

  // #region welcome
  double get welcomeTitleWidth => 1.0;
  double get welcomeUserInputGlassHeight => 0.07;
  double get welcomeUserInputGlassWidth => 0.55; 
  // #endregion
}

double getDimension(BuildContext context, bool isHeight, double value) {
  return isHeight ? 
    MediaQuery.of(context).size.height * value :
    MediaQuery.of(context).size.width * value;
}