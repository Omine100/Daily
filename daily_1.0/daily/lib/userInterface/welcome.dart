import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/userInterface/welcomeComponents.dart';
import 'package:daily/themesLocal/positions.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(isDark
                      ? "lib/assets/welcome_backgroundDark.jpg"
                      : "lib/assets/welcome_background.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  constraints: BoxConstraints.expand(height: double.maxFinite),
                  child: Responsive(
                    desktop: WelcomeScreenDesktop(context),
                    tablet: WelcomeScreenTablet(context),
                    mobile: WelcomeScreenMobile(context),
                  )))),
    );
  }
}

WelcomeScreenDesktop(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
        child: WelcomeTitle(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
        child: WelcomeUserInput(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
        child: WelcomeAccountAlready(),
      ),
    ],
  );
}

WelcomeScreenTablet(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
        child: WelcomeTitle(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
        child: WelcomeUserInput(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
        child: WelcomeAccountAlready(),
      ),
    ],
  );
}

WelcomeScreenMobile(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
        child: WelcomeTitle(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileUserInputTop),
        child: WelcomeUserInput(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileAccountAlreadyTop),
        child: WelcomeAccountAlready(),
      ),
    ],
  );
}
