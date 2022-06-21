import 'package:flutter/material.dart';

ColorScheme lightColorScheme = ColorScheme(
  primary: Color(0xFFFFFFFF),
  onPrimary: Color(0xFF333333), //Title
  secondary: Color(0xFFFF4350), //Accent
  onSecondary: Color(0xFF999999), //Subtitle
  background: Color(0xFFFBFAF5),
  onBackground: Color(0xFF333333), //TextOnBackground
  primaryContainer: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xFF9E9E9E), //TextOnContainer
  secondaryContainer: Color(0xFFFBFAF5),
  onSecondaryContainer: Color(0xFF9E9E9E), //TextOnContainer
  surface: Color(0xFFFF4350), //Button
  onSurface: Color(0xFFCCCCCC), //TextOnButton
  surfaceTint: Color(0xFFFF9999), //Inkwell
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
  onBackground: Color(0xFFCCCCCC), //TextOnBackground
  primaryContainer: Color(0xFF202020),
  onPrimaryContainer: Color(0xFF9E9E9E), //TextOnContainer
  secondaryContainer: Color(0xFF121212),
  onSecondaryContainer: Color(0xFF9E9E9E), //TextOnContainer
  surface: Color(0xFFEF5350), //Button
  onSurface: Color(0xFFCCCCCC), //TextOnButton
  surfaceTint: Color(0xFFFF5350), //Inkwell
  surfaceVariant: Color(0xFF323232), //ButtonDeactivated
  onSurfaceVariant: Color(0xFFCCCCCC), //TextOnButton
  error: Color(0xFFFF4350),
  onError: Color(0xFFFFFFFF), //TextOnError
  brightness: Brightness.dark,
);

extension CustomColorScheme on ColorScheme {
  Color get success => const Color(0xFF28a745);
  Color get info => const Color(0xFF17a2b8);
  Color get warning => const Color(0xFFffc107);
  Color get danger => const Color(0xFFdc3545);
}

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

  // Controls how the properties change on theme changes
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
