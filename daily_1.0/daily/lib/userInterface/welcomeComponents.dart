import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/utilities/designUtil/glassmorphism/glassmorphism.dart';

class WelcomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: getDimension(context, false, Theme.of(context).visualDensity.welcomeTitleWidth),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, "welcomeTitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeTitle,
            fontSize: Theme.of(context).textTheme.welcomeTitle,
            fontWeight: Theme.of(context).typography.welcomeTitle,
          ),
        ),
        Text(
          getTranslated(context, "welcomeSubtitle"),
          style: TextStyle(
              color: Theme.of(context).colorScheme.welcomeSubtitle,
              fontSize: Theme.of(context).textTheme.welcomeSubtitle,
              fontWeight: Theme.of(context).typography.welcomeSubtitle,
            ),
        ),
      ],
    ),
    );
  }
}

class WelcomeGetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        getTranslated(context, "welcomeGetStarted"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.welcomeGetStarted,
          fontSize: Theme.of(context).textTheme.welcomeGetStarted,
          fontWeight: Theme.of(context).typography.welcomeGetStarted,
        ),
      ),
    ).addWrapperGlass(
      borderRadius: 50,
      height: getDimension(context, true, Theme.of(context).visualDensity.welcomeGetStartedGlassHeight),
      width: getDimension(context, false, Theme.of(context).visualDensity.welcomeGetStartedGlassWidth),
      shadowBlur: 80,
      shadowColor: Theme.of(context).colorScheme.welcomeGetStartedGlass,
      containerSpread: 16,
      backdropBlur: 8,
      colorOpacity: 0.3,
    );
  }
}

class WelcomeAccountAlready extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        getTranslated(context, "welcomeAccountAlready"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.welcomeAccountAlready,
          fontSize: Theme.of(context).textTheme.welcomeAccounAlready,
          fontWeight: Theme.of(context).typography.welcomeAccountAlready,
        ),
      ),
    );
  }
}