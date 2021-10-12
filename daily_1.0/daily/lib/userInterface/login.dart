import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/userInterface/loginComponents.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(isDark
                      ? "lib/assets/login_backgroundDark.jpg"
                      : "lib/assets/login_background.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Responsive(
                desktop: loginScreenDesktop(context),
                tablet: loginScreenTablet(context),
                mobile: loginScreenMobile(context),
              ))),
    );
  }
}

loginScreenDesktop(BuildContext context) {
  return Column(
    children: [
      LoginUserInput(),
      LoginSocialIcons(),
    ],
  );
}

loginScreenTablet(BuildContext context) {
  return Column(
    children: [
      LoginUserInput(),
      LoginSocialIcons(),
    ],
  );
}

loginScreenMobile(BuildContext context) {
  return Container(
    constraints: BoxConstraints.expand(height: double.maxFinite),
    child: Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          right: MediaQuery.of(context).size.width * 0.5,
          child: LoginTitle(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          child: LoginUserInput(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.9,
          child: LoginSocialIcons(),
        ),
      ],
    ),
  );
}
