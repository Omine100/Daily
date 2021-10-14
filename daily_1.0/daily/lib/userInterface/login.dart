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
              child: Container(
                  constraints: BoxConstraints.expand(height: double.maxFinite),
                  child: Responsive(
                    desktop: loginScreenDesktop(context),
                    tablet: loginScreenTablet(context),
                    mobile: loginScreenMobile(context),
                  )))),
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
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.065,
        right: MediaQuery.of(context).size.width * 0.475,
        child: LoginTitle(),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.75,
        child: LoginUserInput(),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.925,
        child: LoginAccountAlready(),
      ),
    ],
  );
}
