import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
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
            image: AssetImage("lib/assets/login_background.png"),
            fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Responsive(
            desktop: loginScreenDesktop(context),
            tablet: loginScreenTablet(context),
            mobile: loginScreenMobile(context),
          ))
      ),
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
  return Column(
    children: [
      LoginUserInput(),
      LoginSocialIcons(),
    ],
  );
}
