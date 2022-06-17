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
  Color get authBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get forgotPasswordBackground =>
      Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get verifyBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get baseBackground => Color(isDark.value ? 0xFF121212 : 0xFF121212);
  Color get settingsBackground => Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get textViewerBackground =>
      Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  // #endregion
}

extension CustomWebColorScheme on ColorScheme {
  // #region textViewer
  Color get textViewerWebText => Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  // #endregion

  // #region error
  Color get errorWebCardContainer =>
      Color(isDark.value ? 0xFF202020 : 0xFFFBFAF5);
  Color get errorWebTitle => Color(isDark.value ? 0xFF777777 : 0xFF333333);
  Color get errorWebSubtitle => Color(isDark.value ? 0xFF111111 : 0xFFFFFFFF);
  Color get errorWebText => Color(isDark.value ? 0xFF999999 : 0xFF333333);
  // #endregion

  // #region auth
  Color get authWebTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authWebCardContainer =>
      Color(isDark.value ? 0xFF202020 : 0xFFFBFAF5);
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
  Color get authWebGetStartedDeactived =>
      Color(isDark.value ? 0xFF323232 : 0xFF202020);
  Color get authWebGetStartedInkWellDeactivated =>
      Color(isDark.value ? 0xFF777777 : 0xFF000000);
  Color get authWebSwitchPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authWebSwitchSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region forgotPassword
  Color get forgotPasswordWebTitle =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordWebSubtitle =>
      Color(isDark.value ? 0xFF999999 : 0xFF999999);
  Color get forgotPasswordWebUserInputField =>
      Color(isDark.value ? 0xFF333333 : 0xFFEEEEEE);
  Color get forgotPasswordWebUserInputFieldText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordWebUserInputFieldDecoration =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  Color get forgotPasswordWebUserInputFieldIconDecoration =>
      Color(isDark.value ? 0xFF555555 : 0xFF888888);
  Color get forgotPasswordWebSend =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get forgotPasswordWebSendInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get forgotPasswordWebSendText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get forgotPasswordWebSendDeactived =>
      Color(isDark.value ? 0xFF323232 : 0xFF202020);
  Color get forgotPasswordWebSendInkWellDeactivated =>
      Color(isDark.value ? 0xFF777777 : 0xFF000000);
  Color get forgotPasswordWebResendPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordWebResendSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get forgotPasswordWebRemembered =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  // #endregion

  // #region verify
  Color get verifyWebTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get verifyWebSubtitle => Color(isDark.value ? 0xFF999999 : 0xFF999999);
  Color get verifyWebLogin => Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get verifyWebLoginInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get verifyWebLoginText => Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get verifyWebResendPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get verifyWebResendSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get verifyWebSwitchBack =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  // #endregion

  // #region base
  Color get baseWebAppBarBackground =>
      Color(isDark.value ? 0xFF121212 : 0xFFFBFAF5);
  Color get baseWebAppBarBackgroundSettings =>
      Color(isDark.value ? 0xFF222222 : 0xFFEDEDED);
  Color get baseWebAppBarDot => Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get baseWebAppBarSelectedIcon =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get baseWebAppBarUnselectedIcon =>
      Color(isDark.value ? 0xFF525252 : 0xFFBDBDBD);
  Color get baseWebDrawerBackground =>
      Color(isDark.value ? 0xFF121212 : 0xFF121212);
  Color get baseWebDrawerItem => Color(isDark.value ? 0xFFCCCCCC : 0xFF555555);
  Color get baseWebSettingsIcon =>
      Color(isDark.value ? 0xFF525252 : 0xFFBDBDBD);
  Color get baseWebProfileBackground =>
      Color(isDark.value ? 0xFF666666 : 0xFFCCCCCC);
  Color get baseWebProfileIcon => Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get baseWebProfileName => Color(isDark.value ? 0xFFCCCCCC : 0xFF444444);
  Color get baseWebProfileEmail =>
      Color(isDark.value ? 0xFFBBBBBB : 0xFF555555);
  Color get baseWebCardContainer =>
      Color(isDark.value ? 0xFF202020 : 0xFFFFFFFF);
  // #endregion
}

//Install extension '#region folding for VS Code'
extension CustomMobileColorScheme on ColorScheme {
  // #region textViewer
  Color get textViewerMobileText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF000000);
  // #endregion

  // #region auth
  Color get authMobileTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get authMobileCarContainer =>
      Color(isDark.value ? 0xFF202020 : 0xFFFBFAF5);
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
  Color get authMobileGetStartedDeactived =>
      Color(isDark.value ? 0xFF323232 : 0xFF202020);
  Color get authMobileGetStartedInkWellDeactivated =>
      Color(isDark.value ? 0xFF777777 : 0xFF000000);
  Color get authMobileGetStartedText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get authMobileSwitchPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authMobileSwitchSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get authMobileCardText => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get authMobileCardSubText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  // #endregion

  // #region forgotPassword
  Color get forgotPasswordMobileTitle =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordMobileSubtitle =>
      Color(isDark.value ? 0xFF999999 : 0xFF999999);
  Color get forgotPasswordMobileUserInputField =>
      Color(isDark.value ? 0xFF333333 : 0xFFEEEEEE);
  Color get forgotPasswordMobileUserInputFieldText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordMobileUserInputFieldBorder =>
      Color(isDark.value ? 0xFF333333 : 0xFFCCCCCC);
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
  Color get forgotPasswordMobileSendDeactived =>
      Color(isDark.value ? 0xFF323232 : 0xFF202020);
  Color get forgotPasswordMobileSendInkWellDeactivated =>
      Color(isDark.value ? 0xFF777777 : 0xFF000000);
  Color get forgotPasswordMobileResendPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get forgotPasswordMobileResendSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region verify
  Color get verifyMobileTitle => Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get verifyMobileSubtitle =>
      Color(isDark.value ? 0xFF999999 : 0xFF999999);
  Color get verifyMobileLogin => Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  Color get verifyMobileLoginInkWell =>
      Color(isDark.value ? 0xFFFF5350 : 0xFFFF9999);
  Color get verifyMobileLoginText =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get verifyMobileResendPrimary =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFF333333);
  Color get verifyMobileResendSecondary =>
      Color(isDark.value ? 0xFFEF5350 : 0xFFFF4350);
  // #endregion

  // #region base
  Color get baseMobileNavigationBarBackground =>
      Color(isDark.value ? 0xFF323232 : 0xFFEDEDED);
  Color get baseMobileNavigationBarBackgroundSettings =>
      Color(isDark.value ? 0xFF222222 : 0xFFEDEDED);
  Color get baseMobileNavigationBarDot =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get baseMobileNavigationBarSelectedIcon =>
      Color(isDark.value ? 0xFFCCCCCC : 0xFFFFFFFF);
  Color get baseMobileNavigationBarUnselectedIcon =>
      Color(isDark.value ? 0xFF525252 : 0xFFBDBDBD);
  Color get baseMobileSettingsIcon =>
      Color(isDark.value ? 0xFF525252 : 0xFFBDBDBD);
  // #endregion

  // #region home
  Color get homeMobileCard => Color(isDark.value ? 0xBB323232 : 0xFFEDEDED);
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
