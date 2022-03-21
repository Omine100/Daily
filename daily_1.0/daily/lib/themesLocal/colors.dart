import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';

ThemeData materialThemeData() {
  ThemeData materialTheme = ThemeData();
  return materialTheme.copyWith(
    colorScheme: materialTheme.colorScheme
        .copyWith(secondary: Color(isDark.value ? 0xFF020202 : 0xFFFFFFFF)),
  );
}

extension CustomConnectedColorScheme on ColorScheme {
  // #region essential
  Color get materialTransparent =>
      Color(isDark.value ? 0x00FFFFFF : 0x00FFFFFF);
  // #endregion

  // #region userIStandards
  Color get userIStandardsDialogBackground =>
      Color(isDark.value ? 0xFF424242 : 0xFFFBFAF5);
  Color get userIStandardsDialogText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get userIStandardsDialogIcon =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get userIStandardsCameraButton =>
      Color(isDark.value ? 0xFFFFAB58 : 0xFFFFFFFF);
  Color get userIStandardsShareButton =>
      Color(isDark.value ? 0xFFFFFFFF : 0xFFBDBDBD);
  Color get userIStandardsSocialButton =>
      Color(isDark.value ? 0xFFFFFFFF : 0xFFFFFFFF);
  Color get userIStandardsToastMessageBackgroundError =>
      Color(isDark.value ? 0xFFFF4350 : 0xFFFF4350);
  Color get userIStandardsToastMessageBackground =>
      Color(isDark.value ? 0xFF66BB6A : 0xFF66BB6A);
  Color get userIStandardsToastMessageContent =>
      Color(isDark.value ? 0xFFFFFFFF : 0xFFFFFFFF);
  // #endregion

  // #region userXStandards
  Color get userXStandardsProgressValue =>
      Color(isDark.value ? 0xFFFF4350 : 0xFFFF4350);
  Color get userXStandardsProgressBackground =>
      Color(isDark.value ? 0x00FFFFFF : 0x00FFFFFF);
  // #endregion

  // #region backgrounds
  Color get errorBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get welcomeBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get authBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get forgotPasswordBackground =>
      Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get homeBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get settingsBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get textViewerBackground =>
      Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  // #endregion
}

extension CustomWebColorScheme on ColorScheme {
  // #region textViewer
  Color get textViewerWebText => Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  // #endregion

  // #region auth
  Color get authWebTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authWebCard => Color(isDark.value ? 0xFF202020 : 0xFFFBFAF5);
  Color get authWebUserInputField =>
      Color(isDark.value ? 0xFF333333 : 0xFFEEEEEE);
  Color get authWebUserInputFieldText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get authWebUserInputFieldDecoration =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get authWebUserInputFieldIconDecoration =>
      Color(isDark.value ? 0xFF555555 : 0xFF888888);
  Color get authWebForgotPassword =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authWebPolicyAndTaC =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authWebGetStarted => Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get authWebGetStartedInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get authWebGetStartedText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get authWebSwitchPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authWebSwitchSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion
}

//Install extension '#region folding for VS Code'
extension CustomMobileColorScheme on ColorScheme {
  // #region textViewer
  Color get textViewerMobileText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  // #endregion

  // #region welcome
  Color get welcomeMobileTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get welcomeMobileCardText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get welcomeMobileCardSubText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get welcomeMobileGetStarted =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get welcomeMobileGetStartedInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get welcomeMobileGetStartedText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get welcomeMobileAccountAlready =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get welcomeMobileAccountAlreadyLogin =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region auth
  Color get authMobileUserInputField =>
      Color(isDark.value ? 0xFF333333 : 0xFFEEEEEE);
  Color get authMobileUserInputFieldText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get authMobileUserInputFieldBorder =>
      Color(isDark.value ? 0xFF333333 : 0xFFCCCCCC);
  Color get authMobileUserInputFieldDecoration =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get authMobileUserInputFieldIconDecoration =>
      Color(isDark.value ? 0xFF555555 : 0xFF888888);
  Color get authMobileForgotPassword =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authMobilePolicyAndTaC =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authMobileGetStarted =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get authMobileGetStartedInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get authMobileGetStartedText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get authMobileSwitchPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authMobileSwitchSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region forgotPass
  Color get forgotPasswordMobileTitle =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordMobileSubtitle =>
      Color(isDark.value ? 0xFF999999 : 0xFF999999);
  Color get forgotPasswordMobileUserInputField =>
      Color(isDark.value ? 0xFF333333 : 0xFFEEEEEE);
  Color get forgotPasswordMobileUserInputFieldText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordMobileUserInputFieldDecoration =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get forgotPasswordMobileUserInputFieldIconDecoration =>
      Color(isDark.value ? 0xFF555555 : 0xFF888888);
  Color get forgotPasswordMobileSend =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get forgotPasswordMobileSendInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get forgotPasswordMobileSendText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get forgotPasswordMobileResendPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordMobileResendSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region home
  Color get homeMobileNavigationBarBackground =>
      Color(isDark.value ? 0xFF323232 : 0xFFEDEDED);
  Color get homeMobileNavigationBarBackgroundSettings =>
      Color(isDark.value ? 0xFF222222 : 0xFFEDEDED);
  Color get homeMobileNavigationBarDot =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get homeMobileNavigationBarSelectedIcon =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get homeMobileNavigationBarUnselectedIcon =>
      Color(isDark.value ? 0xFF525252 : 0xFFBDBDBD);
  Color get homeMobileSettingsIcon =>
      Color(isDark.value ? 0xFF525252 : 0xFFBDBDBD);
  // #endregion

  // #region main
  Color get mainMobileCard => Color(isDark.value ? 0xBB323232 : 0xFFEDEDED);
  // #endregion

  // #region settings
  Color get settingsMobileTitle =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get settingsMobileProfileBackground =>
      Color(isDark.value ? 0xFF666666 : 0xFFCCCCCC);
  Color get settingsMobileProfileIcon =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get settingsMobileProfileName =>
      Color(isDark.value ? 0xFFAAAAAA : 0xFF444444);
  Color get settingsMobileProfileEmail =>
      Color(isDark.value ? 0xFFBBBBBB : 0xFF555555);
  Color get settingsMobileCard => Color(isDark.value ? 0xFF323232 : 0xFFEDEDED);
  Color get settingsMobileGroupTitle =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF444444);
  Color get settingsMobileRowText =>
      Color(isDark.value ? 0xFF888888 : 0xFF555555);
  Color get settingsMobileSwitchActiveThumb =>
      Color(isDark.value ? 0xFFFF4350 : 0xFFFF4350);
  Color get settingsMobileSwitchActiveTrack =>
      Color(isDark.value ? 0xFFFF4350 : 0xFFFF8390);
  Color get settingsMobileSwitchInactiveThumb =>
      Color(isDark.value ? 0xFF939393 : 0xFF939393);
  Color get settingsMobileSwitchInactiveTrack =>
      Color(isDark.value ? 0xFFD3D3D3 : 0xFFD3D3D3);
  Color get settingsMobileDropdownBackground =>
      Color(isDark.value ? 0xFF666666 : 0xFFFFFFFF);
  Color get settingsMobileDropdownText =>
      Color(isDark.value ? 0xFFBBBBBB : 0xFF555555);
  Color get settingsMobileSignOut =>
      Color(isDark.value ? 0xFFFF4350 : 0xFFFF4350);
  Color get settingsMobileBoxBackground =>
      Color(isDark.value ? 0xFF424242 : 0xFFFBFAF5);
  Color get settingsMobileBoxText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  // #endregion
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
