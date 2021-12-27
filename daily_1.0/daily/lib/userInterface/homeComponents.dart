import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/userInterface/settings.dart';

Widget homeTitle(BuildContext context) {
  return GestureDetector(
    onTap: () {
      RouteNavigation().routePage(context, SettingsScreen());
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Home",
        style: TextStyle(
            color: Colors.red, fontSize: 30, fontWeight: FontWeight.w300),
      ),
    ),
  );
}
