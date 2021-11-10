import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/utilities/designUtil/glassmorphism/glassmorphism.dart';

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: getDimension(
          context, false, Theme.of(context).visualDensity.welcomeTitleWidth),
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

class LoginUserInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}
