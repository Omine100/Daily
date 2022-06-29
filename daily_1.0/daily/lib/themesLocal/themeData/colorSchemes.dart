import 'package:flutter/material.dart';

ColorScheme lightColorScheme = ColorScheme(
  primary: Color(0xFFFFFFFF),
  onPrimary: Color(0xFF333333), //Title
  secondary: Color(0xFFFF4350), //Accent
  onSecondary: Color(0xFF999999), //Subtitle
  background: Color(0xFFFBFAF5),
  onBackground: Color(0xFF555555),
  primaryContainer: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xFF555555),
  secondaryContainer: Color(0xFFFBFAF5),
  onSecondaryContainer: Color(0xFF888888),
  surface: Color(0xFFFF4350), //Button
  onSurface: Color(0xFFCCCCCC), //TextOnButton
  surfaceTint: Color(0xFFFF9999), //Inkwell
  inverseSurface: Color(0xFF939393),
  onInverseSurface: Color(0xFFD3D3D3),
  surfaceVariant: Color(0xFF202020), //ButtonDeactivated
  onSurfaceVariant: Color(0xFFFFFFFF), //TextOnButton
  error: Color(0xFFFF4350),
  onError: Color(0xFFFFFFFF), //TextOnError
  brightness: Brightness.light,
);

ColorScheme darkColorScheme = ColorScheme(
  primary: Color(0xFF000000),
  onPrimary: Color(0xFFCCCCCC), //Title
  secondary: Color(0xFFFF4350), //Accent
  onSecondary: Color(0xFF999999), //Subtitle
  background: Color(0xFF121212),
  onBackground: Color(0xFFCCCCCC),
  primaryContainer: Color(0xFF202020),
  onPrimaryContainer: Color(0xFFCCCCCC),
  secondaryContainer: Color(0xFF333333),
  onSecondaryContainer: Color(0xFF555555),
  surface: Color(0xFFEF5350), //Button
  onSurface: Color(0xFFCCCCCC), //TextOnButton
  surfaceTint: Color(0xFFFF5350), //Inkwell
  inverseSurface: Color(0xFF939393),
  onInverseSurface: Color(0xFFD3D3D3),
  surfaceVariant: Color(0xFF323232), //ButtonDeactivated
  onSurfaceVariant: Color(0xFFCCCCCC), //TextOnButton
  error: Color(0xFFFF4350),
  onError: Color(0xFFFFFFFF), //TextOnError
  tertiary: Color(0xFF66BB6A),
  brightness: Brightness.dark,
);
