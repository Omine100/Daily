import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Responsive(
          desktop: loginScreenDesktop(context),
          tablet: loginScreenTablet(context),
          mobile: loginScreenMobile(context),
        ));
  }
}

loginScreenDesktop(BuildContext context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          RouteNavigation().routePage(context, HomeScreen());
        },
        child: Container(
          child: Text("Desktop"),
        ),
      ),
    ],
  );
}

loginScreenTablet(BuildContext context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          RouteNavigation().routePage(context, HomeScreen());
        },
        child: Container(
          child: Text("Tablet"),
        ),
      ),
    ],
  );
}

loginScreenMobile(BuildContext context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          RouteNavigation().routePage(context, HomeScreen());
        },
        child: Container(
          child: Text("Mobile"),
        ),
      ),
    ],
  );
}
