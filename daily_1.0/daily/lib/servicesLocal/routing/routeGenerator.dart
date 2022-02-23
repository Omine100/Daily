import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/routing/routeDeclarations.dart';
import 'package:daily/userInterface/home.dart';

RouteDeclarations routesName = new RouteDeclarations();

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteDeclarations.WELCOME_PAGE:
        return _GeneratePageRoute(
            widget: HomeScreen(), routeName: settings.name);
      case RouteDeclarations.AUTH_PAGE:
        return _GeneratePageRoute(
            widget: HomeScreen(), routeName: settings.name);
            case RouteDeclarations.FORGOTPASSWORD_PAGE:
        return _GeneratePageRoute(
            widget: HomeScreen(), routeName: settings.name);
            case RouteDeclarations.HOME_PAGE:
        return _GeneratePageRoute(
            widget: HomeScreen(), routeName: settings.name);
            case RouteDeclarations.IMAGEVIEWER_PAGE:
        return _GeneratePageRoute(
            widget: HomeScreen(), routeName: settings.name);
            case RouteDeclarations.TEXTVIEWER_PAGE:
        return _GeneratePageRoute(
            widget: HomeScreen(), routeName: settings.name);
      default:
        return _GeneratePageRoute(
            widget: HomeScreen(), routeName: settings.name);
    }
  }
