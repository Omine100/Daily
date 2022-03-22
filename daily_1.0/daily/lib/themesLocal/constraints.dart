import 'package:flutter/material.dart';

//Install extension '#region folding for VS Code'

extension CustomConnectedConstraints on BottomAppBarTheme {}

extension CustomWebConstraints on BottomAppBarTheme {
  // #region auth
  BoxConstraints get authWebCard =>
      BoxConstraints(minHeight: 400, minWidth: 300);
  // #endregion
}

extension CustomMobileConstraints on BottomAppBarTheme {
  // #region auth
  BoxConstraints get authMobileCard =>
      BoxConstraints(minHeight: 100, minWidth: 100);
  // #endregion
}
