import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/settings.dart';

RouteNavigation routeNavigation = new RouteNavigation();

Widget homeTitle(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    child: Text(
      "Home",
      style: TextStyle(
          color: Theme.of(context).colorScheme.homeTitle,
          fontSize: 30,
          fontWeight: FontWeight.w300),
    ),
  );
}

Widget homeSettings(BuildContext context) {
  return IconButton(
      onPressed: () {
        routeNavigation.routePage(context, SettingsScreen());
      },
      icon: Icon(Icons.settings_outlined,
          size: 45, color: Theme.of(context).colorScheme.homeSettingsIcon));
}
