import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colorSchemes.dart';

ThemeData lightThemeData = ThemeData(
  colorScheme: ,
  typography: ,
);

ThemeData lightThemeDataExtension = lightThemeData.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    CustomColors.light,
  ],
);

ThemeData darkThemeData = ThemeData(
  colorScheme: ,
  typography: ,
);

ThemeData darkThemeDataExtension = darkThemeData.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    CustomColors.dark,
  ],
);
