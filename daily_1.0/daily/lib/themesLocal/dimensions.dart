import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';

//Install extension '#region folding for VS Code'

extension CustomConnectedDimensions on VisualDensity {
  // #region userIStandards
  double get userIStandardsSocialButtonHeight => 0.05;
  double get userIStandardsSocialButtonWidth => 0.05;
  // #endregion

  // #region auth
  double get authBoxConstraintFocused => 1.2;
  double get authBoxConstraintUnfocused => 1.0;
  // #endregion
}

extension CustomWebDimensions on VisualDensity {
  // #region welcome
  double get authWebCenterPieceHeight => isSmall ? 1.0 : 1.0;
  double get authWebCenterPieceWidth => isSmall ? 1.0 : 0.6;
  double get authWebCardHeight => isSmall ? 0.8 : 1.0;
  double get authWebCardWidth => isSmall ? 0.75 : 0.5;
  double get authWebUserInputWidth => isSmall ? 0.5 : 0.35;
  double get authWebUserInputFieldHeight => isSmall ? 0.05 : 0.05;
  double get authWebForgotPasswordWidth => isSmall ? 0.47 : 0.32;
  double get authWebGetStartedHeight => isSmall ? 0.065 : 0.065;
  double get authWebGetStartedWidth => isSmall ? 0.2025 : 0.2025;
  // #endregion

  // #region forgotPassword
  double get forgotPasswordWebCenterPieceHeight => isSmall ? 1.0 : 1.0;
  double get forgotPasswordWebCenterPieceWidth => isSmall ? 1.0 : 1.0;
  double get forgotPasswordWebUserInputFieldHeight => isSmall ? 0.05 : 0.05;
  double get forgotPasswordWebUserInputFieldWidth => isSmall ? 0.5 : 0.35;
  double get forgotPasswordWebSendHeight => isSmall ? 0.065 : 0.065;
  double get forgotPasswordWebSendWidth => isSmall ? 0.2025 : 0.2025;
  // #endregion
}

extension CustomMobileDimensions on VisualDensity {
  // #region welcome
  double get welcomeMobileTitleWidth => isSmall ? 1.0 : 1.0;
  double get welcomeMobileCarouselHeight => isSmall ? 0.50 : 0.50;
  double get welcomeMobileCarouselWidth => isSmall ? 1.0 : 1.0;
  double get welcomeMobileCarouselSelectorHeightCurrent =>
      isSmall ? 0.045 : 0.045;
  double get welcomeMobileCarouselSelectorHeightNotCurrent =>
      isSmall ? 0.025 : 0.025;
  double get welcomeMobileCarouselSelectorWidth => isSmall ? 0.025 : 0.025;
  double get welcomeMobileCornerHeight => isSmall ? 0.22 : 0.22;
  double get welcomeMobileGetStartedHeight => isSmall ? 0.065 : 0.065;
  double get welcomeMobileGetStartedWidth => isSmall ? 0.45 : 0.45;
  // #endregion

  // #region auth
  double get authMobileTitleWidth => isSmall ? 1.0 : 1.0;
  double get authMobileCenterPieceHeight => isSmall ? 0.35 : 0.35;
  double get authMobileUserInputFieldHeight => isSmall ? 0.06 : 0.06;
  double get authMobileUserInputFieldWidth => isSmall ? 0.875 : 0.875;
  double get authMobileForgotPasswordWidth => isSmall ? 0.85 : 0.85;
  double get authMobileGetStartedHeight => isSmall ? 0.065 : 0.065;
  double get authMobileGetStartedWidth => isSmall ? 0.45 : 0.45;
  // #endregion

  // #region forgotPassword
  double get forgotPasswordTitleWidth => 1.0;
  double get forgotPasswordBoxConstraintFocused => 1.1;
  double get forgotPasswordBoxConstraintUnfocused => 1.0;
  double get forgotPasswordCenterPieceHeight => 0.6;
  double get forgotPasswordCenterPieceWidth => 0.6;
  double get forgotPasswordUserInputFieldHeight => 0.065;
  double get forgotPasswordUserInputFieldWidth => 0.875;
  double get forgotPasswordSendHeight => 0.065;
  double get forgotPasswordSendWidth => 0.45;
  // #endregion

  // #region settings
  double get settingsTitleWidth => 1.0;
  double get settingsProfileWidth => 1.0;
  double get settingsProfileIconHeight => 0.11;
  double get settingsProfileIconWidth => 0.11;
  double get settingsProfileInfoWidth => 0.5;
  double get settingsCardHeight => 1.0;
  double get settingsCardWidth => 1.0;
  double get settingsCardSheetContainerHeight => 1.0;
  double get settingsCardSheetContainerWidth => 0.9;
  double get settingsSheetMinSize => 0.87;
  double get settingsSheetSize => 1.0;
  double get settingDropdownHeight => 0.4;
  // #endregion
}

double getDimension(BuildContext context, bool isHeight, double value) {
  return isHeight
      ? MediaQuery.of(context).size.height * value
      : MediaQuery.of(context).size.width * value;
}
