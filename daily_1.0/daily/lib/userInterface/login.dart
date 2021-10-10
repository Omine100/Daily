import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
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
      child: isLargeDevice
          ? loginScreenLargeLayout(context)
          : loginScreenSmallLayout(context),
    );
  }
}

loginScreenLargeLayout(BuildContext context) {
  return Container(
    child: Text("Large"),
  );
}

loginScreenSmallLayout(BuildContext context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          RouteNavigation().routePage(context, HomeScreen());
        },
        child: Container(
          child: Text("Small"),
        ),
      ),
    ],
  );
}
