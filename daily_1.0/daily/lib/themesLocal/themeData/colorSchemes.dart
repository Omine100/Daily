import 'package:flutter/material.dart';

//Divider can just be 'onPrimary, etc.'

ColorScheme lightColorScheme = ColorScheme(
  primary: Color(0xFFFFFFFF),
  onPrimary: Color(0xFF333333), //Title
  secondary: Color(0xFFFF4350), //Accent
  onSecondary: Color(0xFF999999), //Subtitle
  background: Color(0xFFFBFAF5),
  onBackground: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFBFAF5),
  onSecondaryContainer: Color(0xFF9E9E9E),
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
  onBackground: Color(0xFF202020),
  primaryContainer: Color(0xFF202020),
  onPrimaryContainer: Color(0xFF202020),
  secondaryContainer: Color(0xFF121212),
  onSecondaryContainer: Color(0xFF9E9E9E),
  surface: Color(0xFFEF5350), //Button
  onSurface: Color(0xFFCCCCCC), //TextOnButton
  surfaceTint: Color(0xFFFF5350), //Inkwell
  inverseSurface: Color(0xFF939393),
  onInverseSurface: Color(0xFFD3D3D3),
  surfaceVariant: Color(0xFF323232), //ButtonDeactivated
  onSurfaceVariant: Color(0xFFCCCCCC), //TextOnButton
  error: Color(0xFFFF4350),
  onError: Color(0xFFFFFFFF), //TextOnError
  brightness: Brightness.dark,
);

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    @required this.success,
    @required this.icon,
  });

  final Color success;
  final Color icon;

  @override
  CustomColors copyWith({
    Color success,
    Color icon,
  }) {
    return CustomColors(
      success: success ?? this.success,
      icon: icon ?? this.icon,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors> other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      success: Color.lerp(success, (other as CustomColors).success, t),
      icon: Color.lerp(icon, (other as CustomColors).icon, t),
    );
  }

  static const light = CustomColors(
    success: Color(0xFF66BB6A),
    icon: Color(0xFF888888),
  );

  static const dark = CustomColors(
    success: Color(0xFF66BB6A),
    icon: Color(0xFF555555),
  );
}
