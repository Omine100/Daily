import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/userInterface/welcomeComponents.dart';

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
                      ? "lib/assets/Welcome_backgroundDark.jpg"
                      : "lib/assets/Welcome_background.png"),
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
  return Column(
    children: [
      WelcomeUserInput(),
      WelcomeSocialIcons(),
    ],
  );
}

WelcomeScreenTablet(BuildContext context) {
  return Column(
    children: [
      WelcomeUserInput(),
      WelcomeSocialIcons(),
    ],
  );
}

WelcomeScreenMobile(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.065,
        right: MediaQuery.of(context).size.width * 0.475,
        child: WelcomeTitle(),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.75,
        child: WelcomeUserInput(),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.925,
        child: WelcomeAccountAlready(),
      ),
    ],
  );
}
