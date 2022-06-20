import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colorSchemes.dart';
import 'package:daily/themesLocal/typography.dart';

ThemeData lightThemeData = ThemeData(
  colorScheme: lightColorScheme,
  typography: typography,
  textTheme: ,
);

ThemeData lightThemeDataExtension = lightThemeData.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    CustomColors.light,
  ],
);

ThemeData darkThemeData = ThemeData(
  colorScheme: darkColorScheme,
  typography: typography,
);

ThemeData darkThemeDataExtension = darkThemeData.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    CustomColors.dark,
  ],
);
