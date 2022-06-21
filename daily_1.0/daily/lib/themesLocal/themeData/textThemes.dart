import 'package:flutter/material.dart';

TextTheme lightTextTheme = TextTheme(
  titleSmall: TextStyle(
      color: Color(0xFF333333), fontSize: 48.0, fontWeight: FontWeight.w500),
  subtitle1: TextStyle(
      color: Color(0xFF999999), fontSize: 18.0, fontWeight: FontWeight.w300),
  headline1: TextStyle(
      color: Color(0xFF444444), fontSize: 22, fontWeight: FontWeight.w500),
  bodyText1: TextStyle(
      color: Color(0xFF555555), fontSize: 18, fontWeight: FontWeight.w300),
  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
);

TextTheme darkTextTheme = TextTheme(
  titleSmall: TextStyle(
      color: Color(0xFFCCCCCC), fontSize: 48.0, fontWeight: FontWeight.w500),
  subtitle1: TextStyle(
      color: Color(0xFF999999), fontSize: 18.0, fontWeight: FontWeight.w300),
  headline1: TextStyle(
      color: Color(0xFFCCCCCC), fontSize: 22, fontWeight: FontWeight.w500),
  bodyText1: TextStyle(
      color: Color(0xFF888888), fontSize: 18, fontWeight: FontWeight.w300),
  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
);

@immutable
class CustomTextThemes extends ThemeExtension<CustomTextThemes> {
  const CustomTextThemes({
    @required this.inputField,
  });

  final TextStyle inputField;

  @override
  CustomTextThemes copyWith({
    TextStyle inputField,
  }) {
    return CustomTextThemes(
      inputField: inputField ?? this.inputField,
    );
  }

  @override
  CustomTextThemes lerp(ThemeExtension<CustomTextThemes> other, double t) {
    if (other is! CustomTextThemes) {
      return this;
    }
    return CustomTextThemes(
      inputField: TextStyle(),
    );
  }

  static const light = CustomTextThemes(
    inputField: TextStyle(
        color: Color(0xFFCCCCCC), fontSize: 20, fontWeight: FontWeight.w300),
  );

  static const dark = CustomTextThemes(
    inputField: TextStyle(
        color: Color(0xFF000000), fontSize: 20, fontWeight: FontWeight.w300),
  );
}
