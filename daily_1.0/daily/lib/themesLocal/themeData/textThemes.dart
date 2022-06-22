import 'package:flutter/material.dart';

TextTheme lightTextTheme = TextTheme(
    titleSmall: TextStyle(
        color: Color(0xFF333333), fontSize: 48.0, fontWeight: FontWeight.w500),
    subtitle1: TextStyle(
        color: Color(0xFF999999), fontSize: 18.0, fontWeight: FontWeight.w300),
    subtitle2: TextStyle(
        color: Color(0xFF333333), fontSize: 14, fontWeight: FontWeight.w400),
    headline1: TextStyle(
        color: Color(0xFF444444), fontSize: 22, fontWeight: FontWeight.w500),
    bodyText1: TextStyle(
        color: Color(0xFF555555), fontSize: 18, fontWeight: FontWeight.w300),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    button: TextStyle(
        color: Color(0xFFFFFFFF), fontSize: 20, fontWeight: FontWeight.w500));

TextTheme darkTextTheme = TextTheme(
    titleSmall: TextStyle(
        color: Color(0xFFCCCCCC), fontSize: 48.0, fontWeight: FontWeight.w500),
    subtitle1: TextStyle(
        color: Color(0xFF999999), fontSize: 18.0, fontWeight: FontWeight.w300),
    subtitle2: TextStyle(
        color: Color(0xFFCCCCCC), fontSize: 14, fontWeight: FontWeight.w400),
    headline1: TextStyle(
        color: Color(0xFFCCCCCC), fontSize: 22, fontWeight: FontWeight.w500),
    bodyText1: TextStyle(
        color: Color(0xFF888888), fontSize: 18, fontWeight: FontWeight.w300),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    button: TextStyle(
        color: Color(0xFFCCCCCC), fontSize: 20, fontWeight: FontWeight.w500));

@immutable
class CustomTextThemes extends ThemeExtension<CustomTextThemes> {
  const CustomTextThemes({
    @required this.inputField,
    @required this.subtitle2Underlined,
  });

  final TextStyle inputField;
  final TextStyle subtitle2Underlined;

  @override
  CustomTextThemes copyWith({
    TextStyle inputField,
    TextStyle subtitle2Underlined,
  }) {
    return CustomTextThemes(
      inputField: inputField ?? this.inputField,
      subtitle2Underlined: subtitle2Underlined ?? this.subtitle2Underlined,
    );
  }

  @override
  CustomTextThemes lerp(ThemeExtension<CustomTextThemes> other, double t) {
    if (other is! CustomTextThemes) {
      return this;
    }
    return CustomTextThemes(
        inputField: TextStyle(), subtitle2Underlined: TextStyle());
  }

  static const light = CustomTextThemes(
    inputField: TextStyle(
        color: Color(0xFFCCCCCC), fontSize: 20, fontWeight: FontWeight.w300),
    subtitle2Underlined: TextStyle(
        color: Color(0xFF333333),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline),
  );

  static const dark = CustomTextThemes(
    inputField: TextStyle(
        color: Color(0xFF000000), fontSize: 20, fontWeight: FontWeight.w300),
    subtitle2Underlined: TextStyle(
        color: Color(0xFFCCCCCC),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline),
  );
}
