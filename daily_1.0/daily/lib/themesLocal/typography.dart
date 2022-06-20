import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Typography typography = Typography(
  black: BlackTextTheme,
  white: WhiteTextTheme,
  englishLike: EnglishLikeTextTheme,
  dense: DenseTextTheme,
  tall: TallTextTheme,
);
//Can I extend textTheme?

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

TextTheme BlackTextTheme = TextTheme(
  headline1: TextStyle(
    debugLabel: 'BlackTextTheme headline1',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  headline2: TextStyle(
    debugLabel: 'BlackTextTheme headline2',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  headline3: TextStyle(
    debugLabel: 'BlackTextTheme headline3',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  headline4: TextStyle(
    debugLabel: 'BlackTextTheme headline4',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  headline5: TextStyle(
    debugLabel: 'BlackTextTheme headline5',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  headline6: TextStyle(
    debugLabel: 'BlackTextTheme headline6',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  bodyText1: TextStyle(
    debugLabel: 'BlackTextTheme bodyText1',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  bodyText2: TextStyle(
    debugLabel: 'BlackTextTheme bodyText2',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  subtitle1: TextStyle(
    debugLabel: 'BlackTextTheme subtitle1',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  subtitle2: TextStyle(
    debugLabel: 'BlackTextTheme subtitle2',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.black,
    decoration: TextDecoration.none,
  ),
  caption: TextStyle(
    debugLabel: 'BlackTextTheme caption',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  button: TextStyle(
    debugLabel: 'BlackTextTheme button',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  overline: TextStyle(
    debugLabel: 'BlackTextTheme overline',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.black,
    decoration: TextDecoration.none,
  ),
);

TextTheme WhiteTextTheme = TextTheme(
  headline1: TextStyle(
    debugLabel: 'WhiteTextTheme headline1',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  headline2: TextStyle(
    debugLabel: 'WhiteTextTheme headline2',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  headline3: TextStyle(
    debugLabel: 'WhiteTextTheme headline3',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  headline4: TextStyle(
    debugLabel: 'WhiteTextTheme headline4',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  headline5: TextStyle(
    debugLabel: 'WhiteTextTheme headline5',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  headline6: TextStyle(
    debugLabel: 'WhiteTextTheme headline6',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  bodyText1: TextStyle(
    debugLabel: 'WhiteTextTheme bodyText1',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  bodyText2: TextStyle(
    debugLabel: 'WhiteTextTheme bodyText2',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  subtitle1: TextStyle(
    debugLabel: 'WhiteTextTheme subtitle1',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  subtitle2: TextStyle(
    debugLabel: 'WhiteTextTheme subtitle2',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  caption: TextStyle(
    debugLabel: 'WhiteTextTheme caption',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  button: TextStyle(
    debugLabel: 'WhiteTextTheme button',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  overline: TextStyle(
    debugLabel: 'WhiteTextTheme overline',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
);

TextTheme EnglishLikeTextTheme = const TextTheme(
  headline1: TextStyle(
      debugLabel: 'EnglishLikeTextTheme headline1',
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: -1.5),
  headline2: TextStyle(
      debugLabel: 'EnglishLikeTextTheme headline2',
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: -0.5),
  headline3: TextStyle(
      debugLabel: 'EnglishLikeTextTheme headline3',
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.0),
  headline4: TextStyle(
      debugLabel: 'EnglishLikeTextTheme headline4',
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.25),
  headline5: TextStyle(
      debugLabel: 'EnglishLikeTextTheme headline5',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.0),
  headline6: TextStyle(
      debugLabel: 'EnglishLikeTextTheme headline6',
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.15),
  bodyText1: TextStyle(
      debugLabel: 'EnglishLikeTextTheme bodytext1',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.5),
  bodyText2: TextStyle(
      debugLabel: 'EnglishLikeTextTheme bodyText2',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.25),
  subtitle1: TextStyle(
      debugLabel: 'EnglishLikeTextTheme subtitle1',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.15),
  subtitle2: TextStyle(
      debugLabel: 'EnglishLikeTextTheme subtitle2',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.1),
  button: TextStyle(
    debugLabel: 'EnglishLikeTextTheme button',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 1.25,
  ),
  caption: TextStyle(
    debugLabel: 'EnglishLikeTextTheme caption',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0.4,
  ),
  overline: TextStyle(
      debugLabel: 'EnglishLikeTextTheme overline',
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 1.5),
);

TextTheme DenseTextTheme = const TextTheme(
  headline1: TextStyle(
      debugLabel: 'DenseTextTheme headline1',
      fontSize: 96.0,
      fontWeight: FontWeight.w100,
      textBaseline: TextBaseline.ideographic),
  headline2: TextStyle(
      debugLabel: 'DenseTextTheme headline2',
      fontSize: 60.0,
      fontWeight: FontWeight.w100,
      textBaseline: TextBaseline.ideographic),
  headline3: TextStyle(
      debugLabel: 'DenseTextTheme headline3',
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic),
  headline4: TextStyle(
      debugLabel: 'DenseTextTheme headline4',
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic),
  headline5: TextStyle(
      debugLabel: 'DenseTextTheme headline5',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic),
  headline6: TextStyle(
      debugLabel: 'DenseTextTheme headline6',
      fontSize: 21.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic),
  bodyText1: TextStyle(
      debugLabel: 'DenseTextTheme bodyText1',
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic),
  bodyText2: TextStyle(
      debugLabel: 'DenseTextTheme bodyText2',
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic),
  subtitle1: TextStyle(
      debugLabel: 'DenseTextTheme subtitle1',
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic),
  subtitle2: TextStyle(
      debugLabel: 'DenseTextTheme subtitle2',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic),
  button: TextStyle(
      debugLabel: 'DenseTextTheme button',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic),
  caption: TextStyle(
      debugLabel: 'DenseTextTheme caption',
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic),
  overline: TextStyle(
      debugLabel: 'DenseTextTheme overline',
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic),
);

TextTheme TallTextTheme = const TextTheme(
  headline1: TextStyle(
      debugLabel: 'TallTextTheme headline1',
      fontSize: 96.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
  headline2: TextStyle(
      debugLabel: 'TallTextTheme headline2',
      fontSize: 60.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
  headline3: TextStyle(
      debugLabel: 'TallTextTheme headline3',
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
  headline4: TextStyle(
      debugLabel: 'TallTextTheme headline4',
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
  headline5: TextStyle(
      debugLabel: 'TallTextTheme headline5',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
  headline6: TextStyle(
      debugLabel: 'TallTextTheme headline6',
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.alphabetic),
  bodyText1: TextStyle(
      debugLabel: 'TallTextTheme bodyText1',
      fontSize: 17.0,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.alphabetic),
  bodyText2: TextStyle(
      debugLabel: 'TallTextTheme bodyText2',
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
  subtitle1: TextStyle(
      debugLabel: 'TallTextTheme subtitle1',
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
  subtitle2: TextStyle(
      debugLabel: 'TallTextTheme subtitle2',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic),
  button: TextStyle(
      debugLabel: 'TallTextTheme button',
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.alphabetic),
  caption: TextStyle(
      debugLabel: 'TallTextTheme caption',
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
  overline: TextStyle(
      debugLabel: 'TallTextTheme overline',
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic),
);
