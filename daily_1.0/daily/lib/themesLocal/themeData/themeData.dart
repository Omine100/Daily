import 'package:flutter/material.dart';
import 'package:daily/themesLocal/themeData/colorSchemes.dart';
import 'package:daily/themesLocal/themeData/textThemes.dart';

ThemeData lightThemeData = ThemeData(
  colorScheme: lightColorScheme,
  textTheme: lightTextTheme,
);

ThemeData lightThemeDataExtension = lightThemeData.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    CustomColors.light,
    CustomTextTheme.light,
  ],
);

ThemeData darkThemeData = ThemeData(
  colorScheme: darkColorScheme,
  textTheme: darkTextTheme,
);

ThemeData darkThemeDataExtension = darkThemeData.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    CustomColors.dark,
    CustomTextTheme.dark,
  ],
);
