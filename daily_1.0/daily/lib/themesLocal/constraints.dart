import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomConnectedConstraints on BottomAppBarTheme {}

extension CustomWebConstraints on BottomAppBarTheme {
  // #region error
  BoxConstraints get errorWebCardContainer =>
      BoxConstraints(minHeight: 200, minWidth: 200);
  // #endregion

  // #region auth
  BoxConstraints get authWebCardContainer =>
      BoxConstraints(minHeight: 400, minWidth: 300);
  // #endregion
}

extension CustomMobileConstraints on BottomAppBarTheme {
  // #region auth
  BoxConstraints get authMobileCardContainer =>
      BoxConstraints(minHeight: 200, minWidth: 200);
  // #endregion
}
