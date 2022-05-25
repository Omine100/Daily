import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomConnectedConstraints on BottomAppBarTheme {
  // #region base
  BoxConstraints get baseConstraints =>
      BoxConstraints.expand(height: double.maxFinite);
  // #endregion
}

extension CustomWebConstraints on BottomAppBarTheme {
  // #region error
  BoxConstraints get errorWebCardContainer =>
      BoxConstraints(minHeight: 200, minWidth: 200);
  BoxConstraints get errorWebText => BoxConstraints(minWidth: 100);
  // #endregion

  // #region auth
  BoxConstraints get authWebCardContainer =>
      BoxConstraints(minHeight: 400, minWidth: 300);
  BoxConstraints get authWebUserInputField =>
      BoxConstraints(minHeight: 35, minWidth: 100);
  BoxConstraints get authWebGetStarted =>
      BoxConstraints(minHeight: 35, minWidth: 100);
  // #endregion

  // #region verify
  BoxConstraints get verifyWebLogin =>
      BoxConstraints(minHeight: 35, minWidth: 100);
  // #endregion
}

extension CustomMobileConstraints on BottomAppBarTheme {
  // #region auth
  BoxConstraints get authMobileCardContainer =>
      BoxConstraints(minHeight: 200, minWidth: 200);
  // #endregion
}
