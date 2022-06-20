import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

TextTheme lightTextTheme = TextTheme(
  headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
);

TextTheme darkTextTheme = TextTheme(
  headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
);

@immutable
class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  const CustomTextTheme({
    @required this.success,
  });

  final TextStyle success;

  @override
  CustomTextTheme copyWith({
    TextStyle success,
  }) {
    return CustomTextTheme(
      success: success ?? this.success,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomTextTheme lerp(ThemeExtension<CustomTextTheme> other, double t) {
    if (other is! CustomTextTheme) {
      return this;
    }
    return CustomTextTheme(
      success: TextStyle(),
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomTextTheme('
      'success: $success';

  // the light theme
  static const light = CustomTextTheme(
    success: TextStyle(),
  );

  // the dark theme
  static const dark = CustomTextTheme(
    success: TextStyle(),
  );
}
