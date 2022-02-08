import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/userInterface/settings.dart';

RouteNavigation routeNavigation = new RouteNavigation();

Widget homeSettings(BuildContext context) {
  return IconButton(
      onPressed: () {
        routeNavigation.routePage(context, SettingsScreen());
      },
      icon: Icon(Icons.settings_outlined,
          size: 40, color: Theme.of(context).colorScheme.homeSettingsIcon));
}
